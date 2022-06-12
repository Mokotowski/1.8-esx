ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('inside-warehouse:Payout')
AddEventHandler('inside-warehouse:Payout', function(arg)	
	local xPlayer = ESX.GetPlayerFromId(source)
	local Payout = Config.Payout * arg
	
	xPlayer.addMoney(Payout)
end)