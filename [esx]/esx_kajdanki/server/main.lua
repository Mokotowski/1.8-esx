ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('bestup_kajdanki:PlayWithinDistance')
AddEventHandler('bestup_kajdanki:PlayWithinDistance', function(maxDistance, soundFile, soundVolume)
    TriggerClientEvent('bestup_kajdanki2:PlayWithinDistance', -1, source, maxDistance, soundFile, soundVolume)
end)



ESX.RegisterServerCallback("kajdanki:checkItem", function(source, cb, itemname, count)
    local xPlayer = ESX.GetPlayerFromId(source)
    local item = xPlayer.getInventoryItem(itemname).count
    if item >= count then
        cb(true)
    else
        cb(false)
    end
end)



ESX.RegisterServerCallback('bestup_kajdanki:get_amount', function(source, cb, item)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    local quantity = xPlayer.getInventoryItem(item).count
    cb(quantity)
end)



RegisterServerEvent('bestup_kajdanki:confiscatePlayerItem')
AddEventHandler('bestup_kajdanki:confiscatePlayerItem', function(target, itemType, itemName, amount)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local account = targetXPlayer.getAccount('black_money')
	account = account.money
	ammount2 = amount + ".0"

		local xx = ESX.GetPlayerFromId(target)

		local data = {
			name       = GetPlayerName(target),
			job        = xx.job,
			inventory  = xx.inventory,
			accounts   = xx.accounts,
			weapons    = xx.loadout
		}



	if itemType == 'item_standard' then
		local targetItem = targetXPlayer.getInventoryItem(itemName)
		local sourceItem = sourceXPlayer.getInventoryItem(itemName)

		-- does the target player have enough in their inventory?
		if targetItem.count > 0 and targetItem.count <= amount then
		
			-- can the player carry the said amount of x item?
			if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
				TriggerClientEvent('esx:showNotification', _source, "Błędna ilość")
			else
				targetXPlayer.removeInventoryItem(itemName, amount)
				sourceXPlayer.addInventoryItem   (itemName, amount)
				TriggerClientEvent('esx:showNotification', _source, 'Skonfiskowałeś ~g~'..sourceItem.label.. '~w~ w ilości ~g~'..amount.. '~w~ osobie ~g~'..target)
				TriggerClientEvent('esx:showNotification', target,  'Zabrano ci ~g~'..sourceItem.label..'~w~ w ilości ~g~'..amount.. '~w~ przez ~g~' .._source)
				item = sourceItem.label
				ktos = targetXPlayer.name
				ty = sourceXPlayer.name
				ilosc = amount

				TriggerEvent("esx_discordlog:przeszukiwanie_przedmiot", source, target, sourceItem.label, amount)
			end
		else
			TriggerClientEvent('esx:showNotification', _source, "Błędna ilość")
		end
	elseif itemType == 'item_cash' then
			local targetXPlayer = ESX.GetPlayerFromId(target)
			local money_target = targetXPlayer.getMoney(target)
			if money_target ~= amount then
				TriggerClientEvent('esx:showNotification', _source, "Błędna ilość")
			else
				targetXPlayer.removeMoney(amount)
				sourceXPlayer.addMoney(amount)
				TriggerEvent("esx_discordlog:przeszukiwanie_gotowka", source, target, "Gotówka", amount)
			end
	elseif itemType == 'item_account' then
		if account ~= amount or account ~= ammount2 then
			TriggerClientEvent('esx:showNotification', _source, "Błędna ilość")
		else
			targetXPlayer.removeAccountMoney(itemName, amount)
			sourceXPlayer.addAccountMoney   (itemName, amount)
			TriggerClientEvent('esx:showNotification', _source, 'Skonfiskowałeś ~g~'..itemName.. '~w~ w ilości ~g~'..amount.. '~w~ osobie ~g~'..target)
			TriggerClientEvent('esx:showNotification', target,  'Zabrano ci ~g~'..itemName.. '~w~ w ilości ~g~'..amount..'~w~ przez ~g~'.._source)
			TriggerEvent("esx_discordlog:przeszukiwanie_blackmoney", source, target, "Brudne Pieniądze", amount)
		end

	elseif itemType == 'item_weapon' then
			if amount == nil then amount = 0 end
			local get = false

				for i=1, #data.weapons, 1 do
					d = data.weapons[i].name
					if d == itemName then
						targetXPlayer.removeWeapon(itemName, amount)
						sourceXPlayer.addWeapon   (itemName, amount)

						TriggerClientEvent('esx:showNotification', target, 'Skonfiskowano ci broń ~g~'..ESX.GetWeaponLabel(itemName).. '~w~ z amunicją ~g~'..amount.. '~w~ przez ~g~'.._source)
						TriggerClientEvent('esx:showNotification', _source,  'Skonfiskowałeś ~g~'..ESX.GetWeaponLabel(itemName).. '~w~ z amunicją ~g~' ..amount.. '~w~ osobie ~g~'..target)
								TriggerEvent("esx_discordlog:przeszukiwanie_bron", source, target, ESX.GetWeaponLabel(itemName), amount)
								get = true

					else
					end


				end

				if get == true then

				else
					TriggerClientEvent('esx:showNotification', _source, "Błędna ilość")
				end


	end
end)


RegisterServerEvent('bestup_kajdanki:handcuff_all')
AddEventHandler('bestup_kajdanki:handcuff_all', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('bestup_kajdanki:handcuff_all', target)
		TriggerClientEvent('esx:showNotification', target,  '~r~Zostałeś zakuty/rozkuty przez: '..source)
		TriggerClientEvent('esx:showNotification', source,  '~y~Zakuwasz/Rozkuwasz: '..target)
end)


