-- KyaUI: temas de color para ElvUI (portado de MerfinUI:ChangeTheme, valores exactos de WoTLK).
-- 'Normal' = barras con color de clase.  'Dark' = barras oscuras + nombres con color de clase (el Dark de Merfin).
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

-- setea el text_format del nombre solo si esa unidad tiene el customText (evita errores)
local function SetNameFormat(unit, fmt)
	local u = E.db.unitframe.units[unit]
	if u and u.customTexts and u.customTexts.UnitName then
		u.customTexts.UnitName.text_format = fmt
	end
end

function KyaUI:ChangeTheme(theme)
	local UF = E:GetModule('UnitFrames')

	if theme == 'Dark' then
		for unit in pairs(E.db.unitframe.units) do
			E.db.unitframe.units[unit].colorOverride = 'FORCE_OFF'
		end

		E.db.unitframe.colors.useDeadBackdrop = true
		E.db.unitframe.colors.transparentHealth = true

		-- valores exactos del Dark de Merfin (WoTLK)
		E.db.unitframe.colors.health.r = 0.1803921568627451
		E.db.unitframe.colors.health.g = 0.1607843137254902
		E.db.unitframe.colors.health.b = 0.1607843137254902
		E.db.unitframe.colors.health_backdrop.r = 0.5490196078431373
		E.db.unitframe.colors.health_backdrop.g = 0.4549019607843137
		E.db.unitframe.colors.health_backdrop.b = 0.4549019607843137
		E.db.unitframe.colors.health_backdrop_dead.r = 1
		E.db.unitframe.colors.health_backdrop_dead.g = 0.25098039215686
		E.db.unitframe.colors.health_backdrop_dead.b = 0.25098039215686

		-- nombres con color de clase en modo oscuro
		SetNameFormat('target', '[namecolor][name:medium]')
		SetNameFormat('focus', '[namecolor][name:medium]')
		SetNameFormat('boss', '[namecolor][name:medium]')
		SetNameFormat('arena', '[namecolor][name:medium]')
		SetNameFormat('party', '[namecolor][name:veryshort]')
		SetNameFormat('raid', '[namecolor][name:veryshort]')
		SetNameFormat('raid40', '[namecolor][name:veryshort]')

	elseif theme == 'Normal' then
		for unit in pairs(E.db.unitframe.units) do
			E.db.unitframe.units[unit].colorOverride = 'FORCE_ON'
		end

		E.db.unitframe.colors.useDeadBackdrop = false

		-- valores exactos del Normal de Merfin (WoTLK)
		E.db.unitframe.colors.health.r = 0.1921568627451
		E.db.unitframe.colors.health.g = 0.17254901960784
		E.db.unitframe.colors.health.b = 0.17254901960784
		E.db.unitframe.colors.health_backdrop.r = 0.27058823529412
		E.db.unitframe.colors.health_backdrop.g = 0.23137254901961
		E.db.unitframe.colors.health_backdrop.b = 0.23137254901961
		E.db.unitframe.colors.health_backdrop_dead.r = 0.51764705882353
		E.db.unitframe.colors.health_backdrop_dead.g = 0.46274509803922
		E.db.unitframe.colors.health_backdrop_dead.b = 0.46274509803922

		-- nombres sin color de clase (la barra ya lleva el color)
		SetNameFormat('party', '[name:veryshort]')
		SetNameFormat('raid', '[name:veryshort]')
		SetNameFormat('raid40', '[name:veryshort]')
		SetNameFormat('boss', '[name:veryshort]')
		SetNameFormat('arena', '[name:veryshort]')
		SetNameFormat('focus', '[name:medium]')
		SetNameFormat('target', '[name:medium]')
	end

	if UF and UF.Update_AllFrames then UF:Update_AllFrames() end

	addonTable:PluginInstallStepComplete(((theme == 'Dark') and 'Dark' or 'Class Colors') .. ' theme')
end
