ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	ESX.PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	ESX.PlayerData.job = job
end)

RegisterNetEvent('esx:addInventoryItem')
AddEventHandler('esx:addInventoryItem', function(item, count)
	if ESX.PlayerData and ESX.PlayerData.inventory then
		Citizen.CreateThread(function()
			Citizen.Wait(100)
			ESX.PlayerData = ESX.GetPlayerData()

			local found = false
			for i = 1, #ESX.PlayerData.inventory, 1 do
				if ESX.PlayerData.inventory[i].name == item.name then
					ESX.PlayerData.inventory[i] = item
					found = true
					break
				end
			end
		end)
	end
end)

RegisterNetEvent('esx:removeInventoryItem')
AddEventHandler('esx:removeInventoryItem', function(item, count)
	if ESX.PlayerData and ESX.PlayerData.inventory then
		Citizen.CreateThread(function()
			Citizen.Wait(100)
			ESX.PlayerData = ESX.GetPlayerData()

			local found = false
			for i = 1, #ESX.PlayerData.inventory, 1 do
				if ESX.PlayerData.inventory[i].name == item.name then
					ESX.PlayerData.inventory[i] = item
					found = true
					break
				end
			end
		end)
	end
end)

local Status = {}
local loaded = false
local isPaused = false

local display = true
local displayRadio = false
local displayGPS = false

local radio = {
	status = nil,
	channel = nil,
	mode = 0
}

function GetStatusData()
	local statuses = {}
	for _, status in ipairs(Status) do
		table.insert(statuses, {
			name	= status.name,
			val		= status.val,
			percent	= (status.val / Config.StatusMax) * 100
		})
	end

	return statuses
end

RegisterNetEvent('esx_status:load')
AddEventHandler('esx_status:load', function(statuses)
	for _, status in ipairs(Status) do
		for _, _status in ipairs(statuses) do
			if status.name == _status.name then
				status.set(_status.val)
			end
		end
	end

	loaded = true
end)

RegisterNetEvent('esx_status:set')
AddEventHandler('esx_status:set', function(name, val)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.set(val)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData())
end)

RegisterNetEvent('esx_status:add')
AddEventHandler('esx_status:add', function(name, val)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.add(val)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData())
end)

RegisterNetEvent('esx_status:remove')
AddEventHandler('esx_status:remove', function(name, val)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.remove(val)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData())
end)

RegisterNetEvent('esx_status:updateColor')
AddEventHandler('esx_status:updateColor', function(name, color)
	for _, status in ipairs(Status) do
		if status.name == name then
			status.updateColor(color)
			break
		end
	end

	TriggerServerEvent('esx_status:update', GetStatusData())
end)

AddEventHandler('esx_status:registerStatus', function(name, default, color, visible, tickCallback)
	local s = CreateStatus(name, default, color, visible, tickCallback)
	table.insert(Status, s)
end)

AddEventHandler('esx_status:getStatus', function(name, cb)
	for i=1, #Status, 1 do
		if Status[i].name == name then
			cb(Status[i])
			return
		end
	end
end)

AddEventHandler('esx_status:setDisplay', function(val)
	display = tonumber(val) ~= 0
end)

Citizen.CreateThread(function()
	TriggerEvent('esx_status:loaded')

    RequestStreamedTextureDict('mpleaderboard')
    while not HasStreamedTextureDictLoaded('mpleaderboard') do
        Citizen.Wait(0)
    end

	local updateTimer, tickTimer, updateGlobal
	while true do
		Citizen.Wait(1000)
		if IsPauseMenuActive() then
			if not isPaused then
				isPaused = true
				TriggerEvent('hud:display', false)
				TriggerEvent('esx_status:setDisplay', 0.0)
			end
		elseif isPaused then
			isPaused = false
			TriggerEvent('hud:display', true)
			TriggerEvent('esx_status:setDisplay', 0.5)
		end

		if display then
			local baseX = 0.015

			local statuses = {}
			for _, status in ipairs(Status) do
				if status.visible or status.val > 0 then
					table.insert(statuses, {
						color	= status.color,
						percent	= (status.val / Config.StatusMax)
					})
				end
			end

			local count = #statuses
			for i, status in ipairs(statuses) do
				local offset = 0.0015
				if i == count then
					offset = 0.0
				end

				local width = 0.0698 / count - offset
				baseX = baseX + width + offset
			end
		end

		if loaded then
			local timer = GetGameTimer()
			if not tickTimer or tickTimer < timer then
				for _, status in ipairs(Status) do
					status.onTick()
				end

				tickTimer = timer + Config.TickTime
			end

			if not updateTimer or updateTimer < timer then
				TriggerServerEvent('esx_status:update', GetStatusData())
				updateTimer = timer + Config.UpdateInterval
			end

			if not updateGlobal or updateGlobal < timer then
				TriggerServerEvent('esx_status:updateDB')
				updateGlobal = timer + Config.UpdateGlobal
			end
		end
	end
end)