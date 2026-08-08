-- KyaUI: seleccion multiple para cancelar subastas en Auctionator.
--
-- Anade una casilla a cada fila de la lista y un boton "Cancelar marcadas (N)" junto al
-- "Cancel Auctions" propio del addon. No se toca Auctionator: todo se engancha desde aqui.
--
-- Notas del modelo de datos de Auctionator, que condicionan el diseno:
--  - El XML define AuctionatorEntry1..15, pero las tres vistas de la lista solo usan las 12
--    primeras (todas hacen "while (line < 12)"). Las filas 13-15 no se muestran nunca.
--  - El repintado reasigna que dato muestra cada fila y guarda el indice con SetID(), asi
--    que row:GetID() da el indice dentro de activeScan.sortedData.
--  - Como las filas se reciclan al hacer scroll, el marcado NO se puede guardar por numero
--    de fila: se guarda por identidad (item + precio de compra + tamano de pila).
--  - Una fila NO es una subasta suelta, es un precio: Atr_CancelAuction_ByIndex cancela
--    TODAS tus subastas que coincidan con ese precio y pila. Es como ya se comporta el
--    boton original de Auctionator.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

local NUM_ROWS = 12
local CHECK_SIZE = 16

local checks = {}      -- [n] = CheckButton de la fila n
local selected = {}     -- [clave] = { buyoutPrice = , stackSize = }
local selectedCount = 0
local scanKey            -- para descartar la seleccion al cambiar de escaneo
local cancelButton
local queue, working

-- estado del arranque, solo para el diagnostico de /kyaui atr cancel.
-- Van aqui arriba a proposito: RefreshChecks los toca y en Lua un local declarado mas
-- abajo no lo ve una funcion definida antes (se leeria como global).
local setupResult = 'sin ejecutar'
local hookedViews = 0
local refreshCount = 0

local function Scan()
    local pane = _G.gCurrentPane
    return pane and pane.activeScan
end

-- identidad estable de una fila dentro del escaneo actual
local function KeyOf(data)
    if not data then return end
    local scan = Scan()
    local name = (scan and scan.itemName) or '?'
    return name .. '|' .. tostring(data.buyoutPrice) .. '|' .. tostring(data.stackSize)
end

local function DataAt(index)
    local scan = Scan()
    if not (scan and scan.sortedData) then return end
    return scan.sortedData[index]
end

-- solo tiene sentido en la vista de tus subastas
local function ListIsMine()
    if type(_G.Atr_ShowingCurrentAuctions) ~= 'function' then return false end
    return _G.Atr_ShowingCurrentAuctions() and true or false
end

local function UpdateButton()
    if not cancelButton then return end

    if selectedCount > 0 then
        cancelButton:SetText('Cancel Marked (' .. selectedCount .. ')')
        cancelButton:Enable()
    else
        cancelButton:SetText('Cancel Marked')
        cancelButton:Disable()
    end

    if ListIsMine() then cancelButton:Show() else cancelButton:Hide() end
end

local function ClearSelection()
    selected = {}
    selectedCount = 0
    UpdateButton()
end

-- se llama tras cada repintado: las filas cambian de contenido al hacer scroll u ordenar
local function RefreshChecks()
    refreshCount = refreshCount + 1

    -- si cambio el escaneo (otro item), la seleccion anterior ya no significa nada
    local scan = Scan()
    local key = scan and (tostring(scan.itemName) .. '|' .. tostring(scan.whenScanned)) or nil
    if key ~= scanKey then
        scanKey = key
        ClearSelection()
    end

    local mine = ListIsMine()

    for n = 1, NUM_ROWS do
        local check = checks[n]
        local row = _G['AuctionatorEntry' .. n]

        if check and row then
            local data = row:IsShown() and mine and DataAt(row:GetID()) or nil

            if data and data.yours then
                local k = KeyOf(data)
                check.key = k
                check.data = data
                check:SetChecked(selected[k] and true or false)
                check:Show()
            else
                check.key = nil
                check.data = nil
                check:Hide()
            end
        end
    end

    UpdateButton()
end

local function OnCheckClick(self)
    local k = self.key
    if not k then return end

    if self:GetChecked() then
        if not selected[k] then
            selected[k] = { buyoutPrice = self.data.buyoutPrice, stackSize = self.data.stackSize }
            selectedCount = selectedCount + 1
        end
    else
        if selected[k] then
            selected[k] = nil
            selectedCount = selectedCount - 1
        end
    end

    UpdateButton()
end

