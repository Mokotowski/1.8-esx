ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('kamizelka', function(source)
	TriggerClientEvent('esx_kamizelka:zakladanie', source)
	local xPlayer  = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('kamizelka', 1)
end)