ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_clotheshop:saveOutfit')
AddEventHandler('esx_clotheshop:saveOutfit', function(label, skin)
	local xPlayer = ESX.GetPlayerFromId(source)

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		local dressing = store.get('dressing')

		if dressing == nil then
			dressing = {}
		end

		table.insert(dressing, {
			label = label,
			skin  = skin
		})

		store.set('dressing', dressing)
	end)
end)

ESX.RegisterServerCallback('esx_clotheshop:buyClothes', function(source, cb)
	local _source      = source
	local xPlayer = ESX.GetPlayerFromId(source)

	if xPlayer.getMoney() >= 200 then
		xPlayer.removeMoney(200)
	--	TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Zapłaciłeś/aś 175$', length = 2500, style = { ['background-color'] = '#2f5c73', ['color'] = '#FFFFFF' } })
		TriggerClientEvent("pNotify:SendNotification", _source, {text = '<b>Mokotowski - UBRANIA</b> <br>Zapłaciłeś/aś gotówką <b style="color: green;">$200</b>', layout = 'centerRight', type = 'success'})
		cb("Zakupiono")
		
	elseif xPlayer.getAccount('bank').money >= 200 then
		xPlayer.removeAccountMoney('bank', 200)
		TriggerClientEvent("pNotify:SendNotification", _source, {text = '<b>Mokotowski - UBRANIA</b> <br>Zapłaciłeś/aś kartą <b style="color: green;">$200</b>', layout = 'centerRight', type = 'success'})
		cb("Zakupiono")
		
	else
		--TriggerClientEvent('mythic_notify:client:SendAlert', _source, { type = 'inform', text = 'Nie posiadasz pieniędzy!', length = 2500, style = { ['background-color'] = '#2f5c73', ['color'] = '#FFFFFF' } })
		TriggerClientEvent("pNotify:SendNotification", _source, {text = '<b>Mokotowski - UBRANIA</b> <br>Odrzucona transakcja!', layout = 'centerRight', type = 'success'})
		cb("Odrzucona transakcja")
	end
end)

ESX.RegisterServerCallback('esx_clotheshop:checkPropertyDataStore', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
	local foundStore = false

	TriggerEvent('esx_datastore:getDataStore', 'property', xPlayer.identifier, function(store)
		foundStore = true
	end)

	cb(foundStore)
end)
