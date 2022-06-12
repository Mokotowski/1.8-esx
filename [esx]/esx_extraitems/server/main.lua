ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


ESX.RegisterUsableItem('sandwich', function(source)
	TriggerClientEvent('esx_extraitems:sandwich', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	xPlayer.removeInventoryItem('sandwich', 1)
	TriggerClientEvent('esx_status:add', source, 'hunger', 230000)
end)

ESX.RegisterUsableItem('rose', function(source)
	TriggerClientEvent('esx_extraitems:rose', source)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.removeInventoryItem('rose', 1)
end)


