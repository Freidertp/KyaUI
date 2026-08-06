-- KyaUI: CVars recomendadas (portado de MerfinUI, solo las universales).
-- OJO: NO se tocan los CVars de nameplates (nameplateShow*, UnitName* de placas). ElvUI los
-- gestiona el mismo segun su config; ponerlos aqui recrea las placas por defecto de WoW y ElvUI
-- pierde el estilo hasta re-aplicar. La config de nameplates la hace la pagina de ElvUI.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)
local SetCVar = SetCVar
local pairs = pairs

function KyaUI:Set_CVars()
	local CVars = {
		['autoLootDefault'] = 1,
		['cameraPivot'] = 1,
		['cameraSmoothStyle'] = 0,
		['cameraDistanceMax'] = 50,
		['cameraPitchMoveSpeed'] = 70,
		['cameraYawMoveSpeed'] = 160,
		['CombatLogPeriodicSpells'] = 0,
		['chatStyle'] = 'classic',
		['scriptErrors'] = 1,
		['showTutorials'] = 0,
		['showItemLevel'] = 1,
		['ShowAllSpellRanks'] = 0,
		['showNewbieTips'] = 0,
		['alwaysShowActionBars'] = 1,
		['ShowVKeyCastbar'] = 1,
	}

	for cvar, value in pairs(CVars) do
		SetCVar(cvar, value)
	end

	addonTable:PluginInstallStepComplete('CVars')
end
