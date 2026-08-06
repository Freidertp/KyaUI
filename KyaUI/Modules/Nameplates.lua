-- KyaUI: manejo de nameplates en el cliente custom (CoA/Ascension).
-- (a) silencia el popup "Couldn't load Ascension_NamePlates: Disabled".
-- (b) detecta si el launcher RE-ACTIVO el addon Ascension_NamePlates (dibuja placas HD que chocan
--     con ElvUI) y lo desactiva, pidiendo un reload. El launcher lo restaura en cada arranque.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

local FILTER = 'Ascension_NamePlates'
local sfind = string.find

-- 1) silenciar el aviso via message()
local _message = message
function message(text, ...)
	if type(text) == 'string' and sfind(text, FILTER, 1, true) then
		return
	end
	return _message(text, ...)
end

-- 2) silenciar via StaticPopup con el texto como argumento
local _StaticPopup_Show = StaticPopup_Show
function StaticPopup_Show(which, arg1, arg2, ...)
	if (type(which) == 'string' and sfind(which, FILTER, 1, true))
		or (type(arg1) == 'string' and sfind(arg1, FILTER, 1, true))
		or (type(arg2) == 'string' and sfind(arg2, FILTER, 1, true)) then
		return
	end
	return _StaticPopup_Show(which, arg1, arg2, ...)
end

-- popup para pedir reload cuando se apaga la opcion HD (necesita recargar para limpiar las placas)
StaticPopupDialogs['KYAUI_NAMEPLATE_CONFLICT'] = {
	text = 'KyaUI: disabled the custom HD nameplates so ElvUI can style them.\nReload the UI to apply?',
	button1 = 'Reload',
	button2 = 'Later',
	OnAccept = function() ReloadUI() end,
	timeout = 0,
	whileDead = 1,
	hideOnEscape = 1,
	preferredIndex = 3,
}

-- Se llama en el login (desde Code.lua). Si ElvUI gestiona las placas, asegura que la opcion
-- "Use Ascension NamePlates" (CVar useNewNameplates) este apagada. Es un CVar => persiste, asi
-- que normalmente ya estara en 0 y no hace nada; solo actua si algo la re-activo.
function KyaUI:FixNameplateConflict()
	if not (E.private and E.private.nameplates and E.private.nameplates.enable) then return end
	if GetCVar('useNewNameplates') ~= '0' then
		SetCVar('useNewNameplates', 0)
		if _StaticPopup_Show then _StaticPopup_Show('KYAUI_NAMEPLATE_CONFLICT') end
	end
end
