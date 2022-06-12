ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
RegisterServerEvent('duty:police')
AddEventHandler('duty:police', function(job)

        local _source = source
        local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == 'police' and xPlayer.job.grade == 0 then
         xPlayer.setJob('offpolice', 0)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offpolice', 1)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offpolice', 2)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offpolice', 3)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offpolice', 4)
	 elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offpolice', 5)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offpolice', 6)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offpolice', 7)
	elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offpolice', 8)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offpolice', 9)
    elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 10 then
        xPlayer.setJob('offpolice', 10)
	elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 11 then
        xPlayer.setJob('offpolice', 11)
	elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 12 then
        xPlayer.setJob('offpolice', 12)
	elseif xPlayer.job.name == 'police' and xPlayer.job.grade == 13 then
        xPlayer.setJob('offpolice', 13)
    end
    if xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 0 then
        xPlayer.setJob('police', 0)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 1 then
        xPlayer.setJob('police', 1)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 2 then
        xPlayer.setJob('police', 2)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 3 then
        xPlayer.setJob('police', 3)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 4 then
        xPlayer.setJob('police', 4)
	elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 5 then
        xPlayer.setJob('police', 5)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 6 then
        xPlayer.setJob('police', 6)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 7 then
        xPlayer.setJob('police', 7)
	elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 8 then
        xPlayer.setJob('police', 8)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 9 then
        xPlayer.setJob('police', 9)
    elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 10 then
        xPlayer.setJob('police', 10)
	elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 11 then
        xPlayer.setJob('police', 11)
	elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 12 then
        xPlayer.setJob('police', 12)
	elseif xPlayer.job.name == 'offpolice' and xPlayer.job.grade == 13 then
        xPlayer.setJob('police', 13)
    end
end)


RegisterServerEvent('duty:ambulance')
AddEventHandler('duty:ambulance', function(job)

    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offambulance', 0)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offambulance', 1)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offambulance', 2)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offambulance', 3)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offambulance', 4)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offambulance', 5)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offambulance', 6)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offambulance', 7)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offambulance', 8)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offambulance', 9)
    elseif xPlayer.job.name == 'ambulance' and xPlayer.job.grade == 10 then
        xPlayer.setJob('offambulance', 10)
    end

    if xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 0 then
        xPlayer.setJob('ambulance', 0)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 1 then
        xPlayer.setJob('ambulance', 1)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 2 then
        xPlayer.setJob('ambulance', 2)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 3 then
        xPlayer.setJob('ambulance', 3)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 4 then
        xPlayer.setJob('ambulance', 4)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 5 then
        xPlayer.setJob('ambulance', 5)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 6 then
        xPlayer.setJob('ambulance', 6)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 7 then
        xPlayer.setJob('ambulance', 7)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 8 then
        xPlayer.setJob('ambulance', 8)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 9 then
        xPlayer.setJob('ambulance', 9)
    elseif xPlayer.job.name == 'offambulance' and xPlayer.job.grade == 10 then
        xPlayer.setJob('ambulance', 10)
    end
end)

 





RegisterServerEvent('duty:mecanooo')
AddEventHandler('duty:mecanooo', function(job)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(_source)
    if xPlayer.job.name == 'mecano' and xPlayer.job.grade == 0 then
        xPlayer.setJob('offmecano', 0)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 1 then
        xPlayer.setJob('offmecano', 1)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 2 then
        xPlayer.setJob('offmecano', 2)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 3 then
        xPlayer.setJob('offmecano', 3)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 4 then
        xPlayer.setJob('offmecano', 4)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 5 then
        xPlayer.setJob('offmecano', 5)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 6 then
        xPlayer.setJob('offmecano', 6)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 7 then
        xPlayer.setJob('offmecano', 7)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 8 then
        xPlayer.setJob('offmecano', 8)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 9 then
        xPlayer.setJob('offmecano', 9)
    elseif xPlayer.job.name == 'mecano' and xPlayer.job.grade == 10 then
        xPlayer.setJob('offmecano', 10)
    end

    if xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 0 then
        xPlayer.setJob('mecano', 0)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 1 then
        xPlayer.setJob('mecano', 1)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 2 then
        xPlayer.setJob('mecano', 2)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 3 then
        xPlayer.setJob('mecano', 3)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 4 then
        xPlayer.setJob('mecano', 4)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 5 then
        xPlayer.setJob('mecano', 5)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 6 then
        xPlayer.setJob('mecano', 6)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 7 then
        xPlayer.setJob('mecano', 7)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 8 then
        xPlayer.setJob('mecano', 8)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 9 then
        xPlayer.setJob('mecano', 9)
    elseif xPlayer.job.name == 'offmecano' and xPlayer.job.grade == 10 then
        xPlayer.setJob('mecano', 10)
    end
end)










