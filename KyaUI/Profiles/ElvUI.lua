-- KyaUI: aplica el perfil de ElvUI (layout + private + filtro Defensivos).
-- Los datos vienen embebidos en data_elvui.lua / data_private.lua / data_global.lua.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

local PROFILE_KEY = 'KyaUI'

function KyaUI:ImportElvUI()
	-- 1) PERFIL (E.db): crear/actualizar el perfil "KyaUI" y activarlo
	if KyaUI.ProfileData then
		ElvDB = ElvDB or {}
		ElvDB.profiles = ElvDB.profiles or {}
		ElvDB.profiles[PROFILE_KEY] = E:CopyTable({}, KyaUI.ProfileData)
		E.data:SetProfile(PROFILE_KEY)
	end

	-- 2) PRIVATE (E.private): modulos/plugins activos, enhanced, tweaks, etc.
	--    (los cambios de private se aplican del todo con el reload final)
	if KyaUI.PrivateData then
		E:CopyTable(E.private, KyaUI.PrivateData)
	end

	-- 3) GLOBAL: filtro custom "Defensivos" (los RaidDebuffs vienen por defecto en ElvUI)
	if KyaUI.GlobalDefensivos then
		E.global.unitframe = E.global.unitframe or {}
		E.global.unitframe.aurafilters = E.global.unitframe.aurafilters or {}
		E.global.unitframe.aurafilters.Defensivos = E:CopyTable({}, KyaUI.GlobalDefensivos)
	end

	-- 4) NAMEPLATES: en CoA/Ascension, la opcion de interfaz "Use Ascension NamePlates" (CVar
	--    "useNewNameplates") activa las placas HD del cliente que chocan con ElvUI. Ponerlo a 0
	--    = ElvUI las estiliza (lo mismo que desmarcar el checkbox). Es un CVar => persiste.
	E.private.nameplates = E.private.nameplates or {}
	E.private.nameplates.enable = true
	SetCVar('useNewNameplates', 0)
	-- mostrar las placas por defecto (nombres de aliados + barras de enemigos) sin tener que pulsar
	-- CTRL+V. ElvUI no fuerza estos CVars (showFriendlyCombat/showEnemyCombat no son TOGGLE), asi
	-- que persisten. E:UpdateAll (abajo) re-estiliza las placas ya visibles.
	SetCVar('nameplateShowFriends', 1)
	SetCVar('nameplateShowEnemies', 1)

	E:UpdateAll(true)
	addonTable:PluginInstallStepComplete('ElvUI (KyaUI profile)')
end
