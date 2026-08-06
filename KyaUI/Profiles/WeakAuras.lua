-- KyaUI: perfil de WeakAuras. Abre la ventana de importacion de WeakAuras con el
-- set de KyaUI. Datos en data_weakauras.lua.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

function KyaUI:ImportWeakAuras()
	if not IsAddOnLoaded('WeakAuras') then
		E:Print('|cffff5555KyaUI:|r WeakAuras is not loaded, skipping.')
		return
	end
	if not KyaUI.WeakAurasData then return end
	if not (WeakAuras and WeakAuras.Import) then
		E:Print('|cffff5555KyaUI:|r this WeakAuras build has no Import API.')
		return
	end

	-- WeakAuras.Import acepta la tabla directamente y abre su propia ventana de
	-- previsualizacion, asi que el usuario confirma antes de aplicar nada.
	WeakAuras.Import(KyaUI.WeakAurasData)

	addonTable:PluginInstallStepComplete('WeakAuras')
end
