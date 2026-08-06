-- KyaUI: datos del PRIVATE DB de ElvUI (modulos/plugins activos). Extraido de Kyarox.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

KyaUI = KyaUI or {}
KyaUI.PrivateData = {
			["general"] = {
				["chatBubbleFontSize"] = 10,
				["namefont"] = "SFUIDisplayCondensed-Semibold",
				["chatBubbles"] = "backdrop_noborder",
				["chatBubbleName"] = true,
				["normTex"] = "Flatt",
				["glossTex"] = "Flatt",
				["chatBubbleFont"] = "SFUIDisplayCondensed-Semibold",
				["dmgfont"] = "SFUIDisplayCondensed-Semibold",
			},
			["enhanced"] = {
				["character"] = {
					["modelFrames"] = true,
					["player"] = {
						["orderName2"] = "",
						["collapsedName2"] = {
							["ITEM_LEVEL"] = false,
							["RANGED_COMBAT"] = false,
							["DEFENSES"] = false,
							["RESISTANCE"] = false,
							["MELEE_COMBAT"] = false,
							["SPELL_COMBAT"] = false,
							["BASE_STATS"] = false,
						},
						["collapsedName"] = {
							["RANGED_COMBAT"] = true,
							["SPELL_COMBAT"] = true,
							["DEFENSES"] = true,
						},
						["collapsedName1"] = {
						},
					},
					["enable"] = true,
				},
				["actionbar"] = {
					["keyPressAnimation"] = true,
				},
				["deathRecap"] = true,
				["loseControl"] = {
					["enable"] = true,
				},
				["minimapButtonGrabber"] = true,
				["animatedAchievementBars"] = true,
			},
			["CustomTweaks"] = {
				["CastbarFont"] = false,
				["BagButtons"] = true,
				["RaidControl"] = true,
				["AuraIconSpacing"] = true,
				["CastbarText"] = false,
			},
			["worldmap"] = {
				["enable"] = false,
			},
			["install_complete"] = "6.09",
}
