-- KyaUI: semillas de la base de datos de ElvUI (privada V y global G).
local E, L, V, P, G = unpack(ElvUI)
local addonName, addonTable = ...

-- Hacer que ElvUI NO abra su propio instalador en una instalacion desde cero, para que salga
-- directamente el asistente de KyaUI. ElvUI muestra su instalador cuando E.private.install_complete
-- esta vacio; al pre-marcarlo como DEFAULT (V es la tabla de defaults privados de ElvUI, se aplica
-- solo si el SavedVariable no lo tiene, i.e. cuenta nueva) ElvUI lo cree instalado y se lo salta.
-- OJO: saltarse su instalador SI pierde algo. ElvUI pone 17 CVars en Core\Install.lua y esa
-- funcion nunca corre. Estan replicados en Modules\CVar.lua; si actualizas ElvUI, compara las
-- dos listas. Asi se descubrio: showTooltipID se quedaba en 0 y los tooltips no daban el ID.
V.install_complete = E.version or '1.0'

-- E.private.KyaUI  (por cuenta/personaje; controla el auto-arranque del asistente)
V.KyaUI = {
	install_version = nil,
}

-- E.global.KyaUI
G.KyaUI = {
	install_version = nil,
}
