-- KyaUI: seleccion multiple para retirar subastas propias.
--
-- Va en la pestana "Auctions" de la casa de subastas de BLIZZARD (AuctionFrameAuctions), que
-- es donde salen TODAS tus subastas de golpe. El otro modulo (AuctionatorCancel.lua) trabaja
-- dentro de los paneles de Auctionator, y ahi una fila es un PRECIO de un objeto concreto;
-- aqui una fila es UNA subasta.
--
-- OJO: todo el texto que ve el usuario va en INGLES. Los comentarios, en espanol.
--
-- Formas de marcar:
--  - Clic en la casilla de la esquina del icono.
--  - Ctrl + clic izquierdo en la fila: alterna esa sola.
--  - Shift + clic izquierdo en la fila: marca el rango desde la ultima que tocaste.
--
-- Diseno visual (elegido sobre maqueta):
--  - La marca va en la ESQUINA del icono del objeto, no en una columna aparte, para que la
--    lista no se desplace ni un pixel.
--  - Se pasa por S:HandleCheckBox de ElvUI para que tenga el mismo aspecto que el resto de
--    la interfaz.
--  - No se crea ningun boton nuevo: se reaprovecha el "Cancel Auction" de Blizzard.
--
-- Notas que condicionan el diseno:
--  - Las filas son AuctionsButton1..NUM_AUCTIONS_TO_DISPLAY (9) y se reciclan al hacer
--    scroll. El indice real de una fila es FauxScrollFrame_GetOffset(AuctionsScrollFrame)+i.
--  - El marcado se guarda por INDICE absoluto y con la identidad de la subasta al lado. El
--    scroll cambia el offset pero no los indices, asi que aguanta solo. Lo que si los
--    invalida es que la lista cambie, y eso llega como AUCTION_OWNED_LIST_UPDATE: ahi
--    Reresolve() vuelve a localizar cada marcada por su identidad.
--  - El servidor solo retira UNA subasta por pulsacion. Ver el comentario de CancelNext().
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)
local S = E:GetModule('Skins', true)

-- Tamano y posicion de la marca respecto a la esquina inferior derecha del icono.
-- Si queda pisando algo o muy despegada, estos son los tres numeros a tocar.
local CHECK_SIZE = 16
local CHECK_X = 3
local CHECK_Y = -3

local checks = {}
local rowOrigOnClick = {}
-- [indice absoluto en la lista "owner"] = identidad de esa subasta
local selected = {}
local selectedCount = 0
-- Ancla del rango: ultima fila tocada. Se guarda tambien su identidad para poder
-- recolocarla cuando la lista cambia, igual que se hace con la seleccion.
local anchorIndex
local anchorId
local eventFrame
local hintShown

-- el boton de Blizzard que reaprovechamos, y su aspecto original para poder restaurarlo
local cancelBtn, origText, origWidth, origOnClick

-- solo para el diagnostico de /kyaui atr auctions
local setupResult = 'not run yet'
local hooked = false
local refreshCount = 0

local function NumRows()
	return NUM_AUCTIONS_TO_DISPLAY or 9
end

local function TabIsShown()
	return (AuctionFrameAuctions and AuctionFrameAuctions:IsShown()) and true or false
end

-- saleStatus (13o valor) == 1 significa que ya se vendio: esa no se puede retirar.
local function IsCancellable(index)
	local name, _, _, _, _, _, _, _, _, _, _, _, saleStatus = GetAuctionItemInfo('owner', index)
	if not name then return false end
	return saleStatus ~= 1
end

-- Identidad de una subasta. La API de 3.3.5a no da ningun ID unico, asi que se compara por
-- objeto + tamano de pila + precios. Dos subastas identicas son intercambiables.
local function IdentityOf(index)
	local name, _, count, _, _, _, minBid, _, buyout, _, _, _, saleStatus = GetAuctionItemInfo('owner', index)
	if not name then return nil end
	return { name = name, count = count, minBid = minBid, buyout = buyout, sold = saleStatus == 1 }
end

local function SetAnchor(index)
	anchorIndex = index
	anchorId = index and IdentityOf(index) or nil
