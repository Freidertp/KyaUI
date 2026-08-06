-- KyaUI: semillas de la base de datos de ElvUI (privada V y global G).
local E, L, V, P, G = unpack(ElvUI)
local addonName, addonTable = ...

-- Hacer que ElvUI NO abra su propio instalador en una instalacion desde cero, para que salga
-- directamente el asistente de KyaUI. ElvUI muestra su instalador cuando E.private.install_complete
-- esta vacio; al pre-marcarlo como DEFAULT (V es la tabla de defaults privados de ElvUI, se aplica
-- solo si el SavedVariable no lo tiene, i.e. cuenta nueva) ElvUI lo cree instalado y se lo salta.
-- KyaUI hace el setup completo con "Apply KyaUI", asi que no se pierde nada del instalador de ElvUI.
V.install_complete = E.version or '1.0'

-- E.private.KyaUI  (por cuenta/personaje; controla el auto-arranque del asistente)
V.KyaUI = {
	install_version = nil,
}

-- E.global.KyaUI
G.KyaUI = {
	install_version = nil,
}
