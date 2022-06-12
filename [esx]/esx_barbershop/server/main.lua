ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_barbershop:pay')
AddEventHandler('esx_barbershop:pay', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)

	xPlayer.removeMoney(Config.Price)
	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Zapłaciłeś/aś ' .. ESX.Math.GroupDigits(Config.Price), length = 2500, style = { ['background-color'] = '#2f5c73', ['color'] = '#FFFFFF' } })
end)

ESX.RegisterServerCallback('esx_barbershop:checkMoney', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)

	cb(xPlayer.getMoney() >= Config.Price)
end)
