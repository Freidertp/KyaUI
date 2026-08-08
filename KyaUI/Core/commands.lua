-- KyaUI: comandos de chat + chequeo de dependencias.
-- /kyaui [install|reset|config|help]
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)
local PI = E:GetModule('PluginInstaller')

-- addons recomendados (nombre -> descripcion). ElvUI es RequiredDeps, no hace falta chequearlo.
local RECOMMENDED = {
	['xCT+'] = 'combat text',
	['Skada'] = 'damage meter',
	['ElvUI_Enhanced'] = 'ElvUI plugin (lo instala el Ascension Launcher con ElvUI)',
	['ElvUI_ProjectZidras'] = 'absorciones e iconos de rol (ElvUI plugin)',
}

-- devuelve lista de addons recomendados que NO estan cargados
function KyaUI:GetMissingAddons()
	local missing = {}
	for addon, desc in pairs(RECOMMENDED) do
		if not IsAddOnLoaded(addon) then
			missing[#missing + 1] = addon .. ' (' .. desc .. ')'
		end
	end
	return missing
end

-- aviso en el chat si faltan addons recomendados (se llama en el login)
function KyaUI:CheckDependencies()
	local missing = KyaUI:GetMissingAddons()
	if #missing > 0 then
		E:Print('|cffff5555KyaUI|r: these recommended addons are not loaded: ' .. table.concat(missing, ', ') .. '.')
	end
end

function KyaUI:HandleSlash(msg)
	msg = strtrim(strlower(msg or ''))

	if msg == 'config' then
		if E.ToggleOptionsUI then E:ToggleOptionsUI() end

	elseif msg == 'reset' then
		-- re-aplica el perfil de ElvUI de KyaUI (restaura layout/frames/barras)
		if KyaUI.ImportElvUI then KyaUI:ImportElvUI() end
		E:Print('|cffff5555KyaUI|r: ElvUI profile re-applied. Type |cffffff00/reload|r if anything looks off.')

	elseif msg == 'atr auctions' then
		-- diagnostico de las casillas de la pestana Auctions de Blizzard
		if KyaUI.DiagnoseAuctionsCancel then
			KyaUI:DiagnoseAuctionsCancel()
		else
			E:Print('|cffff5555KyaUI|r: AuctionsCancel.lua is not loaded (quit the game and log back in).')
		end

	elseif msg == 'atr' or msg == 'atr scan' then
		-- diagnostico de las teclas Enter/Esc en los dialogos de Auctionator
		if KyaUI.ToggleAuctionatorDebug then
			if msg == 'atr scan' then
				KyaUI:ScanDialogs()
			else
				KyaUI:ToggleAuctionatorDebug()
			end
		else
			E:Print('|cffff5555KyaUI|r: the Auctionator module is not loaded (quit the game and log back in).')
		end

	elseif msg == 'help' then
		E:Print('|cffff5555KyaUI|r commands:')
		E:Print('  |cffffff00/kyaui|r  - open the install wizard')
		E:Print('  |cffffff00/kyaui reset|r  - re-apply the ElvUI profile (restores the UI)')
		E:Print('  |cffffff00/kyaui config|r  - open the ElvUI config (/ec)')
		E:Print('  |cffffff00/kyaui atr|r  - Enter/Esc handling in Auctionator dialogs')
		E:Print('  |cffffff00/kyaui atr scan|r  - list the dialogs visible right now')
		E:Print('  |cffffff00/kyaui atr auctions|r  - checkboxes in the Blizzard Auctions tab')
		E:Print('  |cffffff00/kyaui help|r  - this help')
		E:Print('|cffff5555KyaUI|r: in the |cffffff00Auctions|r tab you can also use'
			.. ' |cffffff00Ctrl+click|r to toggle one auction and |cffffff00Shift+click|r for a range.')

	else
		-- por defecto (o "install"): abre el asistente
		PI:Queue(KyaUI.InstallerData)
	end
end

function KyaUI:RegisterCommands()
	self:RegisterChatCommand('kyaui', 'HandleSlash')
	self:RegisterChatCommand('kui', 'HandleSlash')
end
