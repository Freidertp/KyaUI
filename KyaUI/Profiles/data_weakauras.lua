-- KyaUI: datos del perfil de WeakAuras. Generado por la skill ascension-weakauras.
-- NO EDITAR A MANO: se regenera con  python wa_kyaui.py --group "[Kyaro] Class: Chrono"
-- Grupo: [Kyaro] Class: Chrono   (17 auras: 1 raiz + 16 descendientes)
-- Formato: el envoltorio que espera WeakAuras.Import  {m, d, c, v}

local addonName, addonTable = ...
KyaUI = KyaUI or {}
KyaUI.WeakAurasData = {
	["m"] = "d",
	["d"] = {
		["controlledChildren"] = {
			"[Mana] Power Bar", -- [1]
			"[Chrono] Rotation", -- [2]
			"[Chrono] Cooldowns", -- [3]
			"Cast Bar", -- [4]
			"[Chrono] Buffs", -- [5]
		},
		["borderBackdrop"] = "Blizzard Tooltip",
		["wagoID"] = "PL_t0P--4",
		["xOffset"] = 0,
		["yOffset"] = 0,
		["anchorPoint"] = "CENTER",
		["sharedFrameLevel"] = true,
		["borderColor"] = {
			0, -- [1]
			0, -- [2]
			0, -- [3]
			1, -- [4]
		},
		["url"] = "",
		["actions"] = {
			["start"] = {
			},
			["init"] = {
			},
			["finish"] = {
			},
		},
		["triggers"] = {
			{
				["trigger"] = {
					["debuffType"] = "HELPFUL",
					["type"] = "aura2",
					["spellIds"] = {
					},
					["subeventSuffix"] = "_CAST_START",
					["subeventPrefix"] = "SPELL",
					["unit"] = "player",
					["event"] = "Health",
					["names"] = {
					},
				},
				["untrigger"] = {
				},
			}, -- [1]
		},
		["internalVersion"] = 89,
		["animation"] = {
			["start"] = {
				["type"] = "none",
				["easeStrength"] = 3,
				["duration_type"] = "seconds",
				["easeType"] = "none",
			},
			["main"] = {
				["type"] = "none",
				["easeStrength"] = 3,
				["duration_type"] = "seconds",
				["easeType"] = "none",
			},
			["finish"] = {
				["type"] = "none",
				["easeStrength"] = 3,
				["duration_type"] = "seconds",
				["easeType"] = "none",
			},
		},
		["desc"] = "Auras Pack is cooked by Merfin. Wanna get more?\n\nDiscord: https://discord.com/merfin\nTwitch: https://www.twitch.tv/merfin\nPatreon: https://www.patreon.com/c/MerfinUI\n",
		["version"] = 5,
		["subRegions"] = {
		},
		["load"] = {
			["talent"] = {
				["multi"] = {
				},
			},
			["class"] = {
				["multi"] = {
				},
			},
			["spec"] = {
				["multi"] = {
				},
			},
			["size"] = {
				["multi"] = {
				},
			},
		},
		["backdropColor"] = {
			1, -- [1]
			1, -- [2]
			1, -- [3]
			0.5, -- [4]
		},
		["source"] = "import",
		["scale"] = 1,
		["border"] = false,
		["borderEdge"] = "Square Full White",
		["regionType"] = "group",
		["borderSize"] = 2,
		["groupIcon"] = "Interface\\Icons\\Spell_Nature_TimeStop",
		["borderOffset"] = 4,
		["semver"] = "1.0.4",
		["tocversion"] = 30300,
		["id"] = "[Kyaro] Class: Chrono",
		["authorOptions"] = {
		},
		["alpha"] = 1,
		["anchorFrameType"] = "SCREEN",
		["frameStrata"] = 1,
		["uid"] = "PB9MmAvNZag",
		["borderInset"] = 1,
		["selfPoint"] = "CENTER",
		["conditions"] = {
		},
		["information"] = {
			["showNilIsFalse"] = true,
		},
		["config"] = {
		},
	},
	["v"] = 2000,
	["s"] = "5.21.6",
	["c"] = {
		{
			["sparkWidth"] = 10,
			["iconSource"] = -1,
			["authorOptions"] = {
				{
					["type"] = "toggle",
					["default"] = true,
					["name"] = "Show in Thousands",
					["key"] = "thousands",
					["useDesc"] = false,
					["width"] = 2,
				}, -- [1]
				{
					["type"] = "toggle",
					["default"] = true,
					["name"] = "Enable Decimals",
					["key"] = "decimals_enable",
					["useDesc"] = false,
					["width"] = 1,
				}, -- [2]
				{
					["type"] = "range",
					["useDesc"] = false,
					["max"] = 5,
					["step"] = 1,
					["width"] = 1,
					["min"] = 0,
					["key"] = "decimals_amount",
					["default"] = 2,
					["name"] = "Decimals Amount",
				}, -- [3]
				{
					["type"] = "toggle",
					["default"] = true,
					["width"] = 1,
					["key"] = "sign_enable",
					["useDesc"] = true,
					["name"] = "Enable Sign",
					["desc"] = "Adds sign to the end of numbers",
				}, -- [4]
				{
					["type"] = "input",
					["useDesc"] = false,
					["width"] = 1,
					["key"] = "sign_value",
					["name"] = "Sign Value",
					["default"] = "K",
					["length"] = 10,
					["multiline"] = false,
					["useLength"] = true,
				}, -- [5]
			},
			["adjustedMax"] = "",
			["yOffset"] = -215,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "",
			["icon"] = false,
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "TOP",
			["barColor"] = {
				0, -- [1]
				0.6156862745098, -- [2]
				0.76470588235294, -- [3]
				1, -- [4]
			},
			["desaturate"] = false,
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_never"] = false,
				["use_vehicleUi"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
						["WARLOCK"] = true,
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["smoothProgress"] = true,
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["texture"] = "MerfinMain",
			["sparkTexture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
			["spark"] = false,
			["tocversion"] = 30300,
			["alpha"] = 0.9,
			["sparkColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["sparkOffsetX"] = 0,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Kyaro] Class: Chrono",
			["adjustedMin"] = "",
			["sparkRotationMode"] = "AUTO",
			["triggers"] = {
				{
					["trigger"] = {
						["use_unit"] = true,
						["type"] = "unit",
						["use_deficit"] = false,
						["unevent"] = "auto",
						["names"] = {
						},
						["duration"] = "1",
						["use_showCost"] = true,
						["unit"] = "player",
						["subeventSuffix"] = "_CAST_START",
						["powertype"] = 0,
						["spellIds"] = {
						},
						["use_power"] = false,
						["event"] = "Power",
						["subeventPrefix"] = "SPELL",
						["use_powertype"] = false,
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["disjunctive"] = "all",
				["customTriggerLogic"] = "",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["useAdjustedMin"] = false,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["border_offset"] = 0,
					["type"] = "subborder",
					["anchor_area"] = "bar",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_size"] = 1,
				}, -- [3]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_percentpower_pad_max"] = 8,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_fixedWidth"] = 64,
					["rotateText"] = "NONE",
					["text_text_format_1.power_big_number_format"] = "AbbreviateNumbers",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_text_format_1.power_pad_max"] = 8,
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_fontSize"] = 15,
					["anchorXOffset"] = 0,
					["text_text_format_percentpower_pad_mode"] = "left",
					["text_text_format_percentpower_round_type"] = "floor",
					["text_text_format_1.power_format"] = "BigNumber",
					["text_text_format_percentpower_pad"] = false,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["text_text_format_1.power_pad"] = false,
					["text_anchorXOffset"] = 0,
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_fontType"] = "OUTLINE",
					["text_anchorYOffset"] = 2,
					["type"] = "subtext",
					["text_automaticWidth"] = "Auto",
					["text_text_format_c1_format"] = "none",
					["text_text_format_percentpower_format"] = "Number",
					["text_selfPoint"] = "CENTER",
					["anchor_point"] = "INNER_TOP",
					["text_text_format_1.power_pad_mode"] = "left",
					["text_text"] = "%1.power",
					["text_text_format_percentpower_decimal_precision"] = 0,
				}, -- [4]
			},
			["height"] = 11.000018122618,
			["textureSource"] = "LSM",
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["source"] = "import",
			["useAdjustedMax"] = false,
			["color"] = {
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
			["uid"] = "BwHBwA3OoSE",
			["auto"] = true,
			["icon_side"] = "RIGHT",
			["desc"] = "Have Custom Options part, allowing you to display Power (Mana) in more optimal decimal way. Updates on Event",
			["backgroundColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				0.70000001788139, -- [4]
			},
			["anchorFrameParent"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "--WeakAuras.ScanEvents('CLASS_FRAME_MOVER', 'CONNECT', aura_env)",
					["do_custom"] = true,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "aura_env.round = function(number, decimals)\n    return ((\"%%.%df\"):format(decimals)):format(number)\nend\n\naura_env.display = function(number)\n    local _,power_type = UnitPowerType(\"player\")\n    local number = number\n    \n    if power_type == \"MANA\" then\n        if aura_env.config.thousands then\n            local decimals = 0\n            \n            if aura_env.config.decimals_enable then\n                decimals = aura_env.config.decimals_amount\n            end\n            \n            number = aura_env.round(number/1000, decimals)\n        end\n        \n        if aura_env.config.sign_enable then\n            local value = aura_env.config.sign_value\n            return number..value\n        end\n    end\n    \n    return number\nend",
					["do_custom"] = true,
				},
			},
			["anchorFrameType"] = "SCREEN",
			["zoom"] = 0,
			["semver"] = "1.0.4",
			["sparkHidden"] = "NEVER",
			["id"] = "[Mana] Power Bar",
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["frameStrata"] = 1,
			["width"] = 283,
			["customText"] = "function(...)\n    local t, m = ...\n    return aura_env.display(m), t\nend",
			["sparkHeight"] = 10,
			["inverse"] = false,
			["config"] = {
				["thousands"] = true,
				["decimals_amount"] = 1,
				["decimals_enable"] = true,
				["sign_enable"] = true,
				["sign_value"] = "T",
			},
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["showNilIsFalse"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
		}, -- [1]
		{
			["arcLength"] = 360,
			["controlledChildren"] = {
				"[Chrono] Ahead of the Game", -- [1]
				"[Chrono] Ahead of the Game (Buff)", -- [2]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["parent"] = "[Kyaro] Class: Chrono",
			["yOffset"] = -245,
			["gridType"] = "RD",
			["sharedFrameLevel"] = true,
			["fullCircle"] = true,
			["space"] = 0,
			["url"] = "https://discord.com/invite/merfin",
			["actions"] = {
				["start"] = {
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["names"] = {
						},
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 89,
			["selfPoint"] = "CENTER",
			["align"] = "CENTER",
			["gridWidth"] = 5,
			["stagger"] = 0,
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["sortHybridTable"] = {
				["[Chrono] Ahead of the Game (Buff)"] = false,
				["[Chrono] Ahead of the Game"] = false,
			},
			["subRegions"] = {
			},
			["xOffset"] = 0,
			["radius"] = 200,
			["load"] = {
				["size"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["talent"] = {
					["multi"] = {
					},
				},
			},
			["rotation"] = 0,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["rowSpace"] = 1,
			["animate"] = true,
			["useLimit"] = false,
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["stepAngle"] = 15,
			["borderSize"] = 2,
			["limit"] = 5,
			["borderInset"] = 1,
			["regionType"] = "dynamicgroup",
			["constantFactor"] = "RADIUS",
			["uid"] = "o5w9QmswIso",
			["borderOffset"] = 4,
			["sort"] = "none",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Rotation",
			["frameStrata"] = 1,
			["alpha"] = 1,
			["anchorFrameType"] = "SCREEN",
			["grow"] = "HORIZONTAL",
			["config"] = {
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["anchorPoint"] = "CENTER",
			["conditions"] = {
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["authorOptions"] = {
			},
		}, -- [2]
		{
			["iconSource"] = -1,
			["parent"] = "[Chrono] Rotation",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["useExactSpellId"] = true,
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["auraspellids"] = {
							"592009", -- [1]
						},
						["spellIds"] = {
						},
						["unit"] = "player",
						["auranames"] = {
						},
						["useName"] = true,
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [2]
				{
					["border_size"] = 2,
					["border_offset"] = -1,
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.20392156862745, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [3]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["anchorYOffset"] = 0,
					["text_justify"] = "CENTER",
					["type"] = "subtext",
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						0.20392156862745, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_shadowYOffset"] = 0,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 22,
					["anchorXOffset"] = 0,
					["text_fontType"] = "OUTLINE",
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["faction"] = {
				},
				["use_vehicleUi"] = false,
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["width"] = 40,
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
			["cooldown"] = true,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = 0.5,
							["property"] = "alpha",
						}, -- [2]
					},
					["linked"] = false,
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
					},
					["linked"] = false,
				}, -- [2]
			},
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["authorOptions"] = {
			},
			["selfPoint"] = "CENTER",
			["config"] = {
			},
			["icon"] = true,
			["anchorFrameParent"] = false,
			["useCooldownModRate"] = true,
			["keepAspectRatio"] = true,
			["zoom"] = 0.3,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Ahead of the Game",
			["cooldownTextDisabled"] = true,
			["frameStrata"] = 1,
			["anchorFrameType"] = "SCREEN",
			["alpha"] = 1,
			["uid"] = "KyAheadGame05",
			["inverse"] = false,
			["url"] = "",
			["displayIcon"] = "",
			["information"] = {
				["showNilIsFalse"] = true,
			},
		}, -- [3]
		{
			["iconSource"] = 0,
			["parent"] = "[Chrono] Rotation",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "aura2",
						["useExactSpellId"] = true,
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["spellIds"] = {
						},
						["useName"] = false,
						["auranames"] = {
							"592010", -- [1]
						},
						["unit"] = "player",
						["auraspellids"] = {
							"592010", -- [1]
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						0.20392156862745, -- [1]
						1, -- [2]
						0.20392156862745, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "CENTER",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						0.20392156862745, -- [1]
						1, -- [2]
						0.20392156862745, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 0,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 20,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "592010",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["selfPoint"] = "CENTER",
			["uid"] = "KyAheadBuff07",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 1,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = true,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Ahead of the Game (Buff)",
			["keepAspectRatio"] = true,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = 0.5,
							["property"] = "alpha",
						}, -- [2]
					},
					["linked"] = false,
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 1,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
					},
					["linked"] = false,
				}, -- [2]
			},
			["cooldown"] = true,
			["xOffset"] = 0,
		}, -- [4]
		{
			["arcLength"] = 360,
			["controlledChildren"] = {
				"[Chrono] Ripple", -- [1]
				"[Chrono] Fortify Timeline", -- [2]
				"[Chrono] Time Out!", -- [3]
				"[Chrono] Infinite Clone", -- [4]
				"[Chrono] Hasten", -- [5]
				"[Chrono] Temporal Anomaly", -- [6]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["parent"] = "[Kyaro] Class: Chrono",
			["yOffset"] = -325,
			["gridType"] = "RD",
			["sharedFrameLevel"] = true,
			["fullCircle"] = true,
			["space"] = 0,
			["url"] = "https://discord.com/invite/merfin",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 89,
			["selfPoint"] = "CENTER",
			["align"] = "CENTER",
			["alpha"] = 1,
			["stagger"] = 0,
			["borderInset"] = 1,
			["rotation"] = 0,
			["subRegions"] = {
			},
			["xOffset"] = 0,
			["useLimit"] = false,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["radius"] = 200,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["rowSpace"] = 1,
			["animate"] = true,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["stepAngle"] = 15,
			["borderSize"] = 2,
			["limit"] = 5,
			["config"] = {
			},
			["anchorPoint"] = "CENTER",
			["constantFactor"] = "RADIUS",
			["authorOptions"] = {
			},
			["borderOffset"] = 4,
			["frameStrata"] = 1,
			["tocversion"] = 30300,
			["id"] = "[Chrono] Cooldowns",
			["sort"] = "none",
			["gridWidth"] = 5,
			["anchorFrameType"] = "SCREEN",
			["regionType"] = "dynamicgroup",
			["uid"] = "KXg(x5HotEt",
			["sortHybridTable"] = {
				["[Chrono] Time Out!"] = false,
				["[Chrono] Hasten"] = false,
				["[Chrono] Temporal Anomaly"] = false,
				["[Chrono] Ripple"] = false,
				["[Chrono] Infinite Clone"] = false,
				["[Chrono] Fortify Timeline"] = false,
			},
			["grow"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
		}, -- [5]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Cooldowns",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"806296", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["track"] = "auto",
						["itemName"] = 17928,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["unevent"] = "auto",
						["spellName"] = 806296,
						["use_unit"] = true,
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["realSpellName"] = "Ripple",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.50196078431373, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
						[22] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["selfPoint"] = "CENTER",
			["uid"] = "pGp5EuIKvwk",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 0.9,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = true,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Ripple",
			["keepAspectRatio"] = true,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = ">",
						["value"] = 1,
						["variable"] = "show",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0.50196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
						["checks"] = {
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "spellUsable",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.4, -- [1]
								0.4, -- [2]
								0.4, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.50196078431373, -- [1]
								0.50196078431373, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = true,
			["xOffset"] = 0,
		}, -- [6]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"804491", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["track"] = "auto",
						["itemName"] = 17928,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["unevent"] = "auto",
						["spellName"] = 804491,
						["use_unit"] = true,
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["realSpellName"] = "Fortify Timeline",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.50196078431373, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
						[22] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["xOffset"] = 0,
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["icon"] = true,
			["uid"] = "Q0aFM7sMV36",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 0.9,
			["cooldownTextDisabled"] = true,
			["zoom"] = 0.3,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Fortify Timeline",
			["authorOptions"] = {
			},
			["useCooldownModRate"] = true,
			["width"] = 40,
			["parent"] = "[Chrono] Cooldowns",
			["config"] = {
			},
			["inverse"] = false,
			["keepAspectRatio"] = true,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = ">",
						["value"] = 1,
						["variable"] = "show",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0.50196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
						["checks"] = {
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "spellUsable",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.4, -- [1]
								0.4, -- [2]
								0.4, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.50196078431373, -- [1]
								0.50196078431373, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		}, -- [7]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"802229", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["track"] = "auto",
						["itemName"] = 17928,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["unevent"] = "auto",
						["spellName"] = 802229,
						["use_unit"] = true,
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["realSpellName"] = "Time Out!",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.50196078431373, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
						[22] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["xOffset"] = 0,
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["icon"] = true,
			["uid"] = "QmswIsoggT2",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 0.9,
			["cooldownTextDisabled"] = true,
			["zoom"] = 0.3,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Time Out!",
			["authorOptions"] = {
			},
			["useCooldownModRate"] = true,
			["width"] = 40,
			["parent"] = "[Chrono] Cooldowns",
			["config"] = {
			},
			["inverse"] = false,
			["keepAspectRatio"] = true,
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = ">",
						["value"] = 1,
						["variable"] = "show",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0.50196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
						["checks"] = {
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "spellUsable",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.4, -- [1]
								0.4, -- [2]
								0.4, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.50196078431373, -- [1]
								0.50196078431373, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = true,
			["selfPoint"] = "CENTER",
		}, -- [8]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Cooldowns",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"704154", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["track"] = "auto",
						["itemName"] = 17928,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["unevent"] = "auto",
						["spellName"] = 804492,
						["use_unit"] = true,
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["realSpellName"] = "Infinite Clone",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.50196078431373, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
						[22] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["selfPoint"] = "CENTER",
			["uid"] = "KyInfClone01",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 0.9,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = true,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Infinite Clone",
			["keepAspectRatio"] = true,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = ">",
						["value"] = 1,
						["variable"] = "show",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0.50196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
						["checks"] = {
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "spellUsable",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.4, -- [1]
								0.4, -- [2]
								0.4, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.50196078431373, -- [1]
								0.50196078431373, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = true,
			["xOffset"] = 0,
		}, -- [9]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Cooldowns",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"801304", -- [1]
							"712454", -- [2]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["track"] = "auto",
						["itemName"] = 17928,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["unevent"] = "auto",
						["spellName"] = 801304,
						["use_unit"] = true,
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["realSpellName"] = "Hasten",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.50196078431373, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
						[22] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["selfPoint"] = "CENTER",
			["uid"] = "ChronoHasten1",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 0.9,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = true,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Hasten",
			["keepAspectRatio"] = true,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = ">",
						["value"] = 1,
						["variable"] = "show",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0.50196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
						["checks"] = {
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "spellUsable",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.4, -- [1]
								0.4, -- [2]
								0.4, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.50196078431373, -- [1]
								0.50196078431373, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = true,
			["xOffset"] = 0,
		}, -- [10]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Cooldowns",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["init"] = {
				},
				["finish"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["useName"] = true,
						["auranames"] = {
							"806315", -- [1]
						},
						["event"] = "Health",
						["unit"] = "player",
						["spellIds"] = {
						},
						["subeventPrefix"] = "SPELL",
						["subeventSuffix"] = "_CAST_START",
						["names"] = {
						},
						["type"] = "aura2",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["track"] = "auto",
						["itemName"] = 17928,
						["duration"] = "1",
						["genericShowOn"] = "showAlways",
						["subeventPrefix"] = "SPELL",
						["use_showgcd"] = false,
						["debuffType"] = "HELPFUL",
						["type"] = "spell",
						["unevent"] = "auto",
						["spellName"] = 806315,
						["use_unit"] = true,
						["use_itemName"] = true,
						["use_genericShowOn"] = true,
						["realSpellName"] = "Temporal Anomaly",
						["use_spellName"] = true,
						["spellIds"] = {
						},
						["unit"] = "player",
						["event"] = "Cooldown Progress (Spell)",
						["subeventSuffix"] = "_CAST_START",
						["use_track"] = true,
						["names"] = {
						},
					},
					["untrigger"] = {
						["genericShowOn"] = "showAlways",
					},
				}, -- [2]
				["disjunctive"] = "any",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["type"] = "subborder",
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["border_offset"] = 0,
				}, -- [2]
				{
					["border_size"] = 2,
					["type"] = "subborder",
					["border_color"] = {
						1, -- [1]
						1, -- [2]
						0.50196078431373, -- [3]
						1, -- [4]
					},
					["border_visible"] = false,
					["border_edge"] = "Square Full White",
					["border_offset"] = -1,
				}, -- [3]
				{
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["text_text_format_p_format"] = "timed",
					["type"] = "subtext",
					["anchorXOffset"] = 0,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_anchorYOffset"] = 1,
					["text_shadowYOffset"] = 0,
					["text_fontType"] = "OUTLINE",
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_text_format_p_time_precision"] = 1,
					["anchorYOffset"] = 0,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["text_text_format_p_time_dynamic_threshold"] = 0,
					["text_shadowXOffset"] = 0,
				}, -- [4]
			},
			["height"] = 37,
			["load"] = {
				["use_class"] = true,
				["use_spellknown"] = false,
				["faction"] = {
				},
				["talent"] = {
					["multi"] = {
						[22] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMax"] = false,
			["anchorFrameType"] = "SCREEN",
			["source"] = "import",
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["displayIcon"] = "",
			["useAdjustededMin"] = false,
			["regionType"] = "icon",
			["url"] = "",
			["selfPoint"] = "CENTER",
			["uid"] = "ChronoTempAn1",
			["frameStrata"] = 1,
			["anchorFrameParent"] = false,
			["alpha"] = 0.9,
			["zoom"] = 0.3,
			["cooldownTextDisabled"] = true,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Temporal Anomaly",
			["keepAspectRatio"] = true,
			["useCooldownModRate"] = true,
			["width"] = 40,
			["icon"] = true,
			["config"] = {
			},
			["inverse"] = false,
			["authorOptions"] = {
			},
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = ">",
						["value"] = 1,
						["variable"] = "show",
					},
					["linked"] = false,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "sub.3.border_visible",
						}, -- [1]
						{
							["value"] = {
								1, -- [1]
								1, -- [2]
								0.50196078431373, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [2]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "onCooldown",
						["value"] = 1,
						["checks"] = {
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
						{
							["value"] = true,
							["property"] = "inverse",
						}, -- [2]
					},
				}, -- [2]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 2,
								["variable"] = "spellUsable",
								["value"] = 0,
							}, -- [1]
							{
								["trigger"] = 2,
								["variable"] = "insufficientResources",
								["value"] = 0,
							}, -- [2]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.4, -- [1]
								0.4, -- [2]
								0.4, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [3]
				{
					["check"] = {
						["trigger"] = 2,
						["variable"] = "insufficientResources",
						["value"] = 1,
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "insufficientResources",
								["value"] = 1,
							}, -- [1]
						},
					},
					["linked"] = true,
					["changes"] = {
						{
							["value"] = {
								0.50196078431373, -- [1]
								0.50196078431373, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["property"] = "color",
						}, -- [1]
					},
				}, -- [4]
			},
			["cooldown"] = true,
			["xOffset"] = 0,
		}, -- [11]
		{
			["sparkWidth"] = 1,
			["iconSource"] = -1,
			["authorOptions"] = {
				{
					["subOptions"] = {
						{
							["type"] = "color",
							["default"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["name"] = "Tick Color",
							["useDesc"] = false,
							["key"] = "tickColor",
							["width"] = 1,
						}, -- [1]
						{
							["type"] = "color",
							["default"] = {
								1, -- [1]
								1, -- [2]
								1, -- [3]
								1, -- [4]
							},
							["name"] = "Tick Complete Color",
							["useDesc"] = false,
							["key"] = "tickColorComplete",
							["width"] = 1,
						}, -- [2]
						{
							["type"] = "range",
							["useDesc"] = false,
							["max"] = 1,
							["step"] = 1,
							["width"] = 1,
							["min"] = 1,
							["key"] = "tickWidth",
							["name"] = "Tick Width",
							["default"] = 1,
						}, -- [3]
					},
					["hideReorder"] = true,
					["useDesc"] = false,
					["nameSource"] = 0,
					["width"] = 1,
					["useCollapse"] = false,
					["collapse"] = false,
					["name"] = "Cast Bar",
					["key"] = "options",
					["limitType"] = "none",
					["groupType"] = "simple",
					["type"] = "group",
					["size"] = 10,
				}, -- [1]
			},
			["adjustedMax"] = "",
			["yOffset"] = -272,
			["anchorPoint"] = "CENTER",
			["sparkRotation"] = 0,
			["url"] = "",
			["actions"] = {
				["start"] = {
					["custom"] = "WeakAuras.ScanEvents('WA_MERFIN_CAST_START')",
					["do_custom"] = true,
				},
				["init"] = {
					["custom"] = "local cfg = aura_env.config.options\nlocal color = cfg.tickColor\nlocal width = cfg.tickWidth\n\naura_env.barSubRegions = {}\naura_env.lastCondCheck = 0\n\naura_env.SetTicksCount = function(increment, start)\n    if increment < 0.05 then\n        return\n    end\n    \n    local point = 100 - start\n    \n    if start == 0 then\n        point = point - increment\n    end\n    \n    aura_env.barSubRegions = {}\n    \n    for _, subRegion in ipairs(aura_env.region.subRegions) do\n        if subRegion.type == \"subtick\" then\n            if point >= 0 then\n                subRegion:SetTickPlacement(point)\n                subRegion:SetTickColor(color[1], color[2], color[3], color[4])\n                subRegion.tick_thickness = width\n                subRegion:SetTickLength(width)\n                subRegion:UpdateTickSize()\n                subRegion:SetVisible(true)\n                aura_env.barSubRegions[point] = subRegion\n                point = point - increment\n            else\n                subRegion:SetVisible(false)\n            end\n        end\n    end\nend\n\nlocal GetSpellName = function(id)\n    return select(1, GetSpellInfo(id))\nend\n\naura_env.spellConfig = {\n    [GetSpellName(10)]    = { ticks = 8 }, -- Blizzard\n    [GetSpellName(5145)]  = { ticks = 5 }, -- Arcane Missiles\n    [GetSpellName(12051)] = { ticks = 4 }, -- Evocation\n    [GetSpellName(806296)] = { single = 70 }, -- Ripple: umbral 1.5s (30%)\n}",
					["do_custom"] = true,
				},
				["finish"] = {
				},
			},
			["icon_color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["enableGradient"] = false,
			["selfPoint"] = "TOP",
			["barColor"] = {
				0.1411764705882353, -- [1]
				0.1411764705882353, -- [2]
				0.1411764705882353, -- [3]
				1, -- [4]
			},
			["desc"] = "Author - Merfin\nDiscord - https://discord.com/merfin\nTwitch - https://www.twitch.tv/merfin\nPatreon - https://www.patreon.com/c/MerfinUI",
			["sparkOffsetY"] = 0,
			["gradientOrientation"] = "HORIZONTAL",
			["load"] = {
				["use_petbattle"] = false,
				["class_and_spec"] = {
					["multi"] = {
					},
				},
				["use_vehicleUi"] = false,
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["single"] = 3,
					["multi"] = {
					},
				},
				["class"] = {
					["single"] = "MAGE",
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["useAdjustededMin"] = false,
			["regionType"] = "aurabar",
			["texture"] = "Merfin Main Texture",
			["sparkTexture"] = "Interface\\AddOns\\WeakAuras\\Media\\Textures\\Square_FullWhite",
			["spark"] = false,
			["tocversion"] = 30300,
			["alpha"] = 0.9,
			["sparkColor"] = {
				0.6, -- [1]
				0.6, -- [2]
				0.6, -- [3]
				1, -- [4]
			},
			["displayIcon"] = "Interface\\Icons\\inv_staff_13",
			["sparkOffsetX"] = 0,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Kyaro] Class: Chrono",
			["adjustedMin"] = "",
			["sparkRotationMode"] = "AUTO",
			["triggers"] = {
				{
					["trigger"] = {
						["type"] = "unit",
						["use_absorbHealMode"] = true,
						["subeventSuffix"] = "_CAST_START",
						["use_absorbMode"] = true,
						["event"] = "Cast",
						["use_unit"] = true,
						["spellIds"] = {
						},
						["names"] = {
						},
						["unit"] = "player",
						["subeventPrefix"] = "SPELL",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				{
					["trigger"] = {
						["type"] = "custom",
						["events"] = "UNIT_SPELLCAST_SENT, UNIT_SPELLCAST_STOP:player, UNIT_SPELLCAST_CHANNEL_STOP:player, UNIT_SPELLCAST_START:player",
						["custom_type"] = "stateupdate",
						["check"] = "event",
						["unit"] = "player",
						["custom"] = "function(a, e, ...)\n    if e == 'UNIT_SPELLCAST_SENT' then\n        local _, spellName, _, destName, _ = ...\n        if destName and destName == WeakAuras.me or UnitInRaid(destName) or UnitInParty(destName) then\n            aura_env.sentDestName = destName\n            aura_env.sentSpellName = spellName\n        else\n            aura_env.sentDestName = nil\n            aura_env.sentSpellName = nil\n        end\n    end\n    \n    if e == 'UNIT_SPELLCAST_START' then\n        local _, spellName = ...\n        if spellName == aura_env.sentSpellName then\n            aura_env.destName = aura_env.sentDestName\n        else\n            aura_env.destName = nil\n        end\n        \n        a[''] = {\n            show = true,\n            changed = true\n        }\n        return true\n    end\n    \nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [2]
				{
					["trigger"] = {
						["type"] = "custom",
						["events"] = "UNIT_SPELLCAST_CHANNEL_START:player, UNIT_SPELLCAST_CHANNEL_STOP:player",
						["custom_type"] = "stateupdate",
						["check"] = "event",
						["unit"] = "player",
						["custom"] = "function(allstates, event, ...)\n    \n    local unitTarget, spellName = ...\n    \n    if unitTarget ~= \"player\" then\n        return\n    end\n    \n    if event == \"UNIT_SPELLCAST_CHANNEL_STOP\" then\n        aura_env.startTime = nil\n        allstates[\"\"] = {\n            show = false,\n            changed = true,\n        }\n        aura_env.SetTicksCount(200, 0)\n        return true\n    end\n    \n    if event ~= \"UNIT_SPELLCAST_CHANNEL_START\" and event ~= \"UNIT_SPELLCAST_CHANNEL_UPDATE\" then\n        return\n    end\n    \n    local spellConfig = aura_env.spellConfig[spellName]\n    if not spellConfig then\n        return\n    end\n    \n    if spellConfig.single then\n        aura_env.SetTicksCount(200, 100 - spellConfig.single)\n    else\n        local tickCount = spellConfig.ticks\n        aura_env.SetTicksCount(100 / tickCount, 0)\n    end\n    \n    allstates[\"\"] = {\n        show = true,\n        changed = true,\n    }\n    \n    return true\nend",
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [3]
				["disjunctive"] = "custom",
				["customTriggerLogic"] = "function(t)\n    return t[1]\nend",
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["animation"] = {
				["start"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["type"] = "none",
					["easeStrength"] = 3,
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["type"] = "subforeground",
				}, -- [2]
				{
					["border_offset"] = 0,
					["border_size"] = 1,
					["border_visible"] = true,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["anchor_area"] = "bar",
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [3]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [4]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [5]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [6]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [7]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [8]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [9]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [10]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [11]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [12]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [13]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [14]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [15]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [16]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [17]
				{
					["tick_rotation"] = 0,
					["tick_xOffset"] = 0,
					["tick_desaturate"] = false,
					["use_texture"] = false,
					["tick_placement_mode"] = "AtPercent",
					["tick_texture"] = "Interface\\CastingBar\\UI-CastingBar-Spark",
					["tick_length"] = 30,
					["tick_blend_mode"] = "ADD",
					["type"] = "subtick",
					["tick_placements"] = {
						"0", -- [1]
					},
					["automatic_length"] = true,
					["tick_thickness"] = 1,
					["tick_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tick_yOffset"] = 0,
					["tick_visible"] = false,
					["tick_mirror"] = false,
					["progressSources"] = {
						{
							-2, -- [1]
							"", -- [2]
						}, -- [1]
					},
				}, -- [18]
				{
					["text_shadowXOffset"] = 0,
					["text_text"] = "%c",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "LEFT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_c_format"] = "none",
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["type"] = "subtext",
					["text_anchorXOffset"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_text_format_1.n_format"] = "none",
					["text_anchorYOffset"] = 1,
					["text_text_format_n_format"] = "none",
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["text_visible"] = true,
					["anchorYOffset"] = 0,
					["anchor_point"] = "INNER_LEFT",
					["text_fontSize"] = 13,
					["anchorXOffset"] = 0,
					["text_shadowYOffset"] = 0,
				}, -- [19]
				{
					["text_text_format_p_time_precision"] = 1,
					["text_text_format_p_time_format"] = 0,
					["text_text"] = "%p  / %t",
					["anchorXOffset"] = 0,
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_text_format_p_format"] = "timed",
					["anchorYOffset"] = 0,
					["text_selfPoint"] = "RIGHT",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_t_time_format"] = 0,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_t_format"] = "timed",
					["text_shadowXOffset"] = 0,
					["text_text_format_n_format"] = "none",
					["type"] = "subtext",
					["text_anchorXOffset"] = -1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_fontType"] = "OUTLINE",
					["text_shadowYOffset"] = 0,
					["text_text_format_t_time_legacy_floor"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_visible"] = true,
					["text_anchorYOffset"] = 1,
					["text_text_format_t_time_precision"] = 1,
					["anchor_point"] = "INNER_RIGHT",
					["text_fontSize"] = 15,
					["text_text_format_t_time_dynamic_threshold"] = 60,
					["text_text_format_p_time_dynamic_threshold"] = 60,
				}, -- [20]
			},
			["height"] = 32,
			["textureSource"] = "LSM",
			["sparkBlendMode"] = "ADD",
			["useAdjustededMax"] = false,
			["source"] = "import",
			["anchorFrameFrame"] = "WeakAuras:[Mage] Main Panel",
			["information"] = {
				["showNilIsFalse"] = true,
				["forceEvents"] = false,
			},
			["icon_side"] = "LEFT",
			["customText"] = "function()\n    if WeakAuras.IsOptionsOpen() then\n        return string.format('%s  »  %s', 'Cast', WA_ClassColorName(WeakAuras.me))\n    end\n    \n    local castName = aura_env.states[1].name\n    local destName = aura_env.destName\n    \n    if destName then\n        return string.format('%s  »  %s', castName, WA_ClassColorName(destName))\n    end\n    \n    return castName\nend",
			["sparkHeight"] = 33,
			["anchorFrameParent"] = false,
			["uid"] = "IfLoU1xULun",
			["icon"] = true,
			["backgroundColor"] = {
				0.615686274509804, -- [1]
				0.615686274509804, -- [2]
				0.615686274509804, -- [3]
				0.800000011920929, -- [4]
			},
			["semver"] = "1.0.4",
			["desaturate"] = false,
			["sparkHidden"] = "NEVER",
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["width"] = 307,
			["id"] = "Cast Bar",
			["config"] = {
				["options"] = {
					["tickWidth"] = 1,
					["tickColorComplete"] = {
						1, -- [1]
						1, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["tickColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
				},
			},
			["inverse"] = false,
			["zoom"] = 0.3,
			["orientation"] = "HORIZONTAL",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["op"] = "==",
						["variable"] = "castType",
						["value"] = "channel",
					},
					["changes"] = {
						{
							["property"] = "sub.19.text_visible",
						}, -- [1]
						{
							["value"] = {
								0.52941176470588, -- [1]
								0.46666666666667, -- [2]
								0.72156862745098, -- [3]
								1, -- [4]
							},
							["property"] = "barColor",
						}, -- [2]
						{
							["value"] = {
								0, -- [1]
								0, -- [2]
								0, -- [3]
								0.7000000178813934, -- [4]
							},
							["property"] = "backgroundColor",
						}, -- [3]
					},
				}, -- [1]
				{
					["check"] = {
						["trigger"] = -2,
						["variable"] = "AND",
						["checks"] = {
							{
								["trigger"] = 1,
								["variable"] = "show",
								["value"] = 1,
							}, -- [1]
							{
								["trigger"] = 1,
								["op"] = "==",
								["variable"] = "castType",
								["value"] = "channel",
							}, -- [2]
							{
								["trigger"] = -1,
								["op"] = "FRAME_UPDATE",
								["variable"] = "customcheck",
								["value"] = "function()\n    if WeakAuras.IsOptionsOpen() then\n        return\n    end\n    \n    local cast = aura_env.states[1]\n    if not cast then\n        return\n    end\n    \n    if not aura_env.barSubRegions then\n        return\n    end\n    \n    local curTime = GetTime()\n    \n    if curTime - aura_env.lastCondCheck < 0.05 then\n        return\n    end\n    \n    aura_env.lastCondCheck = curTime\n    \n    local duration = cast.duration\n    local expirationTime = cast.expirationTime\n    \n    local leftTime = expirationTime - curTime\n    local castProgress = 100 * leftTime/duration\n    \n    local color = aura_env.config.options.tickColorComplete\n    \n    for tickProgress, subRegion in pairs(aura_env.barSubRegions) do\n        if tickProgress >= castProgress then\n            subRegion:SetTickColor(color[1], color[2], color[3], color[4])\n        end\n    end\nend",
							}, -- [3]
						},
					},
					["changes"] = {
						{
						}, -- [1]
					},
				}, -- [2]
			},
			["barColor2"] = {
				1, -- [1]
				1, -- [2]
				0, -- [3]
				1, -- [4]
			},
			["xOffset"] = 0,
		}, -- [12]
		{
			["arcLength"] = 360,
			["controlledChildren"] = {
				"[Chrono] Sands of Time", -- [1]
				"[Chrono] Endless Sands", -- [2]
				"[Chrono] Cadence of Time", -- [3]
			},
			["borderBackdrop"] = "Blizzard Tooltip",
			["parent"] = "[Kyaro] Class: Chrono",
			["yOffset"] = -175,
			["gridType"] = "RD",
			["sharedFrameLevel"] = true,
			["fullCircle"] = true,
			["space"] = 0,
			["url"] = "https://discord.com/invite/merfin",
			["actions"] = {
				["start"] = {
				},
				["finish"] = {
				},
				["init"] = {
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["debuffType"] = "HELPFUL",
						["type"] = "aura2",
						["spellIds"] = {
						},
						["subeventSuffix"] = "_CAST_START",
						["subeventPrefix"] = "SPELL",
						["unit"] = "player",
						["event"] = "Health",
						["names"] = {
						},
					},
					["untrigger"] = {
					},
				}, -- [1]
			},
			["columnSpace"] = 1,
			["internalVersion"] = 89,
			["selfPoint"] = "CENTER",
			["align"] = "CENTER",
			["alpha"] = 1,
			["stagger"] = 0,
			["borderInset"] = 1,
			["rotation"] = 0,
			["subRegions"] = {
			},
			["xOffset"] = 0,
			["useLimit"] = false,
			["load"] = {
				["talent"] = {
					["multi"] = {
					},
				},
				["spec"] = {
					["multi"] = {
					},
				},
				["class"] = {
					["multi"] = {
					},
				},
				["size"] = {
					["multi"] = {
					},
				},
			},
			["radius"] = 200,
			["backdropColor"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				0.5, -- [4]
			},
			["rowSpace"] = 1,
			["animate"] = true,
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["scale"] = 1,
			["centerType"] = "LR",
			["border"] = false,
			["borderEdge"] = "Square Full White",
			["stepAngle"] = 15,
			["borderSize"] = 2,
			["limit"] = 5,
			["config"] = {
			},
			["anchorPoint"] = "CENTER",
			["constantFactor"] = "RADIUS",
			["authorOptions"] = {
			},
			["borderOffset"] = 4,
			["frameStrata"] = 1,
			["tocversion"] = 30300,
			["id"] = "[Chrono] Buffs",
			["sort"] = "none",
			["gridWidth"] = 5,
			["anchorFrameType"] = "SCREEN",
			["regionType"] = "dynamicgroup",
			["uid"] = "KyChronoBuff1",
			["sortHybridTable"] = {
				["[Chrono] Endless Sands"] = false,
				["[Chrono] Sands of Time"] = false,
				["[Chrono] Cadence of Time"] = false,
			},
			["grow"] = "HORIZONTAL",
			["conditions"] = {
			},
			["information"] = {
				["showNilIsFalse"] = true,
			},
			["borderColor"] = {
				0, -- [1]
				0, -- [2]
				0, -- [3]
				1, -- [4]
			},
		}, -- [13]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Buffs",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["showClones"] = false,
						["useName"] = false,
						["auranames"] = {
							"Sands of Time", -- [1]
						},
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"804488", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
						},
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [2]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["type"] = "subtext",
					["text_text_format_p_time_dynamic_threshold"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_text_format_p_time_format"] = 0,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["anchorYOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["anchorXOffset"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [3]
			},
			["height"] = 40,
			["url"] = "",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["single"] = 68,
					["multi"] = {
						[19] = true,
						[28] = true,
						[68] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["spellknown"] = 57946,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMax"] = false,
			["cooldown"] = true,
			["source"] = "import",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
			},
			["customText"] = "",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["uid"] = "oggT2Q0aFM7",
			["anchorFrameFrame"] = "WeakAuras:W - A - Life Tap Buff",
			["regionType"] = "icon",
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameParent"] = false,
			["zoom"] = 0.3,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Sands of Time",
			["xOffset"] = 0,
			["alpha"] = 0.9,
			["width"] = 45,
			["useAdjustededMin"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["icon"] = true,
			["displayIcon"] = "",
			["information"] = {
				["showNilIsFalse"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		}, -- [14]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Buffs",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["showClones"] = false,
						["useName"] = false,
						["auranames"] = {
							"Endless Sands", -- [1]
						},
						["matchesShowOn"] = "showAlways",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"806728", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
						},
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [2]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["type"] = "subtext",
					["text_text_format_p_time_dynamic_threshold"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_text_format_p_time_format"] = 0,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["anchorYOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["anchorXOffset"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [3]
			},
			["height"] = 40,
			["url"] = "",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["single"] = 68,
					["multi"] = {
						[19] = true,
						[28] = true,
						[68] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["spellknown"] = 57946,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMax"] = false,
			["cooldown"] = true,
			["source"] = "import",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
			},
			["customText"] = "",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["uid"] = "UOHSnkptL2K",
			["anchorFrameFrame"] = "WeakAuras:W - A - Life Tap Buff",
			["regionType"] = "icon",
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameParent"] = false,
			["zoom"] = 0.3,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Endless Sands",
			["xOffset"] = 0,
			["alpha"] = 0.9,
			["width"] = 45,
			["useAdjustededMin"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["icon"] = true,
			["displayIcon"] = "",
			["information"] = {
				["showNilIsFalse"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		}, -- [15]
		{
			["iconSource"] = -1,
			["wagoID"] = "PL_t0P--4",
			["parent"] = "[Chrono] Buffs",
			["adjustedMax"] = "",
			["adjustedMin"] = "",
			["yOffset"] = 0,
			["anchorPoint"] = "CENTER",
			["cooldownSwipe"] = true,
			["cooldownEdge"] = false,
			["actions"] = {
				["start"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
				["finish"] = {
				},
				["init"] = {
					["custom"] = "",
					["do_custom"] = false,
				},
			},
			["triggers"] = {
				{
					["trigger"] = {
						["showClones"] = false,
						["useName"] = false,
						["auranames"] = {
							"Cadence of Time", -- [1]
						},
						["matchesShowOn"] = "showOnActive",
						["event"] = "Health",
						["subeventPrefix"] = "SPELL",
						["auraspellids"] = {
							"560398", -- [1]
						},
						["useExactSpellId"] = true,
						["spellIds"] = {
						},
						["type"] = "aura2",
						["subeventSuffix"] = "_CAST_START",
						["unit"] = "player",
						["names"] = {
						},
						["debuffType"] = "HELPFUL",
					},
					["untrigger"] = {
					},
				}, -- [1]
				["activeTriggerMode"] = -10,
			},
			["internalVersion"] = 89,
			["keepAspectRatio"] = true,
			["selfPoint"] = "CENTER",
			["desaturate"] = false,
			["version"] = 5,
			["subRegions"] = {
				{
					["type"] = "subbackground",
				}, -- [1]
				{
					["border_size"] = 1,
					["border_offset"] = 0,
					["border_color"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["border_visible"] = true,
					["border_edge"] = "Square Full White",
					["type"] = "subborder",
				}, -- [2]
				{
					["text_shadowXOffset"] = 0,
					["text_text_format_s_format"] = "none",
					["text_text"] = "%s",
					["text_shadowColor"] = {
						0, -- [1]
						0, -- [2]
						0, -- [3]
						1, -- [4]
					},
					["text_selfPoint"] = "AUTO",
					["text_automaticWidth"] = "Auto",
					["text_fixedWidth"] = 64,
					["text_text_format_p_time_legacy_floor"] = true,
					["text_justify"] = "CENTER",
					["rotateText"] = "NONE",
					["text_text_format_p_time_mod_rate"] = true,
					["type"] = "subtext",
					["text_text_format_p_time_dynamic_threshold"] = 1,
					["text_color"] = {
						1, -- [1]
						1, -- [2]
						1, -- [3]
						1, -- [4]
					},
					["text_font"] = "SFUIDisplayCondensed-Semibold",
					["text_text_format_p_time_format"] = 0,
					["text_shadowYOffset"] = 0,
					["text_visible"] = true,
					["text_wordWrap"] = "WordWrap",
					["text_fontType"] = "OUTLINE",
					["anchorYOffset"] = 0,
					["text_text_format_p_time_precision"] = 1,
					["anchor_point"] = "CENTER",
					["text_fontSize"] = 17,
					["anchorXOffset"] = 0,
					["text_text_format_p_format"] = "timed",
				}, -- [3]
			},
			["height"] = 40,
			["url"] = "",
			["load"] = {
				["use_never"] = false,
				["talent"] = {
					["single"] = 68,
					["multi"] = {
						[19] = true,
						[28] = true,
						[68] = true,
					},
				},
				["class"] = {
					["single"] = "CHRONOMANCER",
					["multi"] = {
					},
				},
				["use_class"] = true,
				["use_spellknown"] = false,
				["use_vehicleUi"] = false,
				["spec"] = {
					["multi"] = {
					},
				},
				["spellknown"] = 57946,
				["size"] = {
					["multi"] = {
					},
				},
			},
			["color"] = {
				1, -- [1]
				1, -- [2]
				1, -- [3]
				1, -- [4]
			},
			["useAdjustededMax"] = false,
			["cooldown"] = true,
			["source"] = "import",
			["conditions"] = {
				{
					["check"] = {
						["trigger"] = 1,
						["variable"] = "buffed",
						["value"] = 0,
					},
					["changes"] = {
						{
							["value"] = true,
							["property"] = "desaturate",
						}, -- [1]
					},
				}, -- [1]
			},
			["customText"] = "",
			["animation"] = {
				["start"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["main"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
				["finish"] = {
					["easeStrength"] = 3,
					["type"] = "none",
					["duration_type"] = "seconds",
					["easeType"] = "none",
				},
			},
			["uid"] = "KyCadenceTim1",
			["anchorFrameFrame"] = "WeakAuras:W - A - Life Tap Buff",
			["regionType"] = "icon",
			["progressSource"] = {
				-1, -- [1]
				"", -- [2]
			},
			["anchorFrameType"] = "SCREEN",
			["frameStrata"] = 1,
			["useCooldownModRate"] = true,
			["anchorFrameParent"] = false,
			["zoom"] = 0.3,
			["auto"] = true,
			["cooldownTextDisabled"] = false,
			["semver"] = "1.0.4",
			["tocversion"] = 30300,
			["id"] = "[Chrono] Cadence of Time",
			["xOffset"] = 0,
			["alpha"] = 0.9,
			["width"] = 45,
			["useAdjustededMin"] = false,
			["config"] = {
			},
			["inverse"] = false,
			["icon"] = true,
			["displayIcon"] = "",
			["information"] = {
				["showNilIsFalse"] = true,
				["ignoreOptionsEventErrors"] = true,
			},
			["authorOptions"] = {
			},
		}, -- [16]
	},
}
