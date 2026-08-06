-- KyaUI: installer wizard definition (ElvUI PluginInstaller).
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)
local Version = GetAddOnMetadata(addonName, 'Version')

local ReloadUI = ReloadUI
local format = string.format

-- "X applied!" confirmation toast
function addonTable:PluginInstallStepComplete(name)
	if not PluginInstallStepComplete then return end
	PluginInstallStepComplete:Hide()
	PluginInstallStepComplete.message = format('%s applied!', name)
	PluginInstallStepComplete:Show()
end

-- Finalize: stamp the installed version (so it won't auto-open again) and reload the UI
function addonTable:InstallComplete()
	if GetCVarBool('Sound_EnableMusic') then
		StopMusic()
	end
	if E.global.KyaUI then E.global.KyaUI.install_version = Version end
	if E.private.KyaUI then E.private.KyaUI.install_version = Version end
	ReloadUI()
end

KyaUI.InstallerData = {

	Title = format('|cffff5555%s|r %s', 'KyaUI', 'Installation'),
	Name = addonTable.Name,
	tutorialImage = 'Interface\\AddOns\\KyaUI\\Media\\logo.tga',

	Pages = {
		-- 1. Welcome
		[1] = function()
			PluginInstallFrame.SubTitle:SetFormattedText('Welcome to the KyaUI %s installation', Version)
			PluginInstallFrame.Desc1:SetText('This installer configures ElvUI and other addons with the KyaUI layout.')
			PluginInstallFrame.Desc2:SetText('Recommended: back up your WTF folder before you start, just in case.')
			PluginInstallFrame.Desc3:SetText("IMPORTANT: on the last step click 'Finished' to apply everything and reload the UI.")
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', addonTable.InstallComplete)
			PluginInstallFrame.Option1:SetText('Skip Process')
		end,

		-- 2. CVars
		[2] = function()
			PluginInstallFrame.SubTitle:SetText('Account Settings (CVars)')
			PluginInstallFrame.Desc1:SetText('Sets recommended client variables (CVars): nameplates, camera, autoloot, etc.')
			PluginInstallFrame.Desc2:SetText('Importance: |cffff5555Optional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:Set_CVars() end)
			PluginInstallFrame.Option1:SetText('Setup CVars')
		end,

		-- 5. Chat
		[5] = function()
			PluginInstallFrame.SubTitle:SetText('Chat Settings')
			PluginInstallFrame.Desc1:SetText('Arranges the chat windows: GNL, CL, LT (loot), GLD (guild), /W (whisper), GLB (global).')
			PluginInstallFrame.Desc2:SetText('Importance: |cffff5555Optional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:SetupChat() end)
			PluginInstallFrame.Option1:SetText('Setup Chat')
		end,

		-- 3. ElvUI (layout + fonts/textures + private + Defensivos)
		[3] = function()
			PluginInstallFrame.SubTitle:SetText('ElvUI Profile')
			PluginInstallFrame.Desc1:SetText('Applies the KyaUI profile: unitframe layout, action bars, fonts and textures.')
			PluginInstallFrame.Desc2:SetText('Also enables the plugin settings (Enhanced, Zidras), the defensive-cooldowns filter and nameplates.')
			PluginInstallFrame.Desc3:SetText('Importance: |cffff5555High|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:ImportElvUI() end)
			PluginInstallFrame.Option1:SetText('Apply KyaUI')
		end,

		-- 4. Theme
		[4] = function()
			PluginInstallFrame.SubTitle:SetText('Theme')
			PluginInstallFrame.Desc1:SetText('Choose the unitframe color theme.')
			PluginInstallFrame.Desc2:SetText('"Class Colors" tints health bars by class. "Dark Mode" uses dark bars with class-colored names (the WoTLK/KyaUI look).')
			PluginInstallFrame.Desc3:SetText('Importance: |cffff5555Optional|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:ChangeTheme('Normal') end)
			PluginInstallFrame.Option1:SetText('Class Colors')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() KyaUI:ChangeTheme('Dark') end)
			PluginInstallFrame.Option2:SetText('Dark Mode')
		end,

		-- 6. xCT+ (role branch: Healer / DPS-Tank)
		[6] = function()
			PluginInstallFrame.SubTitle:SetText('Combat Text (xCT+)')
			PluginInstallFrame.Desc1:SetText('Choose the xCT+ profile based on your role. Healing and numbers are shown differently for Healer vs DPS/Tank.')
			PluginInstallFrame.Desc2:SetText('Importance: |cffff5555High|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:Import_xCT('Healer') end)
			PluginInstallFrame.Option1:SetText('Healer')
			PluginInstallFrame.Option2:Show()
			PluginInstallFrame.Option2:SetScript('OnClick', function() KyaUI:Import_xCT('DPS/Tank') end)
			PluginInstallFrame.Option2:SetText('DPS/Tank')
		end,

		-- 7. Skada
		[7] = function()
			PluginInstallFrame.SubTitle:SetText('Damage Meter (Skada)')
			PluginInstallFrame.Desc1:SetText('Applies the KyaUI Skada profile.')
			PluginInstallFrame.Desc3:SetText('Importance: |cffff5555Medium|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:ImportSkada() end)
			PluginInstallFrame.Option1:SetText('Apply Skada')
		end,

		-- 8. DBM
		[8] = function()
			PluginInstallFrame.SubTitle:SetText('Boss Mods (DBM)')
			PluginInstallFrame.Desc1:SetText('Applies the KyaUI DBM profile.')
			PluginInstallFrame.Desc3:SetText('Importance: |cffff5555Medium|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:ImportDBM() end)
			PluginInstallFrame.Option1:SetText('Apply DBM')
		end,

		-- 9. WeakAuras
		[9] = function()
			PluginInstallFrame.SubTitle:SetText('WeakAuras')
			PluginInstallFrame.Desc1:SetText('Imports the KyaUI WeakAuras set (class HUD: cooldowns, procs and resource bars).')
			PluginInstallFrame.Desc2:SetText('WeakAuras will open its own import window so you can review it before applying.')
			PluginInstallFrame.Desc3:SetText('Importance: |cffff5555Medium|r')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', function() KyaUI:ImportWeakAuras() end)
			PluginInstallFrame.Option1:SetText('Apply WeakAuras')
		end,

		-- 10. Finished
		[10] = function()
			PluginInstallFrame.SubTitle:SetText('Installation Complete')
			PluginInstallFrame.Desc1:SetText('You have completed the KyaUI installation process.')
			PluginInstallFrame.Desc2:SetText('Click the button below to finalize and reload the UI (all settings will be applied).')
			PluginInstallFrame.Option1:Show()
			PluginInstallFrame.Option1:SetScript('OnClick', addonTable.InstallComplete)
			PluginInstallFrame.Option1:SetText('Finished')
		end,
	},

	StepTitles = {
		[1] = 'Welcome',
		[2] = 'CVars',
		[3] = 'ElvUI',
		[4] = 'Theme',
		[5] = 'Chat',
		[6] = 'xCT+',
		[7] = 'Skada',
		[8] = 'DBM',
		[9] = 'WeakAuras',
		[10] = 'Finished',
	},

	StepTitlesColor = { 1, 1, 1 },
	StepTitlesColorSelected = { 1, 85 / 255, 85 / 255 },
	StepTitleWidth = 200,
	StepTitleButtonWidth = 180,
	StepTitleTextJustification = 'RIGHT',
}
