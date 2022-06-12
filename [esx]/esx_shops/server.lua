ESX             = nil
local ShopItems = {}

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

MySQL.ready(function()
	MySQL.Async.fetchAll('SELECT * FROM shops LEFT JOIN items ON items.name = shops.item', {}, function(shopResult)
		for i=1, #shopResult, 1 do
			if shopResult[i].name then
				if ShopItems[shopResult[i].store] == nil then
					ShopItems[shopResult[i].store] = {}
				end

				if shopResult[i].limit == -1 then
					shopResult[i].limit = 30
				end 
				
				table.insert(ShopItems[shopResult[i].store], {
					label = shopResult[i].label,
					item  = shopResult[i].item,
					limit = shopResult[i].limit,   
					price = shopResult[i].price,
				})
			else
			end
		end
	end)
end)

ESX.RegisterServerCallback('esx_shops:requestDBItems', function(source, cb)
	cb(ShopItems)
end)


sended  = false
dodane = false


RegisterServerEvent('neey_sim:useSIM')
AddEventHandler('neey_sim:useSIM', function(itemLabel)
    local phoneNumber = tonumber(string.sub(itemLabel, 14))
    print(phoneNumber)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier AND `number` = @sim', {
        ['@identifier'] = xPlayer.identifier,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1].used == '0' then
                MySQL.Async.execute(
                    'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 0 WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 1 WHERE number = @phone_number',
                    {
                        ['@phone_number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Aktywowano karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerEvent('gcPhone:UpdateALL_SIM', xPlayer.source, phoneNumber)
            else
                MySQL.Async.execute(
                    'UPDATE users SET phone_number = NULL WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 0 WHERE number = @phone_number',
                    {
                        ['@phone_number'] = phoneNumber
                    }
                    )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~r~Dezaktywowano karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, '')
            end
        end
    end)
end)

RegisterServerEvent('neey_sim:dropSIM')
AddEventHandler('neey_sim:dropSIM', function(itemLabel)
    local phoneNumber = string.sub(itemLabel, 14)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier AND `number` = @sim', {
        ['@identifier'] = xPlayer.identifier,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1].used == '0' then
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = NULL WHERE number = @number',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Wyrzucono karte SIM: #' .. phoneNumber, 5000, 'primary')
            else
                MySQL.Async.execute(
                    'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = ''
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = NULL WHERE number = @number',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 0 WHERE number = @number',
                    {
                        ['@number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~r~Dezaktywowano karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, '')
            end
        end
    end)
end)

ESX.RegisterServerCallback('OsloRP:getMoney', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    money = xPlayer.getMoney()
    cb(money)
end)



ESX.RegisterServerCallback('OsloRP:getMoney_bank', function(source, cb)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    money = xPlayer.getAccount('bank').money
    cb(money)
end)






RegisterServerEvent('OsloRP:buySim')
AddEventHandler('OsloRP:buySim', function()

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  local num = getPhoneRandomNumber()
  xPlayer.removeMoney(25)
  MySQL.Async.fetchAll(
    'SELECT * FROM sim WHERE number = @sim',
    {
        ['@sim'] = num
    },
    function(result)
        if result ~= nil then
            if #result > 0 then
                TriggerEvent('OsloRP:buySim')
            else
                MySQL.Async.execute(
                    'INSERT INTO `sim` (`identifier`, `number`, `label`, `owner`) VALUES (@identifier, @phone_number, @label, @identifier)',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = num,
                        ['@label'] = 'Karta SIM - #' .. num,      
                    }
                )
               TriggerClientEvent("FeedM:showAdvancedNotification", xPlayer.source, 'CoS-LTE', 'Zakup', '~g~Pomyślnie zakupiono Karte SIM #' .. num, 'CHAR_LIFEINVADER', 5000, 'primary')
            end
        else
            MySQL.Async.execute(
                'INSERT INTO `sim` (`identifier`, `number`, `label`, `owner`) VALUES (@identifier, @phone_number, @label, @identifier)',
                {
                    ['@identifier']   = xPlayer.identifier,
                    ['@phone_number'] = num,
                    ['@label'] = 'Karta SIM - #' .. num,      
                }
            )
            TriggerClientEvent("FeedM:showAdvancedNotification", xPlayer.source, 'CoS-LTE', 'Zakup', '~g~Pomyślnie zakupiono Karte SIM #' .. num, 'CHAR_LIFEINVADER', 5000, 'primary')
        end
  end )
end)



