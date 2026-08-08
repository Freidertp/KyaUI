-- KyaUI: Enter/Esc en los dialogos de confirmacion de Auctionator.
-- Auctionator no captura teclado en sus confirmaciones (cancelar una subasta, comprar un
-- lote...), asi que ENTER cae en el binding global OPENCHAT y abre el chat en vez de
-- confirmar. Aqui se ligan ENTER/ESCAPE a dos botones ocultos mientras el dialogo esta
-- visible (override bindings) y se sueltan al ocultarse.
-- No se usa EnableKeyboard + OnKeyDown porque en 3.3.5a eso captura TODAS las teclas
-- mientras el frame esta visible (no existe SetPropagateKeyboardInput) y bloquea el
-- movimiento del personaje.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

local strfind = string.find

local dialogs = {}   -- descriptores registrados: { frame, accept, cancel, valid }
local current        -- descriptor que tiene las teclas ahora mismo
local pending        -- descriptor a ligar cuando se salga de combate
local acceptButton, cancelButton
local eventFrame

-- IsVisible() y no IsShown(): IsShown() devuelve la bandera PROPIA del frame, sin mirar a sus
-- padres. Blizzard cierra la casa de subastas ocultando AuctionFrame, asi que la pestana
-- AuctionFrameAuctions se queda con su bandera a true para siempre una vez la has visitado.
-- Con IsShown(), GetActive() seguia devolviendo ese descriptor con la subasta ya cerrada y
-- volvia a ligar ENTER a nuestro boton oculto: de ahi que Enter dejara de abrir el chat.
-- IsVisible() si tiene en cuenta la cadena de padres.

-- en 3.3.5a IsEnabled() puede devolver 1/0 en vez de true/false
local function IsButtonUsable(button)
	if not button or not button:IsVisible() then return false end
	local enabled = button:IsEnabled()
	return (enabled and enabled ~= 0) and true or false
end

local function IsUsable(info)
	if not (info.frame and info.frame:IsVisible()) then return false end
	if info.valid and not info.valid(info) then return false end
	return true
end

local function GetActive()
	if current and IsUsable(current) then return current end
	for i = 1, #dialogs do
		if IsUsable(dialogs[i]) then return dialogs[i] end
	end
end

-- Los override bindings son parte del sistema seguro: no se pueden tocar en combate.
local function ClearAll()
	if InCombatLockdown() then return end
	for i = 1, #dialogs do
		ClearOverrideBindings(dialogs[i].frame)
	end
end

function KyaUI:ClearAuctionatorKeys()
	current, pending = nil, nil
	ClearAll()
end

local function Debug(msg)
	if KyaUI.AuctionatorDebug then
		E:Print('|cffff5555KyaUI|r [atr] ' .. tostring(msg))
	end
end

local function Apply(info)
	current = info

	if InCombatLockdown() then
		pending = info
		return
	end

	pending = nil
	ClearAll()

	local frame = info.frame
	SetOverrideBindingClick(frame, true, 'ENTER', 'KyaUIAtrAcceptButton')
	SetOverrideBindingClick(frame, true, 'NUMPADENTER', 'KyaUIAtrAcceptButton')

	-- la pestana de subastas no toca ESCAPE: ahi Esc debe seguir cerrando la casa de subastas
	if not info.noEscape then
		SetOverrideBindingClick(frame, true, 'ESCAPE', 'KyaUIAtrCancelButton')
	end

	Debug('bindings aplicados en ' .. (frame:GetName() or '?')
		.. ' | ENTER=' .. tostring(GetBindingAction('ENTER'))
		.. ' | ESCAPE=' .. tostring(GetBindingAction('ESCAPE')))
end

local function Release(info)
	if pending == info then pending = nil end
	if current == info then current = nil end
	if InCombatLockdown() then return end

	ClearOverrideBindings(info.frame)

	-- si quedaba otro dialogo visible detras, devolverle las teclas
	local other = GetActive()
	if other then Apply(other) end
end

