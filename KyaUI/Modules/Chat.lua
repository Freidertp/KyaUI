-- KyaUI: setup de ventanas de chat (portado de MerfinUI:SetupChat).
-- Crea/renombra las ventanas GNL, CL, LT, GLD, /W, GLB y asigna sus grupos de mensajes.
local addonName, addonTable = ...
local E, L, V, P, G = unpack(ElvUI)
local CH = E:GetModule('Chat', true)

local _G = _G
local ipairs, pairs = ipairs, pairs
local LOCALE = GetLocale()

local FCF_SetWindowName = FCF_SetWindowName
local FCF_OpenNewWindow = FCF_OpenNewWindow
local FCF_ResetChatWindows = FCF_ResetChatWindows
local FCFDock_SelectWindow = FCFDock_SelectWindow
local FCF_SetChatWindowFontSize = FCF_SetChatWindowFontSize
local ChatFrame_AddMessageGroup = ChatFrame_AddMessageGroup
local ChatFrame_RemoveMessageGroup = ChatFrame_RemoveMessageGroup
local ChatFrame_RemoveAllMessageGroups = ChatFrame_RemoveAllMessageGroups
local JoinChannelByName = JoinChannelByName
local ChatFrame_RemoveChannel = ChatFrame_RemoveChannel
local ChatFrame_AddChannel = ChatFrame_AddChannel
local GetChannelList = GetChannelList

local localizedChannels = {
	['enUS'] = { ['General'] = true, ['Trade'] = true, ['LocalDefense'] = true, ['LookingForGroup'] = true },
	['ruRU'] = { ['Общий'] = true, ['Торговля'] = true, ['ОборонаЛокальный'] = true, ['ПоискСпутников'] = true },
	['deDE'] = { ['Allgemein'] = true, ['Handel'] = true, ['LokaleVerteidigung'] = true, ['SucheNachGruppe'] = true },
}

function KyaUI:SetupChat()
	FCF_ResetChatWindows()

	FCF_OpenNewWindow() -- id 3
	FCF_OpenNewWindow() -- id 4
	FCF_OpenNewWindow() -- id 5
	FCF_OpenNewWindow() -- id 6

	local fontSize = 15

	for _, name in ipairs(_G.CHAT_FRAMES) do
		local frame = _G[name]
		local id = frame:GetID()

		if E.private.chat and E.private.chat.enable and CH and CH.UpdateChatTabs then
			CH:UpdateChatTabs()
		end

		FCF_SetChatWindowFontSize(nil, frame, fontSize)

		if id == 1 then
			FCF_SetWindowName(frame, 'GNL')
		elseif id == 2 then
			FCF_SetWindowName(frame, 'CL')
		elseif id == 3 then
			FCF_SetWindowName(frame, 'LT')
		elseif id == 4 then
			FCF_SetWindowName(frame, 'GLD')
		elseif id == 5 then
			FCF_SetWindowName(frame, '/W')
		elseif id == 6 then
			FCF_SetWindowName(frame, 'GLB')
		end
	end

	-- LT (Loot)
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame3)
	for _, k in ipairs({ 'LOOT', 'MONEY' }) do ChatFrame_AddMessageGroup(_G.ChatFrame3, k) end

	-- GLD (Guild)
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame4)
	for _, k in ipairs({ 'GUILD', 'OFFICER', 'GUILD_ACHIEVEMENT' }) do ChatFrame_AddMessageGroup(_G.ChatFrame4, k) end

	-- /W (Whisper)
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame5)
	for _, k in ipairs({ 'WHISPER', 'WHISPER_INFORM' }) do ChatFrame_AddMessageGroup(_G.ChatFrame5, k) end

	-- GLB (Global/General)
	ChatFrame_RemoveAllMessageGroups(_G.ChatFrame6)
	for _, k in ipairs({ 'GLOBAL', 'GENERAL' }) do ChatFrame_AddMessageGroup(_G.ChatFrame6, k) end

	FCFDock_SelectWindow(_G.GENERAL_CHAT_DOCK, _G.ChatFrame1)

	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'GENERAL')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'GLOBAL')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'LOOT')
	ChatFrame_RemoveMessageGroup(_G.ChatFrame1, 'MONEY')

	-- asegurar membresia en los canales estandar
	if localizedChannels[LOCALE] then
		for channelName in pairs(localizedChannels[LOCALE]) do
			JoinChannelByName(channelName)
		end
	end

	-- mover TODOS los canales globales de GNL (ChatFrame1) a GLB (ChatFrame6).
	-- Incluye los canales extra de CoA/Ascension (Ascension, Newcomers, Zone, etc.) sin depender
	-- de sus nombres exactos: GetChannelList() devuelve id,name,... -> movemos cada string.
	local list = { GetChannelList() }
	for i = 1, #list do
		local name = list[i]
		if type(name) == 'string' and name ~= '' then
			ChatFrame_RemoveChannel(_G.ChatFrame1, name)
			ChatFrame_AddChannel(_G.ChatFrame6, name)
		end
	end

	addonTable:PluginInstallStepComplete('Chat')
end