RegisterServerEvent('OsloRP:buySim_bank')
AddEventHandler('OsloRP:buySim_bank', function()

  local _source = source
  local xPlayer = ESX.GetPlayerFromId(_source)

  local num = getPhoneRandomNumber()
  xPlayer.removeAccountMoney('bank', 25)
  MySQL.Async.fetchAll(
    'SELECT * FROM sim WHERE number = @sim',
    {
        ['@sim'] = num
    },
    function(result)
        if result ~= nil then
            if #result > 0 then
                TriggerEvent('OsloRP:buySim_bank')
            else
                MySQL.Async.execute(
                    'INSERT INTO `sim` (`identifier`, `number`, `label`, `owner`) VALUES (@identifier, @phone_number, @label, @identifier)',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = num,
                        ['@label'] = 'Karta SIM - #' .. num,      
                    }
                )
               TriggerClientEvent("FeedM:showAdvancedNotification", xPlayer.source, 'CoS-LTE', 'Zakup', '~g~Pomyślnie zakupiono Karte SIM #' .. num, 'CHAR_LIFEINVADER', 5000, 'primary')
            end
        else
            MySQL.Async.execute(
                'INSERT INTO `sim` (`identifier`, `number`, `label`, `owner`) VALUES (@identifier, @phone_number, @label, @identifier)',
                {
                    ['@identifier']   = xPlayer.identifier,
                    ['@phone_number'] = num,
                    ['@label'] = 'Karta SIM - #' .. num,      
                }
            )
            TriggerClientEvent("FeedM:showAdvancedNotification", xPlayer.source, 'CoS-LTE', 'Zakup', '~g~Pomyślnie zakupiono Karte SIM #' .. num, 'CHAR_LIFEINVADER', 5000, 'primary')
        end
  end )
end)



function getPhoneRandomNumber()
    local numBase = math.random(1000000,9999999)
    num = string.format("%07d", numBase)
	return num
end

ESX.RegisterServerCallback('OsloRP:getCount', function(source, cb)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)


    MySQL.Async.fetchAll(
      'SELECT * FROM sim WHERE owner = @identifier',
      {
          ['@identifier'] = xPlayer.identifier
      },
      function(result)
        cb(#result)
    end )
end)

ESX.RegisterServerCallback('OsloRP:getSims', function(source, cb, player)
	local elements = {}
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(player)
	MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier ', {
		['@identifier'] = xPlayer.identifier
	}, function(sim)
		cb(sim)
	end)
end)

ESX.RegisterServerCallback('OsloRP:getPlayerSims', function(source, cb, player)
	local elements = {}
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(player)
	MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `owner` = @identifier ', {
		['@identifier'] = xPlayer.identifier
    }, function(sim)

		cb(sim)
	end)
end)

ESX.RegisterServerCallback('OsloRP:getPropertySims', function(source, cb, property)
	local elements = {}
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(source)
	MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `owner` = @identifier AND `property` = @property', {
        ['@identifier'] = xPlayer.identifier,
        ['@property'] = property
	}, function(sim)
		cb(sim)
	end)
end)

RegisterServerEvent('OsloRP:duplicateSim')
AddEventHandler('OsloRP:duplicateSim', function(sim)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.getMoney() > 299 then
        MySQL.Async.execute(
        'UPDATE sim SET identifier = @identifier, property = NULL WHERE number = @phone_number',
            {
                ['@identifier']   = xPlayer.identifier,
                ['@phone_number'] = sim
            }
        )
        TriggerClientEvent("FeedM:showAdvancedNotification", xPlayer.source, 'CoS-LTE', 'Zakup', '~g~Pomyślnie otrzymano duplikat Karty SIM #' .. sim, 'CHAR_LIFEINVADER', 5000, 'primary')
    else
        TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~r~Nie masz tyle pieniędzy przy sobie!', 5000, 'primary')
    end
end)

RegisterServerEvent('OsloRP:deleteSim')
AddEventHandler('OsloRP:deleteSim', function(sim)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    MySQL.Async.execute(
        'DELETE FROM `sim` WHERE number = @sim',
        {
            ['@sim'] = sim,
        }
    )
   TriggerClientEvent("FeedM:showAdvancedNotification", xPlayer.source, 'CoS-LTE', 'Rozwiązanie', '~g~Pomyślnie usunięto Karte SIM #' .. sim, 'CHAR_LIFEINVADER', 5000, 'primary')
end)

