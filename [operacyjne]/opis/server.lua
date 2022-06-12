-- --------------------------------------------
-- Commands
-- --------------------------------------------

RegisterCommand('opis', function(source, args)
	args = table.concat(args, ' ')
	TriggerClientEvent('3dme:shareDisplay', -1, args, source)
end)