--[[ _______           __                                 _______                     
|       \         |  \                               |       \                    
| ▓▓▓▓▓▓▓\ ______ | ▓▓__    __ __    __  ______      | ▓▓▓▓▓▓▓\ ______  __     __ 
| ▓▓  | ▓▓/      \| ▓▓  \  |  \  \  /  \/      \     | ▓▓  | ▓▓/      \|  \   /  \
| ▓▓  | ▓▓  ▓▓▓▓▓▓\ ▓▓ ▓▓  | ▓▓\▓▓\/  ▓▓  ▓▓▓▓▓▓\    | ▓▓  | ▓▓  ▓▓▓▓▓▓\\▓▓\ /  ▓▓
| ▓▓  | ▓▓ ▓▓    ▓▓ ▓▓ ▓▓  | ▓▓ >▓▓  ▓▓| ▓▓    ▓▓    | ▓▓  | ▓▓ ▓▓    ▓▓ \▓▓\  ▓▓ 
| ▓▓__/ ▓▓ ▓▓▓▓▓▓▓▓ ▓▓ ▓▓__/ ▓▓/  ▓▓▓▓\| ▓▓▓▓▓▓▓▓    | ▓▓__/ ▓▓ ▓▓▓▓▓▓▓▓  \▓▓ ▓▓  
| ▓▓    ▓▓\▓▓     \ ▓▓\▓▓    ▓▓  ▓▓ \▓▓\\▓▓     \    | ▓▓    ▓▓\▓▓     \   \▓▓▓   
 \▓▓▓▓▓▓▓  \▓▓▓▓▓▓▓\▓▓ \▓▓▓▓▓▓ \▓▓   \▓▓ \▓▓▓▓▓▓▓     \▓▓▓▓▓▓▓  \▓▓▓▓▓▓▓    \▓    
 
           ______________________________________
  ________|           Deluxe Rewards             |_______
  \       |      deluxedevelopment.tebex.io      |      /
   \      |                                      |     /
   /      |______________________________________|     \
  /__________)                                (_________\                                                                           
  
    Discord Support: https://discord.gg/Ypt2m8FjRy

	Version 1.0 | FREE RELEASE by Discord: jonyzeratv [Dev & Owner Deluxe Dev]

Before you go ahead make sure you have downloaded and installed these dependency or you might have issues running this script.
1] OXMySQL: https://github.com/overextended/oxmysql/releases
2] OXLib : https://github.com/overextended/ox_lib/releases

Make sure you have in your server cfg:

ensure oxmysql
ensure ox_lib

]]

Config = {}

Config.Framework = 'esx' -- Available: esx, qb 

-- Reward Key Setting
Config.KeyOpenUIMenu = 38 -- Reward Key to get the item [38 = E]	

Config.TimeToReward = 100 -- Time to get each reward

Config.Commands = {
	EnableShowCommand = true, -- Enable command to open UI? true/false
	ShowUICommand = 'showreward', -- Command to hide the reward UI
	EnableHideCommand = true, -- Enable command to close UI? true/false
	HideUICommand = 'hidereward' -- Command to hide the reward UI
}

Config.InventoryType = 'ox' -- Available esx, ox
Config.NotificationType = 'ox' -- Available esx, ox , okok , custom (If you set custom check below the function SetCustomNotification)
Config.OxAlignNotifications = 'center-left' -- Available: 'top' or 'top-right' or 'top-left' or 'bottom' or 'bottom-right' or 'bottom-left' or 'center-right' or 'center-left' [You must have Config.Notificationtype = 'ox']

---[[ You can add infinite rewards and set the item name that the player should receive and the quantity ]]---
---@param name | item name to give
---@param quantity | item quantity to give
Config.Rewards = {
	[0] = { name = 'burger', quantity = 4 },
	[1] = { name = 'money', quantity = 1000 },
	[2] = { name = 'weapon_pistol', quantity = 1 },
	[3] = { name = 'money', quantity = 1000 },
	[4] = { name = 'burger', quantity = 5 },
	[5] = { name = 'weapon_pistol', quantity = 1},
	[6] = { name = 'money', quantity = 500},
	[7] = { name = 'burger', quantity = 10 },
	[8] = { name = 'money', quantity = 1000 },
	[9] = { name = 'burger', quantity = 10 },
	[10] = { name = 'weapon_pistol', quantity = 2},
	-- You can add infinite rewards, when last reward is encountered, then it will start over
}

-- Translate everything according to your language there.
Config.Translation = {
    ["receive_reward"] = "[E] Receive Reward",
	["cant_collect"] = "Can't collect item",
	["you_received"] = "You just received ",
	["reward"] = "Reward: ",
}