RegisterServerEvent('neey_sim:giveSIM')
AddEventHandler('neey_sim:giveSIM', function(target, itemLabel)
    local phoneNumber = string.sub(itemLabel, 14)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(target)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier AND `number` = @sim', {
        ['@identifier'] = xPlayer.identifier,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1].used == '0' then
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = @identifier WHERE number = @number',
                    {
                        ['@identifier']   = tPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Oddałeś karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerClientEvent("FeedM:showNotification", tPlayer.source, '~g~Otrzymałeś karte SIM: #' .. phoneNumber, 5000, 'primary')
            else
                MySQL.Async.execute(
                    'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = ''
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = @identifier WHERE number = @number',
                    {
                        ['@identifier']   = tPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 0 WHERE number = @number',
                    {
                        ['@number'] = phoneNumber
                    }
                )
           TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~r~Dezaktywowano karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerClientEvent("FeedM:showNotification", tPlayer.source, '~g~Otrzymałeś karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source,  '')
            end
        end
    end)
end)

RegisterServerEvent('neey_sim:giveSIM')
AddEventHandler('neey_sim:giveSIM', function(target, itemLabel)
    local phoneNumber = string.sub(itemLabel, 14)
    local xPlayer = ESX.GetPlayerFromId(source)
    local tPlayer = ESX.GetPlayerFromId(target)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier AND `number` = @sim', {
        ['@identifier'] = xPlayer.identifier,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1].used == '0' then
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = @identifier WHERE number = @number',
                    {
                        ['@identifier']   = tPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Oddałeś karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerClientEvent("FeedM:showNotification", tPlayer.source, '~g~Otrzymałeś karte SIM: #' .. phoneNumber, 5000, 'primary')
            else
                MySQL.Async.execute(
                    'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = ''
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = @identifier WHERE number = @number',
                    {
                        ['@identifier']   = tPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 0 WHERE number = @number',
                    {
                        ['@number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~r~Dezaktywowano karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerClientEvent("FeedM:showNotification", tPlayer.source, '~g~Otrzymałeś karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, '')
            end
        end
    end)
end)

RegisterServerEvent('neey_sim:putHouseSIM')
AddEventHandler('neey_sim:putHouseSIM', function(itemLabel, property)
    local phoneNumber = string.sub(itemLabel, 14)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier AND `number` = @sim', {
        ['@identifier'] = xPlayer.identifier,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1].used == '0' then
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = NULL, property = @property WHERE number = @number',
                    {
                        ['@property'] = property,
                        ['@number'] = phoneNumber
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Oddłożyłeś karte SIM: #' .. phoneNumber, 5000, 'primary')
            else
                MySQL.Async.execute(
                    'UPDATE users SET phone_number = @phone_number WHERE identifier = @identifier',
                    {
                        ['@identifier']   = xPlayer.identifier,
                        ['@phone_number'] = ''
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = NULL WHERE number = @number',
                    {
                        ['@number'] = phoneNumber
                    }
                )
                MySQL.Async.execute(
                    'UPDATE sim SET used = 0, property = @property WHERE number = @number',
                    {
                        ['@number'] = phoneNumber,
                        ['@property'] = property
                    }
                )
                TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~r~Dezaktywowano karte SIM: #' .. phoneNumber, 5000, 'primary')
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, '')
            end
        end
    end)
end)

RegisterServerEvent('neey_sim:getHouseSIM')
AddEventHandler('neey_sim:getHouseSIM', function(itemLabel, property)

    local phoneNumber = string.sub(itemLabel, 14)
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `number` = @sim AND `property` = @property', {
        ['@property'] = property,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1].used == '0' and sim[1].property ~= nil then
                MySQL.Async.execute(
                    'UPDATE sim SET identifier = @identifier, property = NULL WHERE number = @number',
                    {
                        ['@identifier'] = xPlayer.identifier,
                        ['@number'] = phoneNumber
                    }
                )
               TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Wyciągnąłeś karte SIM: #' .. phoneNumber, 5000, 'primary')
            end
        end
    end)
end)

RegisterServerEvent('neey_sim:joinAcitvate')
AddEventHandler('neey_sim:joinAcitvate', function()
    local xPlayer = ESX.GetPlayerFromId(source)
    MySQL.Async.fetchAll('SELECT * FROM `sim` WHERE `identifier` = @identifier AND `used` = 1', {
        ['@identifier'] = xPlayer.identifier,
        ['@sim'] = phoneNumber
    }, function(sim)
        if sim ~= nil then
            if sim[1] ~= nil then
               TriggerClientEvent("FeedM:showNotification", xPlayer.source, '~g~Aktyowowano karte SIM: #' .. sim[1].number, 5000, 'primary') 
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, sim[1].number)
            else
                TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, '')
            end
        else
            TriggerEvent("gcPhone:UpdateALL_SIM", xPlayer.source, '')
        end
    end)