local function CreateChecks()
    for n = 1, NUM_ROWS do
        local row = _G['AuctionatorEntry' .. n]

        if row and not checks[n] then
            local check = CreateFrame('CheckButton', 'KyaUIAtrCheck' .. n, row, 'UICheckButtonTemplate')
            check:SetWidth(CHECK_SIZE)
            check:SetHeight(CHECK_SIZE)
            -- el primer contenido de la fila empieza en x=22, asi que aqui hay hueco libre
            check:SetPoint('LEFT', row, 'LEFT', 2, 0)
            check:SetHitRectInsets(0, 0, 0, 0)
            check:Hide()
            check:SetScript('OnClick', OnCheckClick)
            checks[n] = check
        end
    end
end

-- Busca la fila que corresponde a una identidad guardada. Hace falta recalcularlo en cada
-- paso: al cancelar, Auctionator reordena sortedData y los indices de antes ya no valen.
local function FindIndex(entry)
    local scan = Scan()
    if not (scan and scan.sortedData) then return end

    for i = 1, #scan.sortedData do
        local d = scan.sortedData[i]
        if d and d.yours and d.buyoutPrice == entry.buyoutPrice and d.stackSize == entry.stackSize then
            return i
        end
    end
end

local ProcessNext

-- Se cancela de una en una y se espera entre medias: cada CancelAuction() invalida los
-- indices de la lista del servidor, asi que encadenarlas sin pausa se lia.
ProcessNext = function()
    if not queue or #queue == 0 then
        working = nil
        queue = nil
        ClearSelection()
        if type(_G.Atr_RedisplayAuctions) == 'function' then _G.Atr_RedisplayAuctions() end
        E:Print('|cffff5555KyaUI|r: auctions cancelled.')
        return
    end

    local entry = table.remove(queue, 1)
    local index = FindIndex(entry)

    if index and type(_G.Atr_CancelAuction_ByIndex) == 'function' then
        _G.Atr_CancelAuction_ByIndex(index)
    end

    E:Delay(0.6, ProcessNext)
end