end

local function ClearSelection()
	selected = {}
	selectedCount = 0
	anchorIndex = nil
	anchorId = nil
end

local function SetSelected(index, on)
	if on then
		if not selected[index] and IsCancellable(index) then
			local id = IdentityOf(index)
			if id then
				selected[index] = id
				selectedCount = selectedCount + 1
			end
		end
	else
		if selected[index] then
			selected[index] = nil
			selectedCount = selectedCount - 1
		end
	end
end

-- Reaprovecha el "Cancel Auction" de Blizzard en vez de anadir otro boton al pie.
-- Se llama SIEMPRE despues de AuctionFrameAuctions_Update (via RefreshChecks), porque esa
-- funcion reescribe el texto y el estado del boton por su cuenta.
local function UpdateButton()
	if not cancelBtn then return end

	if selectedCount > 0 then
		cancelBtn:SetText('Cancel Selected (' .. selectedCount .. ')')

		-- el texto nuevo es mas largo que "Cancel Auction": se ensancha lo justo
		local fs = cancelBtn:GetFontString()
		local w = fs and fs:GetStringWidth() or 0
		cancelBtn:SetWidth(math.max(origWidth or 0, w + 24))

		cancelBtn:Enable()
	else
		cancelBtn:SetText(origText or CANCEL_AUCTION or 'Cancel Auction')
		if origWidth then cancelBtn:SetWidth(origWidth) end
		-- sin marcadas no se toca Enable/Disable: lo gestiona Blizzard segun la fila elegida
	end
end

-- se llama tras cada repintado de la lista (scroll, cambio de pestana, actualizacion)
local function RefreshChecks()
	refreshCount = refreshCount + 1

	local numItems = GetNumAuctionItems('owner')
	local offset = FauxScrollFrame_GetOffset(AuctionsScrollFrame)
	local shown = TabIsShown()

	for i = 1, NumRows() do
		local check = checks[i]
		local row = _G['AuctionsButton' .. i]

		if check and row then
			local index = offset + i

			if shown and row:IsShown() and index <= numItems and IsCancellable(index) then
				check.index = index
				check:SetChecked(selected[index] and true or false)
				check:Show()
			else
				check.index = nil
				check:Hide()
			end
		end
	end

	UpdateButton()
end

local function OnCheckClick(self)
	local index = self.index
	if not index then return end

	SetSelected(index, self:GetChecked() and true or false)
	SetAnchor(index)
	UpdateButton()
end

-- Indice absoluto que muestra ahora mismo una fila, o nil si esa fila esta vacia.
local function IndexOfRow(row)
	local i = row and row.kyaRow
	if not i then return nil end

	local index = FauxScrollFrame_GetOffset(AuctionsScrollFrame) + i
	if index > GetNumAuctionItems('owner') then return nil end
	return index
end

-- De donde parte el rango de un Shift+clic.
-- Si hay ancla explicita, esa. Si no, se deduce de lo que ya este marcado: la marcada mas
-- cercana a donde se pincho. Asi, aunque el ancla se haya perdido, extender una seleccion
-- que ya existia funciona a la primera, que es lo que hace Windows.
local function ResolveAnchor(index)
	if anchorIndex then return anchorIndex end

	local best, bestDist
	for idx in pairs(selected) do
		local d = idx > index and (idx - index) or (index - idx)
		if not bestDist or d < bestDist then
			best, bestDist = idx, d
		end
	end

	return best
end

-- Ctrl+clic alterna una sola. Shift+clic actua sobre el rango entero desde el ancla, y
-- funciona como interruptor: si TODO lo retirable del rango ya esta marcado lo desmarca, y
-- si falta algo lo marca entero.
local function OnModifierClick(row)
	local index = IndexOfRow(row)
	if not index or not IsCancellable(index) then return end

	if IsShiftKeyDown() then
		local from = ResolveAnchor(index)

		-- sin ancla y sin nada marcado no hay rango posible: se comporta como Ctrl
		if not from then
			SetSelected(index, not selected[index])
			SetAnchor(index)
			RefreshChecks()
			return
		end

		local a, b = from, index
		if a > b then a, b = b, a end

		local allSelected = true
		for idx = a, b do
			if IsCancellable(idx) and not selected[idx] then
				allSelected = false
				break
			end
		end

		for idx = a, b do
			SetSelected(idx, not allSelected)
		end

		-- El ancla no se mueve, para poder ampliar el rango con varios Shift+clic seguidos.
		-- Si venia deducida de la seleccion, se fija ahora para que el siguiente parta de ahi.
		if not anchorIndex then SetAnchor(from) end
	else
		SetSelected(index, not selected[index])
		SetAnchor(index)
	end

	RefreshChecks()
