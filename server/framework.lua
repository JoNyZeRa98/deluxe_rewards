GetPlayer = function (source)
    local source = tonumber(source)
    if Config.Framework == "esx" then
        return Framework.GetPlayerFromId(source)
    elseif Config.Framework == "qb" then
        return Framework.Functions.GetPlayer(source)
    end
end

GetPlayerIdentifier = function(xPlayer)
    if not xPlayer then return end
    if Config.Framework == "esx" then
       return xPlayer.identifier
    elseif Config.Framework == "qb" then
        return xPlayer.PlayerData.license
    end
end