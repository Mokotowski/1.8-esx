ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


-- send to jail and register in database
RegisterServerEvent('esx_grzibi:naura123')
AddEventHandler('esx_grzibi:naura123', function(target, jailTime)
	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		else
			MySQL.Async.execute("INSERT INTO jail (identifier,jail_time) VALUES (@identifier,@jail_time)", {['@identifier'] = identifier, ['@jail_time'] = jailTime})
		end
	end)
	
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do

  			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
  			--TriggerClientEvent('xjail:notify', xPlayer.source, ESX.Round(jailTime / 60), target)

		end

	TriggerClientEvent('esx_policejob:unrestrain', target)
	TriggerClientEvent('esx_jailer:jailhype', target, jailTime)
end)
RegisterCommand('unjail', function(source, args, user)
	local xPlayer = ESX.GetPlayerFromId(source)
		if args[1] then
			if GetPlayerName(args[1]) ~= nil then
				TriggerEvent('esx_jailer:unjailQuesthype', tonumber(args[1]))
			else
				TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', 'Invalid player ID!' } } )
			end
		else
			TriggerEvent('esx_jailer:unjailQuesthype', source)
		end
end, false)

-- should the player be in jail?
RegisterServerEvent('esx_jailer:checkJailhype')
AddEventHandler('esx_jailer:checkJailhype', function()
	local player = source -- cannot parse source to client trigger for some weird reason
	local identifier = GetPlayerIdentifiers(player)[1] -- get steam identifier
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do

  				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
  				TriggerClientEvent('xjail:notify', xPlayer.source, ESX.Round(result[1].jail_time / 60), target)

			end
			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(player), ESX.Round(result[1].jail_time / 60)) }, color = { 147, 196, 109 } })
			TriggerClientEvent('esx_jailer:jailhype', player, tonumber(result[1].jail_time))
		end
	end)
end)

-- unjail via command
RegisterServerEvent('esx_jailer:unjailQuesthype')
AddEventHandler('esx_jailer:unjailQuesthype', function(source)
	if source ~= nil then
		unjail(source)
	end
end)

-- unjail after time served
RegisterServerEvent('esx_jailer:unjailTimehype')
AddEventHandler('esx_jailer:unjailTimehype', function()
	unjail(source)
end)

-- keep jailtime updated
RegisterServerEvent('esx_jailer:updateRemaininghype')
AddEventHandler('esx_jailer:updateRemaininghype', function(jailTime)
	local identifier = GetPlayerIdentifiers(source)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		end
	end)
end)

function unjail(target)
	local identifier = GetPlayerIdentifiers(target)[1]
	TriggerClientEvent('blip:usuwanietegogowna', target)
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute('DELETE from jail WHERE identifier = @id', {['@id'] = identifier})
			local xPlayers = ESX.GetPlayers()

			for i=1, #xPlayers, 1 do

  				local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
  				TriggerClientEvent('xunjail:notify', xPlayer.source, target)

			end
			--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('unjailed', GetPlayerName(target)) }, color = { 147, 196, 109 } })
		end
	end)

	TriggerClientEvent('esx_jailer:unjailhype', target)
end

RegisterServerEvent('esx_jailer:sendToJailPanelhype')
AddEventHandler('esx_jailer:sendToJailPanelhype', function(target, jailTime, powod)
	local identifier = GetPlayerIdentifiers(target)[1]
	MySQL.Async.fetchAll('SELECT * FROM jail WHERE identifier=@id', {['@id'] = identifier}, function(result)
		if result[1] ~= nil then
			MySQL.Async.execute("UPDATE jail SET jail_time=@jt WHERE identifier=@id", {['@id'] = identifier, ['@jt'] = jailTime})
		else
			MySQL.Async.execute("INSERT INTO jail (identifier,jail_time) VALUES (@identifier,@jail_time)", {['@identifier'] = identifier, ['@jail_time'] = jailTime})
		end
	end)
	
		local xPlayers = ESX.GetPlayers()

		for i=1, #xPlayers, 1 do

  			local xPlayer = ESX.GetPlayerFromId(xPlayers[i])
  			TriggerClientEvent('xjail:notify', xPlayer.source, ESX.Round(jailTime / 60), target, powod)

		end

	--TriggerClientEvent('chat:addMessage', -1, { args = { _U('judge'), _U('jailed_msg', GetPlayerName(target), ESX.Round(jailTime / 60)) }, color = { 147, 196, 109 } })
	TriggerClientEvent('esx_policejob:unrestrain', target)
	TriggerClientEvent('esx_jailer:jailhype', target, jailTime)
end)




