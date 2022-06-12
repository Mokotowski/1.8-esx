ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

local xDrug = 0

RandomValue = function()
	local percent = math.random(1, 100)
	local x = 0
	if percent >= 1 and percent <= 40 then
		x = 1
	elseif percent >= 41 and percent <= 65 then
		x = 2
	elseif percent >= 66 and percent <= 85 then
		x = 3
	elseif percent >= 86 and percent <= 95 then
		x = 4
	else
		x = 5
	end
	-- 5sz - 5%  ;  4sz - 10%  ;  3sz - 20%  ; 2sz - 25%  ;  1sz - 40%
	return x
end


ESX.RegisterServerCallback('mk_selldrugs:checkDrugs', function(source, cb, LSPD)
	local xPlayer = ESX.GetPlayerFromId(source)
	
	local weed_indica = xPlayer.getInventoryItem('indica_weed').count
	local weed_sativa = xPlayer.getInventoryItem('sativa_weed').count
	local weed_purple = xPlayer.getInventoryItem('purple_weed').count
	local amfetamin = xPlayer.getInventoryItem('amfetamin').count
	local cocaine = xPlayer.getInventoryItem('cocaine').count


	

	if weed_indica > 3 then
		if LSPD >= Config.CopsForWeed then
			cb(1)
		else
			cb(2)
		end
	elseif weed_sativa > 3 then
		if LSPD >= Config.CopsForMeth then
			cb(1)
		else
			cb(2)
		end
	elseif weed_purple > 3 then
		if LSPD >= Config.CopsForMeth then
			cb(1)
		else
			cb(2)
		end
	elseif amfetamin > 3 then
		if LSPD >= Config.CopsForCoke then
			cb(1)
		else
			cb(2)
		end
	elseif cocaine > 3 then
		if LSPD >= Config.CopsForWeed then
			cb(1)
		else
			cb(2)
		end
	
	end
end)



RegisterServerEvent('mk_selldrugs:sell')
AddEventHandler('mk_selldrugs:sell', function(LSPD)
	local xPlayer = ESX.GetPlayerFromId(source)	
	xDrug = 0
	local weed_indicaPrice = 5000
	local weed_sativaPrice = 9000
	local weed_purplePrice = 7000
	local amfetaminPrice = 30000
	local cocainePrice = 11000

	local weed_indica = xPlayer.getInventoryItem('indica_weed').count
	local weed_sativa = xPlayer.getInventoryItem('sativa_weed').count
	local weed_purple = xPlayer.getInventoryItem('purple_weed').count
	local amfetamin = xPlayer.getInventoryItem('amfetamin').count
	local cocaine = xPlayer.getInventoryItem('cocaine').count




	local drugName = ''
	local drugType 
	local hajs = 0
	xDrug = RandomValue()
	if weed_indica >= 1 then
		drugType = 'weed_indica'
		if weed_indica > 0 and weed_indica <= 1 then
			xDrug = 1
		elseif weed_indica == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif weed_indica == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif weed_indica == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif weed_sativa >= 1 then
		drugType = 'weed_sativa'
		if weed_sativa > 0 and weed_sativa <= 1 then
			xDrug = 1
		elseif weed_sativa == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif weed_sativa == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif weed_sativa == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif weed_purple >= 1 then
		drugType = 'weed_purple'
		if weed_purple > 0 and weed_purple <= 1 then
			xDrug = 1
		elseif weed_purple == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif weed_purple == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif weed_purple == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif amfetamin >= 1 then
		drugType = 'amfetamin'
		if amfetamin > 0 and amfetamin <= 1 then
			xDrug = 1
		elseif amfetamin == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif amfetamin == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif amfetamin == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	elseif cocaine >= 1 then
		drugType = 'cocaine'
		if cocaine > 0 and cocaine <= 1 then
			xDrug = 1
		elseif cocaine == 2 then
			if xDrug == 3 or xDrug == 4 or xDrug == 5 then
				xDrug = 2
			end
		elseif cocaine == 3 then
			if xDrug == 4 or xDrug == 5 then
				xDrug = 3
			end
		elseif cocaine == 4 then
			if xDrug == 5 then
				xDrug = 4
			end
		end
	end
local mnoznik = 1





	if drugType=='weed_indica' then
		hajs = math.floor(weed_indicaPrice * xDrug * mnoznik)
	drugName = 'słabej marichuany'
	xPlayer.addAccountMoney('black_money', hajs)
elseif drugType=='weed_sativa' then
		hajs = math.floor(weed_sativaPrice * xDrug * mnoznik)
	drugName = 'średniej marichuany'
	xPlayer.addAccountMoney('black_money', hajs)
elseif drugType=='weed_purple' then
		hajs = math.floor(weed_purplePrice * xDrug * mnoznik)
	drugName = 'mocnej marichuany'
	xPlayer.addAccountMoney('black_money', hajs)

	elseif drugType=='amfetamin' then
		hajs = math.floor(amfetaminPrice * xDrug * mnoznik)
	drugName = 'amfetaminy'
	xPlayer.addAccountMoney('black_money', hajs)
elseif drugType=='cocaine' then
		hajs = math.floor(cocainePrice * xDrug * mnoznik)
	drugName = 'kokainy'
	xPlayer.addAccountMoney('black_money', hajs)


	end

	

	if drugType ~= nil then
		xPlayer.removeInventoryItem(drugType, xDrug)
		if drugType == 'packagedweed' then
			xPlayer.addAccountMoney('black_money', hajs)
		end
		
		TriggerClientEvent('mk_selldrugs:stopSell', xPlayer.source, 1, ('~o~'.. xDrug ..' w ilośći '.. drugName..' za ' .. hajs .. "$" ))
		TriggerEvent('top_discord:send', source, 'https://discordapp.com/api/webhooks/951172473536274473/J5Dxer8MQGhYGuuFsIdmUOqj1vFV9s4AXTtFa0ETzY-Y_9rvBOwVSyW7Xpk9dKjZBI9w', 'Sprzedał '.. drugType ..'w ilośći '.. xDrug..' za: $' ..hajs)
	end
end)


RegisterServerEvent('mk_selldrugs:triggerDispatch')
AddEventHandler('mk_selldrugs:triggerDispatch', function(pos, street, photo)
	local xPlayers = ESX.GetPlayers()

	local msg = ("^r[^310-35^7] ^6^*Zgłoszenie sprzedaży narkotyków. Ulica: ^7^_"..street)
	for i=1, #xPlayers, 1 do
		local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
		if (xPlayer.job.name == 'police') then
			TriggerClientEvent('mk_selldrugs:showNotify', xPlayer.source, pos, street, msg)
		end
	end
end)

ESX.RegisterServerCallback('count:policeeee', function(source, cb)
    count = 0

    for _, playerId in pairs(ESX.GetPlayers()) do
        xPlayer = ESX.GetPlayerFromId(playerId)
        if xPlayer.job.name == 'police' then
            count = count + 1
        end
    end

    cb(count)

end)



