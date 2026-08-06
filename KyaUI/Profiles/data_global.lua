-- KyaUI: filtro custom 'Defensivos' de ElvUI (aura filter). Se fusiona en E.global.unitframe.aurafilters.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

KyaUI = KyaUI or {}
KyaUI.GlobalDefensivos = {
					["spells"] = {
						[800845] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						["Jailer's Bargain"] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						[805718] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						["Juggernaut"] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						["Limbo"] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						[520294] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						[680337] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
						["Bolstered Form"] = {
							["enable"] = true,
							["priority"] = 0,
							["stackThreshold"] = 0,
						},
					},
					["type"] = "Whitelist",
}
