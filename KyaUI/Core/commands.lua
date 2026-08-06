-- KyaUI: comandos de chat + chequeo de dependencias.
-- /kyaui [install|reset|config|help]
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)
local PI = E:GetModule('PluginInstaller')

-- addons recomendados (nombre -> descripcion). ElvUI es RequiredDeps, no hace falta chequearlo.
local RECOMMENDED = {
	['xCT+'] = 'combat text',
	['Skada'] = 'damage meter',
	['ElvUI_Enhanced'] = 'ElvUI plugin',
	['ElvUI_ProjectZidras'] = 'nameplates (ElvUI plugin)',
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
		E:Print('|cffff5555KyaUI|r: estos addons recomendados no estan cargados: ' .. table.concat(missing, ', ') .. '.')
	end
end

function KyaUI:HandleSlash(msg)
	msg = strtrim(strlower(msg or ''))

	if msg == 'config' then
		if E.ToggleOptionsUI then E:ToggleOptionsUI() end

	elseif msg == 'reset' then
		-- re-aplica el perfil de ElvUI de KyaUI (restaura layout/frames/barras)
		if KyaUI.ImportElvUI then KyaUI:ImportElvUI() end
		E:Print('|cffff5555KyaUI|r: perfil de ElvUI re-aplicado. Usa |cffffff00/reload|r si algo no se ve bien.')

	elseif msg == 'help' then
		E:Print('|cffff5555KyaUI|r comandos:')
		E:Print('  |cffffff00/kyaui|r  - abre el asistente de instalacion')
		E:Print('  |cffffff00/kyaui reset|r  - re-aplica el perfil de ElvUI (restaura la UI)')
		E:Print('  |cffffff00/kyaui config|r  - abre la config de ElvUI (/ec)')
		E:Print('  |cffffff00/kyaui help|r  - esta ayuda')

	else
		-- por defecto (o "install"): abre el asistente
		PI:Queue(KyaUI.InstallerData)
	end
end

function KyaUI:RegisterCommands()
	self:RegisterChatCommand('kyaui', 'HandleSlash')
	self:RegisterChatCommand('kui', 'HandleSlash')
end