end

-- Tras cada actualizacion de la lista los indices guardados pueden apuntar a otra subasta
-- (una se retiro, otra se vendio, el orden cambio). Se vuelve a localizar cada marcada por
-- su identidad y se reconstruye la seleccion con los indices nuevos; las que ya no estan se
-- caen solas. 'used' evita que dos marcadas identicas caigan en la misma fila.
local function Reresolve()
	local n = GetNumAuctionItems('owner')

	-- El ancla se recoloca por identidad igual que la seleccion. Antes se borraba a secas, y
	-- como AUCTION_OWNED_LIST_UPDATE llega tambien cuando el servidor reenvia la lista por su
	-- cuenta, el ancla desaparecia sola: el primer Shift+clic no hacia rango y habia que darlo
	-- dos veces. Aqui no se mira saleStatus, porque el ancla es solo un punto de referencia.
	if anchorId then
		local found
		for i = 1, n do
			local name, _, count, _, _, _, minBid, _, buyout = GetAuctionItemInfo('owner', i)
			if name == anchorId.name and count == anchorId.count
				and minBid == anchorId.minBid and buyout == anchorId.buyout then
				found = i
				break
			end
		end

		anchorIndex = found
		if not found then anchorId = nil end
	else
		anchorIndex = nil
	end

	if selectedCount == 0 then return end

	local used, newSel, newCount = {}, {}, 0

	for _, id in pairs(selected) do
		for i = 1, n do
			if not used[i] then
				local name, _, count, _, _, _, minBid, _, buyout, _, _, _, saleStatus = GetAuctionItemInfo('owner', i)
				if name == id.name and count == id.count and minBid == id.minBid
					and buyout == id.buyout and saleStatus ~= 1 then
					used[i] = true
					newSel[i] = id
					newCount = newCount + 1
					break
				end
			end
		end
	end

	selected = newSel
	selectedCount = newCount
end

-- El unico nombre de subframe de la fila que esta confirmado en este cliente es la textura
-- del icono (lo usa ElvUI_Enhanced\Modules\Misc\AlreadyKnown.lua). El boton que la contiene
-- se saca de ahi con GetParent() en vez de adivinar su nombre; si algo falla, la marca se
-- ancla a la fila entera y sigue funcionando.
local function IconAnchor(i)
	local tex = _G['AuctionsButton' .. i .. 'ItemIconTexture']
	local parent = tex and tex.GetParent and tex:GetParent()
	return parent or _G['AuctionsButton' .. i]
end

local function CreateChecks()
	for i = 1, NumRows() do
		local anchor = IconAnchor(i)

		if anchor and not checks[i] then
			local check = CreateFrame('CheckButton', 'KyaUIAuctionCheck' .. i, anchor, 'UICheckButtonTemplate')

			-- El skin de ElvUI ANTES de fijar el tamano: HandleCheckBox reemplaza texturas.
			-- El segundo argumento (noBackdrop) es IMPRESCINDIBLE aqui. Sin el, ElvUI crea un
			-- backdrop aparte y lo mete 4 px por cada lado (frame.backdrop:SetInside(nil,4,4)),
			-- asi que en una casilla de 16 px el cuadro visible se queda en 8 y, con las
			-- texturas originales ya quitadas por StripTextures(), no se ve nada. Con
			-- noBackdrop el borde va sobre el propio frame y se aprovecha el tamano entero.
			if S and S.HandleCheckBox then
				pcall(S.HandleCheckBox, S, check, true)
			end

			check:SetWidth(CHECK_SIZE)
			check:SetHeight(CHECK_SIZE)
			check:ClearAllPoints()
			-- centrada sobre la esquina del icono: se monta un poco encima a proposito
			check:SetPoint('CENTER', anchor, 'BOTTOMRIGHT', CHECK_X, CHECK_Y)
			check:SetHitRectInsets(0, 0, 0, 0)
			check:SetFrameLevel(anchor:GetFrameLevel() + 5)
			check:Hide()
			check:SetScript('OnClick', OnCheckClick)

			checks[i] = check
		end
	end
