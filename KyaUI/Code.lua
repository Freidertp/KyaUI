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
addonTable.Version = GetAddOnMetadata(addonName, 'Version') or '1.0'
addonTable.Resolution = (screenWidth >= 2530) and 'QUAD_HD' or 'FULL_HD'
addonTable.ScreenWidth = screenWidth
addonTable.ScreenHeight = screenHeight
addonTable.Font = 'SFUIDisplayCondensed-Semibold'
addonTable.Texture = 'Flatt'
addonTable.AceProfileName = string.format('%s - %s', UnitName('player'), GetRealmName('player'))

-- Modulo global (accesible desde los demas archivos como KyaUI)
KyaUI = E:NewModule(addonName, 'AceConsole-3.0', 'AceEvent-3.0', 'AceTimer-3.0')

-- Compara versiones ("1.2", "1.10.3") segmento a segmento; true si 'a' es anterior a 'b'.
-- Con tonumber a secas, "1.10" saldria MENOR que "1.9" y "1.2.3" ni siquiera parsearia.
local function IsOlder(a, b)
	if not (a and b) then return false end

	local ga = string.gmatch(tostring(a), '%d+')
	local gb = string.gmatch(tostring(b), '%d+')

	for _ = 1, 4 do
		local sa, sb = ga(), gb()
		if not (sa or sb) then return false end

		local na, nb = tonumber(sa) or 0, tonumber(sb) or 0
		if na ~= nb then return na < nb end
	end

	return false
end

local function Initialize()
	if KyaUI.RegisterCommands then
		KyaUI:RegisterCommands()
	end

	-- Manejo de instalacion / actualizacion:
	local ver = addonTable.Version
	local installed = E.private.KyaUI and E.private.KyaUI.install_version

	if installed == nil then
		-- primera instalacion desde cero: abrir el asistente
		PI:Queue(KyaUI.InstallerData)
	elseif IsOlder(installed, ver) then
		-- actualizacion detectada: avisar (sin abrir de golpe)
		E:Delay(4, function()
			E:Print('|cffff5555KyaUI|r updated to v' .. ver .. '. Type |cffffff00/kyaui|r to run the installer again.')
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

	-- Enter/Esc en los dialogos de confirmacion de Auctionator (si el addon esta cargado)
	if KyaUI.SetupAuctionatorKeys then
		KyaUI:SetupAuctionatorKeys()
	end

	-- Casillas + boton para retirar varias subastas de golpe (pestana Auctions de Blizzard)
	if KyaUI.SetupAuctionsMultiCancel then
		KyaUI:SetupAuctionsMultiCancel()
	end
end

E:RegisterModule(addonName, Initialize)
