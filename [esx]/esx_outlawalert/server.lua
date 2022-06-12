ESX     = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_jb_outlawalert:notifyShots')
AddEventHandler('esx_jb_outlawalert:notifyShots', function(coords, str, isPolice)
    TriggerClientEvent('esx_jb_outlawalert:notifyShots', -1, coords, str, isPolice)
end)

RegisterServerEvent('esx_jb_outlawalert:notifyAccident')
AddEventHandler('esx_jb_outlawalert:notifyAccident', function(coords, str, isPolice)
    TriggerClientEvent('esx_jb_outlawalert:notifyAccident', -1, coords, str, isPolice)
end)

RegisterServerEvent('esx_jb_outlawalert:notifyCombat')
AddEventHandler('esx_jb_outlawalert:notifyCombat', function(coords, str)
    TriggerClientEvent('esx_jb_outlawalert:notifyCombat', -1, coords, str)
end)


RegisterServerEvent('esx_jb_outlawalert:notifyThief')
AddEventHandler('esx_jb_outlawalert:notifyThief', function(coords, str)
    TriggerClientEvent('esx_jb_outlawalert:notifyThief', -1, coords, str)
end)

RegisterServerEvent('esx_jb_outlawalert:notifyBanking')
AddEventHandler('esx_jb_outlawalert:notifyBanking', function(sender, coords, text, makePhoto)
    local xPlayer = ESX.GetPlayerFromId(sender)
    TriggerClientEvent('esx_jb_outlawalert:notifyBanking', -1, xPlayer, coords, text, makePhoto)
end)