print("^3------------------------------------------------------------------------------------------------------")
print("^1[^2Deluxe-Rewards^1] Deluxe-Rewards v1.0 | Make sure that you have installed oxmysql & ox_lib  [^3Developed by Jonyzera^1]^0" )
print("^1[^2Deluxe-Rewards^1] https://deluxedevelopment.tebex.io/  https://discord.gg/pFUT9TYNUZ        [^3Discord: jonyzeratv^1]^0")
print("^3------------------------------------------------------------------------------------------------------^7")

if Config.Framework == 'esx' then
    Framework = exports["es_extended"]:getSharedObject()
elseif Config.Framework == 'qb' then
    Framework = exports['qb-core']:GetCoreObject()
else
    print("The framework you are running is not supported")
    return
end

if GetCurrentResourceName() ~= 'deluxe_rewards' then
    print('Please rename the script to deluxe_rewards and keep the author name.')
    return
end

RegisterNetEvent("deluxe-reward-start-thread-server", function()
    local src = source
    local xPlayer = GetPlayer(source)
    local PlayerIdentifier = GetPlayerIdentifier(xPlayer)

    if not xPlayer and not PlayerIdentifier then
        return
    end

    local response = MySQL.query.await(
        'SELECT `identifier`,`rewardcount` FROM `deluxe_rewards` WHERE `identifier` = ?',
        {PlayerIdentifier})

    if next(response) == nil then
        local updateSQL = MySQL.insert.await(
            'INSERT INTO `deluxe_rewards` (identifier, rewardcount) VALUES (?, ?)',
            {PlayerIdentifier, 0})

        TriggerClientEvent("deluxe_rewards:StartThread", src , 0)
    else
        for i = 1, #response do
            local row = response[i]
            local rewardcount = tonumber(row.rewardcount) 
            TriggerClientEvent("deluxe_rewards:StartThread", src , rewardcount)
        end
    end
end)

RegisterNetEvent("deluxe-reward-start-thread-function", function (rewardcount)
    local src = source
    local xPlayer = GetPlayer(source)
    local PlayerIdentifier = GetPlayerIdentifier(xPlayer)
    if not xPlayer and not PlayerIdentifier or not tonumber(rewardcount) then
        return
    end

    local rewardcount = tonumber(rewardcount)

    if Config.Framework == 'esx' then
        xPlayer.addInventoryItem(Config.Rewards[rewardcount].name, Config.Rewards[rewardcount].quantity)
    elseif Config.Framework == 'qb' then
        xPlayer.Functions.AddItem(Config.Rewards[rewardcount].name, Config.Rewards[rewardcount].quantity)
    end
 
    local response = MySQL.query.await(
        'SELECT `identifier`,`rewardcount` FROM `deluxe_rewards` WHERE `identifier` = ?',
        {PlayerIdentifier})

    if next(response) == nil then
        local updateSQL = MySQL.insert.await(
            'INSERT INTO `deluxe_rewards` (identifier, rewardcount) VALUES (?, ?)',
            {PlayerIdentifier, rewardcount})

        TriggerClientEvent("deluxe_rewards:StartThread", src, rewardcount)
    else
        for i = 1, #response do
            local row = response[i]
            local rewardcount = rewardcount + 1
            local affectedRows = MySQL.update.await('UPDATE deluxe_rewards SET rewardcount = ?  WHERE identifier = ?', {
                rewardcount, PlayerIdentifier
            })
            TriggerClientEvent("deluxe_rewards:StartThread", src , rewardcount)
        end
    end
end)