-- KyaUI: opciones de DBM. Crea el perfil "KyaUI" y lo activa. Datos en data_dbm.lua.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

function KyaUI:ImportDBM()
	if not IsAddOnLoaded('DBM-Core') then
		E:Print('|cffff5555KyaUI:|r DBM is not loaded, skipping.')
		return
	end
	if not KyaUI.DBMData then return end

	DBM_AllSavedOptions = DBM_AllSavedOptions or {}
	DBM_AllSavedOptions['KyaUI'] = E:CopyTable({}, KyaUI.DBMData)
	DBM_UsedProfile = 'KyaUI'

	addonTable:PluginInstallStepComplete('DBM')
end