RegisterServerEvent('bestup_kajdanki:handcuff')
AddEventHandler('bestup_kajdanki:handcuff', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)
		TriggerClientEvent('bestup_kajdanki:handcuff', target)
		TriggerClientEvent('esx:showNotification', target,  '~r~Zostałeś zakuty/rozkuty przez: '..source)
		TriggerClientEvent('esx:showNotification', source,  '~y~Zakuwasz/Rozkuwasz: '..target)
end)

RegisterServerEvent('bestup_kajdanki:drag')
AddEventHandler('bestup_kajdanki:drag', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('bestup_kajdanki:drag', target, source)

end)

RegisterServerEvent('bestup_kajdanki:putInVehicle')
AddEventHandler('bestup_kajdanki:putInVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('bestup_kajdanki:putInVehicle', target)
end)

RegisterServerEvent('bestup_kajdanki:OutVehicle')
AddEventHandler('bestup_kajdanki:OutVehicle', function(target)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerClientEvent('bestup_kajdanki:OutVehicle', target)
end)

ESX.RegisterServerCallback('bestup_kajdanki:getOtherPlayerData', function(source, cb, target)

		local xPlayer = ESX.GetPlayerFromId(target)

		local result = MySQL.Sync.fetchAll('SELECT firstname, lastname, sex, dateofbirth, height FROM users WHERE identifier = @identifier', {
			['@identifier'] = xPlayer.identifier
		})

		local firstname = result[1].firstname
		local lastname  = result[1].lastname
		local sex       = result[1].sex
		local dob       = result[1].dateofbirth
		local height    = result[1].height

		local data = {
			name      = GetPlayerName(target),
			job       = xPlayer.job,
			inventory = xPlayer.inventory,
			accounts  = xPlayer.accounts,
			weapons   = xPlayer.loadout,
			firstname = firstname,
			lastname  = lastname,
			sex       = sex,
			dob       = dob,
			height    = height
		}

		TriggerEvent('esx_status:getStatus', target, 'drunk', function(status)
			if status ~= nil then
				data.drunk = math.floor(status.percent)
			end
		end)

		if Config.EnableLicenses then
			TriggerEvent('esx_license:getLicenses', target, function(licenses)
				data.licenses = licenses
				cb(data)
			end)
		else
			local xPlayer_target = ESX.GetPlayerFromId(target)
			local money_target = xPlayer.getMoney(target)
			money_cash = money_target
			cb(data, money_cash)
		end


end)

ESX.RegisterServerCallback('bestup_kajdanki:getPlayerInventory', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local items   = xPlayer.inventory

	cb( { items = items } )
end)

ESX.RegisterUsableItem('handcuffs', function(source)
	TriggerClientEvent('bestup_kajdanki:MenuKajdanek', source)
	Wait(2000)
end)

ESX.RegisterServerCallback('bestup_radio:getItemAmount', function(source, cb, item)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	if xPlayer ~= nil then
		local quantity = xPlayer.getInventoryItem(item).count
	end
 	quantity = 0
	cb(quantity)
end)



TriggerEvent('es:addGroupCommand', 'kaje', '_dev', function(source, args, user)
	if args[1] ~= nil then
		if GetPlayerName(tonumber(args[1])) ~= nil then
			TriggerClientEvent('bestup_kajdanki:handcuff', tonumber(args[1]))
		end
	else
		TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Błędne ID.' } })
	end
end, function(source, args, user)
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Insufficient Permissions.' } })
end)




RegisterServerEvent("esx_policeArmory:weaponTakenOut")
AddEventHandler("esx_policeArmory:weaponTakenOut", function(weapon,giveAmmo)
    local xPlayer = ESX.GetPlayerFromId(source)
    local id = ESX.GetPlayerFromId(source).getIdentifier()
	
    if xPlayer then
    local id = ESX.GetPlayerFromId(source).getIdentifier()
		MySQL.Async.fetchAll("SELECT weapons FROM user WHERE identifier='".. id .."'", {}, function(weapRow)
			local addWeaponToDB
			for k,v in pairs(weapRow) do
				addWeaponToDB = v.weapons
			end
			addWeaponToDB = addWeaponToDB .. weapon .. ", "
			MySQL.Async.execute("UPDATE user_policeArmory SET weapons='".. addWeaponToDB .."' WHERE identifier='".. id .."'", {}, function ()
			end)
		end)
        xPlayer.addWeapon(weapon, Config.AmmountOfAmmo)
		local DATE = os.date("%H:%M (%d.%m.%y)")
		local message = "**" ..GetPlayerName(source).. "** [" ..xPlayer.getIdentifier().. "] **|** has **taken** " .. ESX.GetWeaponLabel(weapon) .. " from the Police Armory **|** " ..DATE
		PerformHttpRequest(""..Config.DiscordWebook.."", function(err, text, headers) end, 'POST', json.encode({username = "Police Armory", content = message}), { ['Content-Type'] = 'application/json' })
		TriggerClientEvent("esx:showNotification", source, "You ~y~took~s~ 1x ~r~" .. ESX.GetWeaponLabel(weapon).."~r~")
    end
	
end)











RegisterCommand("ezz", function(source, args, rawCommand)
local DATE = os.date("%H:%M (%d.%m.%y)")
print(DATE)
print("---------------------------------")
local id = ESX.GetPlayerFromId(source).getIdentifier()
print(id)

MySQL.Async.fetchAll("SELECT date FROM user WHERE identifier='".. id .."'", {}, function()
	local DATE = os.date("%H:%M (%d.%m.%y)")
	MySQL.Async.execute("UPDATE data SET user='".. DATE .."' WHERE identifier='".. id .."'", {}, function ()
    end)
end)




end)

