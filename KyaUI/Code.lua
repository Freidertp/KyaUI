-- KyaUI: bootstrap. Registra el plugin de ElvUI y encola el asistente en el primer arranque.
local E, L, V, P, G = unpack(ElvUI)
local PI = E:GetModule('PluginInstaller')

local addonName, addonTable = ...

-- Detectar resolucion (para auto-escala futura)
local reso = ({ GetScreenResolutions() })[GetCurrentResolution()]
local screenWidth, screenHeight = 1920, 1080
if reso then
	local w, h = strsplit('x', reso)
	screenWidth, screenHeight = tonumber(w) or 1920, tonumber(h) or 1080
end

addonTable.Name = '|cffff5555KyaUI|r'
addonTable.Version = tonumber(GetAddOnMetadata(addonName, 'Version')) or 1.0
addonTable.Resolution = (screenWidth >= 2530) and 'QUAD_HD' or 'FULL_HD'
addonTable.ScreenWidth = screenWidth
addonTable.ScreenHeight = screenHeight
addonTable.Font = 'SFUIDisplayCondensed-Semibold'
addonTable.Texture = 'Flatt'
addonTable.AceProfileName = string.format('%s - %s', UnitName('player'), GetRealmName('player'))

-- Modulo global (accesible desde los demas archivos como KyaUI)
KyaUI = E:NewModule(addonName, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

local function Initialize()
	if KyaUI.RegisterCommands then
		KyaUI:RegisterCommands()
	end

	-- Manejo de instalacion / actualizacion:
	local ver = addonTable.Version
	local installed = E.private.KyaUI and E.private.KyaUI.install_version
	local installedNum = tonumber(installed)

	if installed == nil then
		-- primera instalacion desde cero: abrir el asistente
		PI:Queue(KyaUI.InstallerData)
	elseif installedNum and ver and installedNum < ver then
		-- actualizacion detectada: avisar (sin abrir de golpe)
		E:Delay(4, function()
			E:Print('|cffff5555KyaUI|r actualizado a v' .. ver .. '. Escribe |cffffff00/kyaui|r para re-ejecutar el instalador.')
		end)
	end

	-- Aviso de addons recomendados que falten (xCT+, Skada, plugins de ElvUI)
	if KyaUI.CheckDependencies then
		E:Delay(5, function() KyaUI:CheckDependencies() end)
	end

	-- Cliente custom: el launcher re-activa Ascension_NamePlates (placas HD) que choca con ElvUI.
	-- Si sigue cargado y ElvUI gestiona las placas, apaga la opcion y ofrece recargar. Pequeno delay
	-- para asegurar que E.private ya esta listo.
	if KyaUI.FixNameplateConflict then
		E:Delay(2, function() KyaUI:FixNameplateConflict() end)
	end
end

E:RegisterModule(addonName, Initialize)