-- Abre el chat como haria ENTER. Se usa ChatEdit_ActivateChat y no RunBinding('OPENCHAT')
-- a proposito: esta via no pasa por ChatFrame_OpenChat, asi que no re-dispara el hook de
-- abajo y no hay bucle.
--
-- El cuadro de texto se pide con ChatEdit_ChooseBoxForSend(): es el unico que devuelve el
-- correcto cuando ElvUI ha reemplazado el chat. ChatEdit_GetActiveWindow() solo sirve si el
-- chat YA esta abierto (que es justo cuando no hace falta), y ChatFrameEditBox a secas no
-- tiene por que ser el que ElvUI usa. De ahi que Enter se quedara sin hacer nada.
local function OpenChat()
	if not ChatEdit_ActivateChat then return end

	local editBox = (ChatEdit_ChooseBoxForSend and ChatEdit_ChooseBoxForSend())
		or (ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow())
		or ChatFrameEditBox

	if editBox then
		ChatEdit_ActivateChat(editBox)
	end
end

-- Se llama desde los botones ocultos. Si no hay dialogo visible es que los bindings
-- quedaron colgados (p.ej. el frame se oculto en combate): se limpian y se ejecuta la
-- accion normal de la tecla para no dejar al usuario sin Enter ni Esc.
local function Dispatch(action, fallbackBinding)
	local info = GetActive()
	Debug(action .. ' -> ' .. (info and (info.frame:GetName() or '?') or 'sin dialogo'))

	if not info then
		KyaUI:ClearAuctionatorKeys()
		if fallbackBinding == 'OPENCHAT' then
			OpenChat()
		elseif fallbackBinding and not InCombatLockdown() then
			RunBinding(fallbackBinding)
		end
		return
	end

	local func = info[action]
	if func then func(info) end
	return true
end

local function CreateButtons()
	if acceptButton then return end

	acceptButton = CreateFrame('Button', 'KyaUIAtrAcceptButton', UIParent)
	acceptButton:SetSize(1, 1)
	acceptButton:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', 0, 0)
	acceptButton:SetAlpha(0)
	acceptButton:EnableMouse(false)
	acceptButton:RegisterForClicks('AnyUp')
	acceptButton:SetScript('OnClick', function() Dispatch('accept', 'OPENCHAT') end)

	cancelButton = CreateFrame('Button', 'KyaUIAtrCancelButton', UIParent)
	cancelButton:SetSize(1, 1)
	cancelButton:SetPoint('TOPLEFT', UIParent, 'TOPLEFT', 0, 0)
	cancelButton:SetAlpha(0)
	cancelButton:EnableMouse(false)
	cancelButton:RegisterForClicks('AnyUp')
	cancelButton:SetScript('OnClick', function() Dispatch('cancel', 'TOGGLEGAMEMENU') end)
end

-- Red de seguridad para ENTER. El cliente es custom y el override binding de ENTER puede no
-- llegar a aplicarse (el de ESCAPE si lo hace). Si el chat se abre con Enter mientras hay un
-- dialogo visible, se cierra el chat y se confirma. Solo actua con texto vacio, asi que "/"
-- (OPENCHATSLASH) y los enlaces al chat no se ven afectados.
local function HookChatFallback()
	if type(ChatFrame_OpenChat) ~= 'function' then return end

	hooksecurefunc('ChatFrame_OpenChat', function(text)
		if text and text ~= '' then return end
		if not GetActive() then return end

		local editBox = (ChatEdit_GetActiveWindow and ChatEdit_GetActiveWindow()) or ChatFrameEditBox
		if editBox then
			editBox:SetText('')
			if ChatEdit_DeactivateChat then
				ChatEdit_DeactivateChat(editBox)
			else
				editBox:ClearFocus()
				editBox:Hide()
			end
		end

		Debug('ENTER capturado por el fallback del chat')
		Dispatch('accept')
	end)
end