end

-- Se sustituye el OnClick de cada fila en vez de engancharlo con HookScript: con un hook la
-- accion original correria igual y Ctrl/Shift+clic ademas cambiaria la fila seleccionada de
-- Blizzard. Sin modificador se llama al original y todo sigue como siempre.
--
-- Solo se toma la FILA, no el boton del icono que va encima: ahi Shift+clic sigue metiendo
-- el enlace del objeto en el chat, que es lo que espera cualquiera.
local function TakeOverRows()
	for i = 1, NumRows() do
		local row = _G['AuctionsButton' .. i]

		if row and rowOrigOnClick[i] == nil then
			row.kyaRow = i
			rowOrigOnClick[i] = row:GetScript('OnClick') or false

			row:SetScript('OnClick', function(self, button, ...)
				if button == 'LeftButton' and (IsControlKeyDown() or IsShiftKeyDown()) then
					OnModifierClick(self)
					return
				end

				-- Clic normal: la accion de Blizzard sigue corriendo (selecciona la fila),
				-- pero ademas se fija el ancla. Asi basta con pinchar el primero y hacer
				-- Shift+clic en el ultimo, sin tener que dar Shift tambien en el primero.
				-- No se marca nada aqui a proposito: el clic normal es el de Blizzard, y
				-- ponerse a marcar/desmarcar con el se pisaria con su seleccion de fila.
				if button == 'LeftButton' then
					local index = IndexOfRow(self)
					if index then SetAnchor(index) end
				end

				local orig = rowOrigOnClick[self.kyaRow]
				if orig then orig(self, button, ...) end
			end)
		end
	end
end

-- UNA POR PULSACION. Medido contra el servidor (Rexxar - CoA): mandando 3 CancelAuction()
-- seguidas dentro del mismo clic solo se retira 1; con 2 marcadas, tambien 1. No es la
-- proteccion de la funcion (las llamadas salen sin error): es el servidor, que procesa una
-- sola por accion del usuario. Y encolarlas con E:Delay tampoco vale, porque entonces la
-- llamada deja de colgar de un evento de hardware y salta
--   "AddOn 'KyaUI' prevented the call of the secure function 'CancelAuction()'"
--
-- Asi que cada pulsacion retira UNA y baja el contador: marcas 5 y pulsas 5 veces.
--
-- Se retira siempre el indice MAS ALTO primero: quitar el indice N no desplaza a los que
-- estan por debajo, asi que el resto de la seleccion sigue apuntando bien hasta que
-- Reresolve() la recoloca contra la lista nueva.
local function CancelNext()
	local best
	for index in pairs(selected) do
		if not best or index > best then best = index end
	end

	if not best then return end

	CancelAuction(best)

	selected[best] = nil
	selectedCount = selectedCount - 1
	UpdateButton()

	if not hintShown and selectedCount > 0 then
		hintShown = true
		E:Print('|cffff5555KyaUI|r: the server only cancels |cffffff00one auction per click|r.'
			.. ' Click the button again for the next one.')
	end
end

local function TakeOverCancelButton()
	cancelBtn = _G['AuctionsCancelAuctionButton']
	if not cancelBtn or origOnClick ~= nil then return end

	origText = cancelBtn:GetText()
	origWidth = cancelBtn:GetWidth()
	origOnClick = cancelBtn:GetScript('OnClick') or false

	cancelBtn:SetScript('OnClick', function(self, ...)
		if selectedCount > 0 then
			CancelNext()
		elseif origOnClick then
			origOnClick(self, ...)
		end
	end)
