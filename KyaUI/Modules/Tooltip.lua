-- KyaUI: IDs y lanzador del aura en los tooltips.
--
-- ElvUI 6.09 traia esto de serie en su modulo Tooltip (Tooltip.lua: SetUnitAura en la 578,
-- npcID en la 444, spellID en la 517/596/612). ElvUI 7.x lo QUITO: su Tooltip.lua no tiene ni
-- una referencia a SetUnitAura, spellID, npcID ni itemID. Esto lo repone tal cual estaba,
-- coloreado por clase incluido.
--
-- No depende de nada de ElvUI mas alla de E:RGBToHex: son cuatro hooks sobre GameTooltip.
--
-- OJO: todo el texto que ve el usuario va en INGLES. Los comentarios, en espanol.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

local format, find, match, sub, tonumber = string.format, string.find, string.match, string.sub, tonumber
local select, UnitAura, UnitName, UnitClass, UnitGUID = select, UnitAura, UnitName, UnitClass, UnitGUID

-- 'ID' es la cadena localizada de Blizzard; si el cliente no la tuviera, se usa el literal.
local ID_LABEL = _G.ID or 'ID'
local HEADER = '|cFFCA3C3C%s|r %d'   -- el mismo rojo que usaba ElvUI 6.09

local hooked = false

local function CasterColor(class)
	local color = (CUSTOM_CLASS_COLORS and CUSTOM_CLASS_COLORS[class]) or (RAID_CLASS_COLORS and RAID_CLASS_COLORS[class])
	if not color then return '|cffffffff' end
	return E:RGBToHex(color.r, color.g, color.b)
end

-- Buffs y debuffs: el ID del hechizo y QUIEN lo lanzo.
-- UnitAura devuelve el lanzador en la posicion 8 y el spellID en la 11, asi que con
-- select(8, ...) salen caster, isStealable, shouldConsolidate, spellID en ese orden.
local function OnSetUnitAura(tt, ...)
	local caster, _, _, id = select(8, UnitAura(...))
	if not id then return end

	if caster then
		local name = UnitName(caster)
		local _, class = UnitClass(caster)
		tt:AddDoubleLine(format(HEADER, ID_LABEL, id), format('%s%s', CasterColor(class), name or '?'))
	else
		tt:AddLine(format(HEADER, ID_LABEL, id))
	end

	tt:Show()
end

-- Tooltip de un hechizo suelto (libro de hechizos, barras de accion...).
-- Se comprueba que la linea no este ya puesta: OnTooltipSetSpell puede dispararse dos veces
-- sobre el mismo tooltip y saldria el ID duplicado.
local function OnSetSpell(tt)
	if not tt.GetSpell then return end

	local id = select(3, tt:GetSpell())
	if not id then return end

	local line = format(HEADER, ID_LABEL, id)

	for i = 1, tt:NumLines() do
		local fs = _G['GameTooltipTextLeft' .. i]
		local text = fs and fs:GetText()
		if text and find(text, line, 1, true) then return end
	end

	tt:AddLine(line)
	tt:Show()
end

-- Tooltip de un objeto: el ID sale del propio enlace (item:12345:...).
local function OnSetItem(tt)
	if not tt.GetItem then return end

	local _, link = tt:GetItem()
	if not link then return end

	local id = tonumber(match(link, ':(%d+)'))
	if not id then return end

	tt:AddLine(format(HEADER, ID_LABEL, id))
	tt:Show()
end

-- NPC bajo el cursor: el ID va dentro del GUID (bytes 8-12 en hexadecimal).
local function OnSetUnit(tt)
	local _, unit = tt:GetUnit()
	if not unit or UnitIsPlayer(unit) then return end

	local guid = UnitGUID(unit)
	if not guid then return end

	local id = tonumber(sub(guid, 8, 12), 16)
	if not id then return end

	tt:AddLine(format(HEADER, ID_LABEL, id))
	tt:Show()
end

-- Enlaces de hechizo u objeto pinchados en el chat (abren ItemRefTooltip, no GameTooltip).
local function OnSetHyperlink(tt, link)
	if not link then return end
	if not (find(link, '^spell:') or find(link, '^item:')) then return end

	local id = tonumber(match(link, '(%d+)'))
	if not id then return end

	tt:AddLine(format(HEADER, ID_LABEL, id))
	tt:Show()
end

-- Punto de entrada (se llama desde Code.lua en el login)
function KyaUI:SetupTooltipIDs()
	if hooked then return end

	-- IDTip (del catalogo de Ascension) hace exactamente lo mismo. Si lo tiene instalado,
	-- nos apartamos: si no, saldria cada ID por duplicado.
	if IsAddOnLoaded('IdTip') or IsAddOnLoaded('IDTip') then return end

	hooksecurefunc(GameTooltip, 'SetUnitAura', OnSetUnitAura)
	hooksecurefunc(GameTooltip, 'SetUnitBuff', OnSetUnitAura)
	hooksecurefunc(GameTooltip, 'SetUnitDebuff', OnSetUnitAura)

	GameTooltip:HookScript('OnTooltipSetSpell', OnSetSpell)
	GameTooltip:HookScript('OnTooltipSetItem', OnSetItem)
	GameTooltip:HookScript('OnTooltipSetUnit', OnSetUnit)

	if ItemRefTooltip then
		hooksecurefunc(ItemRefTooltip, 'SetHyperlink', OnSetHyperlink)
	end

	hooked = true
end