local function Register(frameName, accept, cancel, valid, noEscape)
	local frame = _G[frameName]
	if not frame then return end

	local info = { frame = frame, accept = accept, cancel = cancel, valid = valid, noEscape = noEscape }
	dialogs[#dialogs + 1] = info

	frame:HookScript('OnShow', function()
		if IsUsable(info) then Apply(info) end
	end)
	frame:HookScript('OnHide', function() Release(info) end)

	-- por si el dialogo ya estaba visible al registrarlo
	if IsUsable(info) then Apply(info) end

	return info
end

-- llama a una funcion global de Auctionator solo si sigue existiendo
local function Call(funcName, arg)
	local func = _G[funcName]
	if type(func) == 'function' then func(arg) end
end

local function RegisterAuctionatorDialogs()
	-- confirmacion al cancelar/retirar una subasta propia (Auctionator.xml:1204).
	-- Sus botones son anonimos, por eso se llama a la funcion directamente.
	Register('Atr_CancelAuction_Confirm_Frame',
		function() Call('Atr_CancelUndercut_Confirm', true) end,
		function() Call('Atr_CancelUndercut_Confirm', false) end)

	-- confirmacion de compra (Auctionator.xml:996). El boton "Buy" se deshabilita mientras
	-- la compra no es valida, asi que Enter no debe hacer nada en ese caso.
	Register('Atr_Buy_Confirm_Frame',
		function()
			if IsButtonUsable(_G['Atr_Buy_Confirm_OKBut']) then
				Call('Atr_Buy_Confirm_OK')
			end
		end,
		function() Call('Atr_Buy_Cancel') end)

	-- confirmacion generica (Auctionator.xml:70)
	Register('Atr_Confirm_Frame',
		function() Call('Atr_Confirm_Yes') end,
		function() Call('Atr_Confirm_No') end)

	-- aviso de error: cualquiera de las dos teclas lo cierra
	local errorFrame = _G['Atr_Error_Frame']
	if errorFrame then
		Register('Atr_Error_Frame',
			function() errorFrame:Hide() end,
			function() errorFrame:Hide() end)
	end
end

-- StaticPopups de Auctionator (ATR_NEW_SHOPPING_LIST, ATR_DEL_SHOPPING_LIST y cualquier
-- otro ATR_* futuro). Aqui los botones SI tienen nombre, asi que se pulsan directamente.
-- El popup con editbox no se ve afectado: mientras el editbox tiene el foco las teclas van
-- al editbox y no a los bindings.
-- Popups de Blizzard peligrosos: nunca se les ligan las teclas.
local BLOCKED_POPUPS = {
	DELETE_ITEM = true,
	DELETE_GOOD_ITEM = true,
	DELETE_QUEST_ITEM = true,
	DELETE_GOOD_QUEST_ITEM = true,
	CONFIRM_DELETE_EQUIPMENT_SET = true,
	CONFIRM_LOOT_DISTRIBUTION = true,
}

-- Se cubren los ATR_* siempre y, con la casa de subastas abierta, cualquier otro popup que
-- no sea destructivo: ahi las confirmaciones son de subastas (cancelar, comprar, pujar...).
-- Auctionator no genera todas: el confirmar de "retirar" puede venir de la UI de subastas.
local function PopupIsOurs(frame)
	local which = frame.which
	if type(which) ~= 'string' then return false end
	if BLOCKED_POPUPS[which] then return false end
	if strfind(which, '^ATR_') then return true end

	return (AuctionFrame and AuctionFrame:IsVisible()) and true or false
end

local function RegisterStaticPopups()
	local statics = {}

	for i = 1, (STATICPOPUP_NUMDIALOGS or 4) do
		local frameName = 'StaticPopup' .. i
		local frame = _G[frameName]

		if frame then
			local info = Register(frameName,
				function()
					local button = _G[frameName .. 'Button1']
					if IsButtonUsable(button) then button:Click() end
				end,
				function()
					local button = _G[frameName .. 'Button2']
					if IsButtonUsable(button) then
						button:Click()
					else
						frame:Hide()
					end
				end,
				function() return PopupIsOurs(frame) end)

			if info then statics[#statics + 1] = info end
		end
	end

	if #statics == 0 then return end

	-- StaticPopup reutiliza los mismos frames: si uno ya visible pasa a mostrar otro
	-- dialogo, el OnShow no vuelve a dispararse. Se re-evalua tras cada StaticPopup_Show.
	hooksecurefunc('StaticPopup_Show', function(which)
		Debug('StaticPopup_Show: ' .. tostring(which))

		for i = 1, #statics do
			local info = statics[i]
			if IsUsable(info) then
				Apply(info)
				return
			elseif current == info then
				Release(info)
			end
		end
	end)
end

-- Pestana "Subastas" de la casa de subastas: con un lote seleccionado, ENTER hace de
-- "Cancel Auction" (y saca la confirmacion, donde ENTER vuelve a confirmar). Asi el flujo
-- queda en: click al lote -> Enter -> Enter.
-- ESCAPE se deja en paz aqui (debe seguir cerrando la casa de subastas) y, si no hay nada
-- seleccionado, ENTER abre el chat como siempre.
local auctionsRegistered

local function RegisterAuctionHouse()
	if auctionsRegistered then return end
	if not (AuctionFrameAuctions and AuctionsCancelAuctionButton) then return end

	auctionsRegistered = Register('AuctionFrameAuctions',
		function()
			if IsButtonUsable(AuctionsCancelAuctionButton) then
				AuctionsCancelAuctionButton:Click()
			else
				OpenChat()
			end
		end,
		nil, nil, true) and true or nil
end

-- Reintento al salir de combate (en combate no se pueden tocar los override bindings) y
-- registro de la UI de subastas, que es un addon de carga diferida.
local function CreateEventFrame()
	if eventFrame then return end

	eventFrame = CreateFrame('Frame')
	eventFrame:RegisterEvent('PLAYER_REGEN_ENABLED')
	eventFrame:RegisterEvent('ADDON_LOADED')
	eventFrame:RegisterEvent('AUCTION_HOUSE_CLOSED')
	eventFrame:SetScript('OnEvent', function(self, event, addon)
		if event == 'ADDON_LOADED' then
			if addon == 'Blizzard_AuctionUI' then RegisterAuctionHouse() end
			return
		end

		-- Al cerrar la casa de subastas se sueltan las teclas SIEMPRE. Confiar solo en el
		-- OnHide de cada dialogo dejaba ENTER secuestrado si algun frame se ocultaba sin
		-- disparar su OnHide (o si se cerro en combate), y entonces Enter no abria el chat.
		if event == 'AUCTION_HOUSE_CLOSED' then
			KyaUI:ClearAuctionatorKeys()
			return
		end

		if pending and IsUsable(pending) then
			Apply(pending)
		else
			local info = GetActive()
			if info then Apply(info) else KyaUI:ClearAuctionatorKeys() end
		end
	end)
end

-- Punto de entrada (se llama desde Code.lua en el login, con todos los addons ya cargados).
function KyaUI:SetupAuctionatorKeys()
	if not IsAddOnLoaded('Auctionator') then return end
	if #dialogs > 0 then return end

	CreateButtons()
	CreateEventFrame()
	RegisterAuctionatorDialogs()
	RegisterStaticPopups()
	RegisterAuctionHouse()   -- por si Blizzard_AuctionUI ya estaba cargado
	HookChatFallback()
end

-- /kyaui atr : estado + traza en el chat (para diagnosticar)
function KyaUI:ToggleAuctionatorDebug()
	KyaUI.AuctionatorDebug = not KyaUI.AuctionatorDebug

	E:Print('|cffff5555KyaUI|r Auctionator: debug ' .. (KyaUI.AuctionatorDebug and 'ON' or 'OFF')
		.. ' | addon ' .. (IsAddOnLoaded('Auctionator') and 'loaded' or 'NOT loaded')
		.. ' | dialogs hooked: ' .. #dialogs
		.. ' | ENTER=' .. tostring(GetBindingAction('ENTER')))
end

-- /kyaui atr scan : lista los frames de dialogo visibles ahora mismo. Sirve para identificar
-- que popup concreto pide la confirmacion (abre el chat con Enter y escribe el comando sin
-- cerrar el popup).
function KyaUI:ScanDialogs()
	E:Print('|cffff5555KyaUI|r [atr] dialogs visible right now:')
	local found = 0

	for i = 1, (STATICPOPUP_NUMDIALOGS or 4) do
		local popup = _G['StaticPopup' .. i]
		if popup and popup:IsVisible() then
			E:Print('  StaticPopup' .. i .. ' -> which = ' .. tostring(popup.which))
			found = found + 1
		end
	end

	local frame = EnumerateFrames()
	while frame and found < 40 do
		local name = frame.GetName and frame:GetName()
		if name and frame.IsVisible and frame:IsVisible() and frame.GetFrameStrata then
			local strata = frame:GetFrameStrata()
			if (strata == 'DIALOG' or strata == 'FULLSCREEN_DIALOG')
				and not strfind(name, '^StaticPopup') then
				E:Print('  ' .. name .. '  [' .. strata .. ']')
				found = found + 1
			end
		end
		frame = EnumerateFrames(frame)
	end

	if found == 0 then
		E:Print('  (none)')
	end
end
