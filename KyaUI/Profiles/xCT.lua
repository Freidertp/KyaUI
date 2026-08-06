-- KyaUI: perfil de xCT+ (portado de MerfinUI). Ramas por rol (Healer / DPS-Tank) y resolucion.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)

function KyaUI:Import_xCT(layout)
	if not IsAddOnLoaded('xCT+') then
		E:Print('|cffff5555KyaUI:|r xCT+ is not loaded, skipping.')
		return
	end

	local mainFont = 'SFUIDisplayCondensed-Semibold'

	xCTSavedDB = xCTSavedDB or {}
	xCTSavedDB['profiles'] = xCTSavedDB['profiles'] or {}
	xCTSavedDB['profileKeys'] = xCTSavedDB['profileKeys'] or {}

	local profileName = 'KyaUI (' .. layout .. ') (' .. addonTable.ScreenHeight .. ')'

	xCTSavedDB['profiles'][profileName] = {
		['megaDamage'] = {
			['thousandSymbol'] = '|cffFF8000K|r ',
			['billionSymbol'] = '|cffFF0000G|r ',
			['millionSymbol'] = '|cffFF0000M|r ',
		},
		['spells'] = {
			['mergePet'] = true,
			['mergeHideMergedCriticals'] = true,
			['items'] = {},
			['mergeDontMergeCriticals'] = false,
			['merge'] = {
				[980] = { ['enabled'] = false },
				[20153] = { ['enabled'] = false },
				[172] = { ['enabled'] = false },
				[348] = { ['enabled'] = false },
			},
		},
		['frames'] = {
			['general'] = {
				['showDispells'] = false,
				['showPartyKills'] = false,
				['showDebuffs'] = false,
				['font'] = mainFont,
				['showHonorGains'] = false,
				['showInterrupts'] = false,
				['showRepChanges'] = false,
				['showBuffs'] = false,
				['showLowManaHealth'] = false,
			},
			['outgoing'] = {
				['fontShadowOffsetX'] = 1,
				['enableFontShadow'] = false,
				['fontShadowOffsetY'] = -1,
				['enableOverhealing'] = false,
				['font'] = mainFont,
				['enableOutHeal'] = false,
				['enableOutAbsorbs'] = false,
				['insertText'] = 'top',
				['enableHots'] = false,
			},
			['loot'] = {
				['enableFontShadow'] = false,
				['font'] = mainFont,
				['enabledFrame'] = false,
				['Y'] = 226,
				['X'] = 5,
			},
			['power'] = { ['enabledFrame'] = false },
			['critical'] = { ['secondaryFrame'] = 2, ['enabledFrame'] = false },
			['healing'] = {
				['font'] = mainFont,
				['enableRealmNames'] = false,
				['fontSize'] = 13,
				['enabledFrame'] = false,
				['Y'] = 213,
				['X'] = -403,
			},
			['procs'] = {
				['fontSize'] = 17,
				['enabledFrame'] = false,
				['Y'] = 71,
				['font'] = mainFont,
				['X'] = 8,
			},
			['damage'] = {
				['font'] = mainFont,
				['fontSize'] = 15,
				['enabledFrame'] = false,
				['Y'] = -417,
				['X'] = -412,
			},
			['class'] = {
				['colors'] = {
					['comboPoints'] = { ['color'] = { 1, 0.82, 0 } },
					['comboPointsMax'] = { ['color'] = { 0, 0.82, 1 } },
				},
				['enabledFrame'] = false,
			},
		},
		['dbVersion'] = '4.6.1',
		['spellFilter'] = {
			['listHealing'] = { ['15290'] = false },
			['listSpells'] = { ['15290'] = false },
		},
	}

	local prof = xCTSavedDB.profiles[profileName]

	if addonTable.Resolution == 'QUAD_HD' then
		prof.frames.general.Y = 400
		prof.frames.general.X = 0
		prof.frames.general.fontSize = 16
		prof.frames.outgoing.Width = 169
		prof.frames.outgoing.Height = 120
		prof.frames.outgoing.fontSize = 16
		prof.frames.outgoing.iconsSize = 24
		prof.frames.critical.iconsSize = 24
		if layout == 'DPS/Tank' then
			prof.frames.outgoing.Y = -427
			prof.frames.outgoing.X = 340
			prof.frames.outgoing.enableOutHeal = false
		else -- Healer
			prof.frames.outgoing.Y = -473
			prof.frames.outgoing.X = 868
			prof.frames.outgoing.enableOutHeal = true
		end
	else -- FULL_HD (1080)
		prof.frames.general.Y = 300
		prof.frames.general.X = 0
		prof.frames.general.fontSize = 14
		prof.frames.outgoing.Width = 167
		prof.frames.outgoing.Height = 128
		prof.frames.outgoing.fontSize = 14
		prof.frames.outgoing.iconsSize = 20
		if layout == 'DPS/Tank' then
			prof.frames.outgoing.Y = -361
			prof.frames.outgoing.X = 299
			prof.frames.outgoing.enableOutHeal = false
		else -- Healer
			prof.frames.outgoing.Y = -448
			prof.frames.outgoing.X = 587
			prof.frames.outgoing.enableOutHeal = true
		end
	end

	xCTSavedDB['profileKeys'][addonTable.AceProfileName] = profileName

	addonTable:PluginInstallStepComplete('xCT+ (' .. layout .. ')')
end
