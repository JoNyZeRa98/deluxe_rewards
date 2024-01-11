local isPlayerLoaded = false

PlayerLoaded = function()
    if isPlayerLoaded then return end
	TriggerServerEvent('deluxe-reward-start-thread-server')
    isPlayerLoaded = true
end

if Config.Framework == "esx" then
    RegisterNetEvent("esx:playerLoaded", PlayerLoaded)
elseif Config.Framework == "qb" then
    RegisterNetEvent("QBCore:Client:OnPlayerLoaded", PlayerLoaded)
else
    print("The framework you are running is not supported")
    return
end

AddEventHandler('onResourceStart', function(resourceName)
	if resourceName == 'deluxe_rewards' then
		Wait(1000)
		isPlayerLoaded = true
		TriggerServerEvent('deluxe-reward-start-thread-server')
	end
end)

if Config.Commands.EnableShowCommand then
	RegisterCommand(Config.Commands.ShowUICommand, function(source)
		OpenNui(true)
	end)
end

if Config.Commands.EnableHideCommand then
	RegisterCommand(Config.Commands.HideUICommand, function(source)
		CloseNui(false)
	end)
end

RegisterNetEvent("deluxe_rewards:StartThread", function(rewardcount)
	if not tonumber(rewardcount) or enabled then return end
	OpenNui(true)
	local timetoreward = Config.TimeToReward
	local timeplayed = 0
	local enabled = true
	local function gamelobby()
		while enabled and isPlayerLoaded do
			if timetoreward >= 1 then
			
			if not Config.Rewards[rewardcount] then
				rewardcount = 0 -- Restart the loop if max reward is reached
			end

			rewardname = Config.Translation["reward"] .. Config.Rewards[rewardcount].name
			itemNameFromLua = Config.Rewards[rewardcount].name
			timetoreward = timetoreward - 1
			TriggerEvent('updateRewardNui', timetoreward, rewardname, itemNameFromLua)
			elseif timetoreward == 0 then
				timetoreward = 0
				itemNameFromLua = Config.Rewards[rewardcount].name
				rewardname = Config.Translation["reward"] .. Config.Rewards[rewardcount].name
				TriggerEvent('updateRewardNui', timetoreward, rewardname, itemNameFromLua)
				while timetoreward == 0 do
					if IsControlJustReleased(0, Config.KeyOpenUIMenu) then
						timetoreward = Config.TimeToReward
						title = 'Reward obtained'
						msg = Config.Translation["you_received"] .. Config.Rewards[rewardcount].quantity .. ' x ' .. Config.Rewards[rewardcount].name
						duration = 5000
						TriggerEvent('deluxe-handle-ox-notifications-reward', title, msg, duration)
						TriggerServerEvent('deluxe-reward-start-thread-function', rewardcount)
						enabled = false
						break
					end
					Wait(0)
				end
			end
			Wait(1000)
		end
	end CreateThread(gamelobby)
end)