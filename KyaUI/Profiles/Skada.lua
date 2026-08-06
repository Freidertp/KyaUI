-- KyaUI: perfil de Skada (medidor). Crea el perfil "KyaUI" y lo activa. Datos en data_skada.lua.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

function KyaUI:ImportSkada()
	if not IsAddOnLoaded('Skada') then
		E:Print('|cffff5555KyaUI:|r Skada is not loaded, skipping.')
		return
	end
	if not KyaUI.SkadaData then return end

	SkadaDB = SkadaDB or {}
	SkadaDB['profiles'] = SkadaDB['profiles'] or {}
	SkadaDB['profileKeys'] = SkadaDB['profileKeys'] or {}

	SkadaDB['profiles']['KyaUI'] = E:CopyTable({}, KyaUI.SkadaData)
	SkadaDB['profileKeys'][addonTable.AceProfileName] = 'KyaUI'

	addonTable:PluginInstallStepComplete('Skada')
end