end

-- Intenta montarlo. Devuelve true cuando ya esta hecho (o no hay nada que esperar).
local function TrySetup()
	if checks[1] then return true end

	-- AuctionsButton1 y AuctionFrameAuctions_Update pertenecen a Blizzard_AuctionUI, que es
	-- LoadOnDemand: no existen hasta que se abre la casa de subastas por primera vez.
	if not (_G['AuctionsButton1'] and type(_G.AuctionFrameAuctions_Update) == 'function') then
		setupResult = 'waiting for the auction house to open'
		return false
	end

	CreateChecks()
	TakeOverRows()
	TakeOverCancelButton()

	hooksecurefunc('AuctionFrameAuctions_Update', RefreshChecks)
	hooked = true

	setupResult = 'OK'
	return true
end

-- Punto de entrada (se llama desde Code.lua en el login)
function KyaUI:SetupAuctionsMultiCancel()
	if not eventFrame then
		eventFrame = CreateFrame('Frame')
		eventFrame:RegisterEvent('ADDON_LOADED')
		eventFrame:RegisterEvent('AUCTION_HOUSE_SHOW')
		eventFrame:RegisterEvent('AUCTION_HOUSE_CLOSED')
		eventFrame:RegisterEvent('AUCTION_OWNED_LIST_UPDATE')

		eventFrame:SetScript('OnEvent', function(self, event, addon)
			if event == 'ADDON_LOADED' then
				if addon == 'Blizzard_AuctionUI' then TrySetup() end
				return
			end

			if event == 'AUCTION_HOUSE_CLOSED' then
				ClearSelection()
				UpdateButton()   -- devuelve el boton a "Cancel Auction"
				return
			end

			if event == 'AUCTION_HOUSE_SHOW' then
				TrySetup()
				return
			end

			-- AUCTION_OWNED_LIST_UPDATE: la lista cambio (nuestro propio cancelado, una venta,
			-- una subasta nueva). La seleccion tiene que sobrevivir entre clic y clic, asi que
			-- se recolocan los indices por identidad y solo se cae lo que ya no esta.
			Reresolve()
			if checks[1] then RefreshChecks() end
		end)
	end

	TrySetup()
end

-- /kyaui atr auctions : por que no salen las casillas en la pestana Auctions
function KyaUI:DiagnoseAuctionsCancel()
	local function yesno(v) return v and '|cff00ff00yes|r' or '|cffff5555no|r' end

	E:Print('|cffff5555KyaUI|r [auctions] --- setup ---')
	E:Print('  state: ' .. setupResult
		.. ' | checks: ' .. (checks[1] and NumRows() or 0)
		.. ' | hook: ' .. yesno(hooked)
		.. ' | button taken over: ' .. yesno(origOnClick ~= nil)
		.. ' | ElvUI skin: ' .. yesno(S ~= nil and S.HandleCheckBox ~= nil))
	E:Print('  list redraws seen: ' .. refreshCount)

	E:Print('|cffff5555KyaUI|r [auctions] --- right now ---')

	if not _G['AuctionsButton1'] then
		E:Print('  Blizzard_AuctionUI is not loaded. Open the auction house.')
		return
	end

	local numItems, total = GetNumAuctionItems('owner')
	local shownChecks = 0
	for i = 1, NumRows() do
		if checks[i] and checks[i]:IsShown() then shownChecks = shownChecks + 1 end
	end

	E:Print('  Auctions tab visible: ' .. yesno(TabIsShown())
		.. ' | your auctions: ' .. tostring(numItems) .. '/' .. tostring(total))
	E:Print('  checks visible: ' .. shownChecks .. ' | selected: ' .. selectedCount)

	if not TabIsShown() then
		E:Print('  |cffffff00You are on another tab.|r Click "Auctions" in the auction house.')
	elseif numItems == 0 then
		E:Print('  |cffffff00You have no auctions posted|r, so there is nothing to check.')
	elseif shownChecks == 0 then
		E:Print('  |cffff5555You have auctions but no checks are visible|r - that is a bug.')
	end
end