local function StartCancelling()
    if working then return end

    queue = {}
    for _, entry in pairs(selected) do
        queue[#queue + 1] = entry
    end

    if #queue == 0 then return end

    working = true
    E:Print('|cffff5555KyaUI|r: cancelling ' .. #queue .. ' selected price(s)...')
    ProcessNext()
end

StaticPopupDialogs['KYAUI_ATR_CANCEL_SELECTED'] = {
    text = 'KyaUI: cancel the marked auctions?\n\n|cffffff00%d|r price(s) selected.\nThis cancels ALL of your auctions at those prices.',
    button1 = 'Cancel Auctions',
    button2 = 'No',
    OnAccept = function() StartCancelling() end,
    timeout = 0,
    whileDead = 1,
    hideOnEscape = 1,
    preferredIndex = 3,
}

local function CreateCancelButton()
    local anchor = _G['Atr_CancelSelectionButton']
    if not anchor or cancelButton then return end

    cancelButton = CreateFrame('Button', 'KyaUIAtrCancelSelectedButton', anchor:GetParent(), 'UIPanelButtonTemplate')
    cancelButton:SetWidth(150)
    cancelButton:SetHeight(22)
    cancelButton:SetPoint('BOTTOM', anchor, 'TOP', 0, 3)
    -- objetos de fuente, no sus nombres: en 3.3.5a estas funciones esperan el objeto
    cancelButton:SetNormalFontObject(GameFontNormalSmall)
    cancelButton:SetHighlightFontObject(GameFontHighlightSmall)
    cancelButton:SetDisabledFontObject(GameFontDisableSmall)
    cancelButton:SetScript('OnClick', function()
        if selectedCount > 0 then
            StaticPopup_Show('KYAUI_ATR_CANCEL_SELECTED', selectedCount)
        end
    end)
    cancelButton:Hide()
end

-- Hay DOS caminos que repintan la lista y no pasan uno por el otro:
--   Atr_RedisplayAuctions()  <- scroll de la lista (Auctionator.xml, OnVerticalScroll)
--   Atr_UpdateUI()           <- el idle del addon, cuando gCurrentPane.UINeedsUpdate
-- Los dos acaban llamando a una de las funciones de vista, asi que se enganchan esas y no
-- los despachadores: Atr_UpdateUI corre en cada tick y refrescar ahi seria tirar CPU.
-- Se enganchan tambien las vistas que NO son la nuestra: al cambiar de pestana hay que
-- esconder las casillas, y eso lo hace RefreshChecks via ListIsMine().
local VIEWS = {
    'Atr_ShowCurrentAuctions',
    'Atr_ShowSearchSummary',
    'Atr_ShowHistory',
    'Atr_ShowHints',
}

-- Intenta montarlo. Devuelve true cuando ya esta hecho (o no hay nada que hacer).
local function TrySetup()
    if checks[1] then return true end

    if not IsAddOnLoaded('Auctionator') then
        setupResult = 'abortado: Auctionator no esta cargado'
        return true   -- sin Auctionator no hay nada que esperar
    end

    -- AuctionatorEntry1..12 se declaran DENTRO de Atr_Sell_Template, que es virtual:
    -- no existen hasta que Auctionator construye su UI en Atr_Init(), y eso solo ocurre
    -- cuando carga Blizzard_AuctionUI (addon LoadOnDemand), o sea al abrir la casa de
    -- subastas por primera vez. En el login todavia no estan.
    if not _G['AuctionatorEntry1'] then
        setupResult = 'esperando a que abras la casa de subastas'
        return false
    end

    CreateChecks()
    CreateCancelButton()

    for i = 1, #VIEWS do
        if type(_G[VIEWS[i]]) == 'function' then
            hooksecurefunc(VIEWS[i], RefreshChecks)
            hookedViews = hookedViews + 1
        end
    end

    setupResult = 'OK'
    return true
end

-- Punto de entrada (se llama desde Code.lua en el login)
function KyaUI:SetupAuctionatorMultiCancel()
    if TrySetup() then return end

    -- Reintento: AUCTION_HOUSE_SHOW llega siempre DESPUES de que Auctionator haya montado
    -- su UI, asi que ahi los frames ya estan. Se escucha tambien ADDON_LOADED por si otro
    -- addon fuerza la carga de Blizzard_AuctionUI sin abrir la casa de subastas.
    local waiter = CreateFrame('Frame')
    waiter:RegisterEvent('AUCTION_HOUSE_SHOW')
    waiter:RegisterEvent('ADDON_LOADED')
    waiter:SetScript('OnEvent', function(self, event, addon)
        if event == 'ADDON_LOADED' and addon ~= 'Blizzard_AuctionUI' then return end

        if TrySetup() then
            self:UnregisterAllEvents()
            self:SetScript('OnEvent', nil)
        end
    end)
end

-- /kyaui atr cancel : por que no salen las casillas.
-- Hay que ejecutarlo CON la casa de subastas abierta y en la vista donde las esperas.
function KyaUI:DiagnoseAuctionatorCancel()
    local function yesno(v) return v and '|cff00ff00yes|r' or '|cffff5555no|r' end

    E:Print('|cffff5555KyaUI|r [atr cancel] --- setup ---')
    E:Print('  state: ' .. setupResult
        .. ' | checks: ' .. (checks[1] and NUM_ROWS or 0)
        .. ' | views hooked: ' .. hookedViews .. '/' .. #VIEWS
        .. ' | button: ' .. yesno(cancelButton ~= nil))
    E:Print('  list redraws seen: ' .. refreshCount)

    E:Print('|cffff5555KyaUI|r [atr cancel] --- right now ---')

    local pane = _G.gCurrentPane
    if not pane then
        E:Print('  |cffff5555gCurrentPane is nil|r: no Auctionator pane is active.')
        E:Print('  Open the auction house and go to an Auctionator tab.')
        return
    end

    local scan = pane.activeScan
    E:Print('  pane active: ' .. yesno(true)
        .. ' | "current auctions" view: ' .. yesno(ListIsMine())
        .. ' | scan loaded: ' .. yesno(scan ~= nil))

    if not scan then
        E:Print('  No scan yet. Look up one of your own items first (Sell or More tab).')
        return
    end

    local total = scan.sortedData and #scan.sortedData or 0
    local mine = 0
    if scan.sortedData then
        for i = 1, total do
            if scan.sortedData[i] and scan.sortedData[i].yours then mine = mine + 1 end
        end
    end

    local shownRows, shownChecks = 0, 0
    for n = 1, NUM_ROWS do
        local row = _G['AuctionatorEntry' .. n]
        if row and row:IsShown() then shownRows = shownRows + 1 end
        if checks[n] and checks[n]:IsShown() then shownChecks = shownChecks + 1 end
    end

    E:Print('  item: ' .. tostring(scan.itemName)
        .. ' | data rows: ' .. total
        .. ' | of those YOURS: ' .. mine)
    E:Print('  rows visible: ' .. shownRows .. ' | checks visible: ' .. shownChecks)

    if mine == 0 then
        E:Print('  |cffffff00None of these rows are yours|r, so there is nothing to check.')
        E:Print('  Checks only appear on rows marked "(yours)" - items YOU have posted.')
    elseif shownChecks == 0 then
        E:Print('  |cffff5555Rows are yours but no checks are visible|r - that is a bug.')
    end
end