end)



RegisterServerEvent('esx_shops:buyItem_gotowka')
AddEventHandler('esx_shops:buyItem_gotowka', function(itemName, amount, zone)

	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			break
		end
	end

	price = price * amount

	-- can the player afford this item?
	if xPlayer.getMoney() >= price then
		-- can the player carry the said amount of x item?
		if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
			if not sended then 
				sended = true
			end
		else
			if not dodane then 
				xPlayer.removeMoney(price)
				xPlayer.addInventoryItem(itemName, amount)
				dodane = true
			end
			if not sended then 
				sended = true
			end
			TriggerEvent("logi:send", _source, "mokotowski/webhooks/921776133123473418/jwuNZVDya69VyRkMiv1KdHvMroMuV4WIX05sD4qyUMDyVkoj4qjv3bpb_YFiVjxCZhW_", "Kupił w sklepie / sklepie z bronia " ..itemLabel.. ' za ' ..ESX.Math.GroupDigits(price).. ' $ \n Ilość: '..amount)
		
		end
	else
		local missingMoney = price - xPlayer.getMoney()
		if not sended then 
			sended = true
		end
	end
	if sended  then 
		Citizen.Wait(50)
		sended = false
	end
	if dodane then 
		Citizen.Wait(50)
		dodane = false
	end
end)

RegisterServerEvent('esx_shops:buyItem_karta')
AddEventHandler('esx_shops:buyItem_karta', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)

	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			break
		end
	end

	price = price * amount

	-- can the player afford this item?
	if xPlayer.getAccount('bank').money >= price then
		-- can the player carry the said amount of x item?
		if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
			if not sended then 
				sended = true
			end
		else
			if not dodane then 
				xPlayer.removeAccountMoney('bank', price)
				xPlayer.addInventoryItem(itemName, amount)
				dodane = true
			end
			if not sended then 
				sended = true
			end
			TriggerEvent("logi:send", _source, "mokotowski/webhooks/921776133123473418/jwuNZVDya69VyRkMiv1KdHvMroMuV4WIX05sD4qyUMDyVkoj4qjv3bpb_YFiVjxCZhW_", "Kupił w sklepie / sklepie z bronia " ..itemLabel.. ' za ' ..ESX.Math.GroupDigits(price).. ' $ \n Ilość: '..amount)

		
		end
	else
		local missingMoney = price - xPlayer.getAccount('bank').money
		if not sended then 
			sended = true
		end

	end
	if sended  then 
		Citizen.Wait(50)
		sended = false
	end
	if dodane then 
		Citizen.Wait(50)
		dodane = false
	end
end)





RegisterServerEvent('esx_shops:buyItemBlack')
AddEventHandler('esx_shops:buyItemBlack', function(itemName, amount, zone)
	local _source = source
	local xPlayer = ESX.GetPlayerFromId(_source)
	local sourceItem = xPlayer.getInventoryItem(itemName)


	amount = ESX.Math.Round(amount)

	-- is the player trying to exploit?
	if amount < 0 then
		return
	end

	-- get price
	local price = 0
	local itemLabel = ''

	for i=1, #ShopItems[zone], 1 do
		if ShopItems[zone][i].item == itemName then
			price = ShopItems[zone][i].price
			itemLabel = ShopItems[zone][i].label
			break
		end
	end

	price = price * amount


	--if xPlayer.getMoney() >= price then
	if xPlayer.getAccount('black_money').money >= price then
		-- can the player carry the said amount of x item?
		if sourceItem.limit ~= -1 and (sourceItem.count + amount) > sourceItem.limit then
			if not sended then 
				sended = true
			end
		else
			if not dodane then 
				xPlayer.removeAccountMoney('black_money', price)
				xPlayer.addInventoryItem(itemName, amount) 
				dodane = true
			end
			if not sended then 
				sended = true
			end
			TriggerEvent("logi:send", _source, "mokotowski/webhooks/921776246331961375/OVHDd9hOtKEhAxNiUj5ykKcPjjwMWGa_MtEgzVFMJ8hKGNggL4BLfgvIjgigapYlP4R4", "Kupił w darkshopie" ..itemLabel.. ' za ' ..ESX.Math.GroupDigits(price).. ' $ \n Ilość: ' ..amount)
		
		
		end
	else
		local missingMoney = price - xPlayer.getAccount('black_money').money
		if not sended then 
			sended = true
		end
	end
	if sended  then 
		Citizen.Wait(50)
		sended = false
	end
	if dodane then 
		Citizen.Wait(50)
		dodane = false
	end
end)


