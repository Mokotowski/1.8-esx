ESX = nil
mandatAmount = nil
TriggerEvent('esx:getSharedObject', function(obj)
  ESX = obj
end)

RegisterNetEvent('tablet_ems:SendMessage')
AddEventHandler('tablet_ems:SendMessage', function(target, mandatAmount, mandatReason)
	local _source = source
	local sourceXPlayer = ESX.GetPlayerFromId(_source)
	local targetXPlayer = ESX.GetPlayerFromId(target)
	local identifier = targetXPlayer.getIdentifier()
	local policjant = GetCharacterName(_source)
	local policee = policjant.." (".. sourceXPlayer.getName() ..")"
	local name = GetCharacterName(target)
	local imie = GetImie(target)
	local nazwisko = GetNazwisko(target)
	local mandat = tonumber(mandatAmount)
	targetXPlayer.removeAccountMoney('bank', mandat)
	sourceXPlayer.addAccountMoney('bank', mandat / 4)
    TriggerClientEvent('chatMessage', -1, _U('mandat'), { 147, 196, 109 }, _U('mandat_msg', name, mandat, mandatReason))
end)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].firstname ~= nil and result[1].lastname ~= nil then
		return result[1].firstname .. ' ' .. result[1].lastname
	else
		return GetPlayerName(source)
	end
end
function GetImie(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].firstname ~= nil then
		return result[1].firstname
	else
		return GetPlayerName(source)
	end
end
function GetNazwisko(source)
	local result = MySQL.Sync.fetchAll('SELECT * FROM users WHERE identifier = @identifier',
	{
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] ~= nil and result[1].lastname ~= nil then
		return result[1].lastname
	else
		return GetPlayerName(source)
	end
end