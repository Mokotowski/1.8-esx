ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)




RegisterServerEvent('rtwbtwrwwtwwh6wh56wh5hw656wh564h654wh')
AddEventHandler('rtwbtwrwwtwwh6wh56wh5hw656wh564h654wh', function(money)
	local xPlayer = ESX.GetPlayerFromId(source)
	xPlayer.addMoney(money)
end)