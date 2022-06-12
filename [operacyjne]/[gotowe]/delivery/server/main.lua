ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

------------------ Anti D**PER nie dotykać ----------------------------------------------------------
-----------------------------------------------------------------------------------------------------
RegisterNetEvent("loadRes-tgiann-antiDump")
AddEventHandler("loadRes-tgiann-antiDump", function(data)
    print(data)
end)
------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------

ESX.RegisterServerCallback('delivery:getVehicles', function (source, cb)
	local c = ESX.GetPlayerFromId(source)
    if not c then
        return
    end;
    MySQL.Async.fetchAll("SELECT plate, vehicle FROM owned_vehicles WHERE owner = @cid", {["@cid"] = c.identifier}, function (result)
		--for i=1, #result, 1 do
		--	table.insert(vehicles, {
		--		name  = result[i].stored,
		--		plate = result[i].plate,
       --         props = json.decode(g["vehicle"])
		--	})
			local vehicles = {} 
			for f, g in ipairs(result) do
				table.insert(vehicles,{ ["plate"] = g["plate"], ["props"] = json.decode(g["vehicle"])})

			end;
		
			
			if result ~= nil then 
			end

		cb(vehicles)
	end)
end)

RegisterServerEvent('delivery:finish')
AddEventHandler('delivery:finish', function(plate)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	xPlayer.removeAccountMoney('bank', Config.Price)
end)


RegisterServerEvent('delivery:checkMoney')
AddEventHandler('delivery:checkMoney', function()
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer == nil then
		return
	end	
	moneys = xPlayer.getAccount('bank').money
	TriggerClientEvent("checkMoney2", source, moneys)
end)


