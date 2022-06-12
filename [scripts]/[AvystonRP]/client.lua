Config = {
	World = {
	    ["TITLE"] = "[PL] ~y~AvystonRP~w~",
	    ["SUBTITLE"] = "~w~https://AvystonRP.pl~w~",
	    ["APPID"] = "",
	    ["ASSET"] = ""
	},
	Characterchange = {
		x = -1044.68,
		y = -2749.59,
		z = 21.36
	}
}

local Ped = {
	Active = false,
	Id = 0,
	Alive = false,
	Available = false,
	Visible = false,
	InVehicle = false,
	OnFoot = false,
	Vehicle = nil,
	VehicleClass = nil,
	VehicleStopped = true,
	VehicleEngine = false,
	VehicleCurrentGear = nil,
	VehicleHighGear = nil,
	Ped = nil,
	Coords = nil,
	Zone = nil,
	Direction = nil,
	StreetLabel = {},
	CurrentTimeHours = nil,
	CurrentTimeMinutes = nil,
	ShowGears = false,
	currentFuel = nil,
	Health = 0,
	Armor = 0,
	Stamina = 0,
	Underwater = false,
	UnderwaterTime = 0,
	Driver = false,
	PhoneVisible = false,
}
local PlayerData = {}
local GUI = {}
local alreadyRegisted = false
local Status = true
local timehours = nil
local timeminutes = nil
local maxgear = nil
local checkCruiseLock = 0
local enabled = false
local incharacterselection = false

ESX = nil
GUI.Time = 0

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(0)
		if incharacterselection then
			DisableAllControlActions(0)
			EnableControlAction(0, 18, true)
			EnableControlAction(0, 27, true)
			EnableControlAction(0, 172, true)
			EnableControlAction(0, 173, true)
			EnableControlAction(0, 174, true)
			EnableControlAction(0, 175, true)
			EnableControlAction(0, 187, true)
			EnableControlAction(0, 188, true)
			EnableControlAction(0, 189, true)
			EnableControlAction(0, 190, true)
			EnableControlAction(0, 299, true)
			EnableControlAction(0, 300, true)
			EnableControlAction(0, 307, true)
			EnableControlAction(0, 308, true)
		else
			Citizen.Wait(500)
		end
	end
end)

function Characterchangemenu()
	ESX.ShowNotification('~r~Trwa Ladowanie Postaci!')
	FreezeEntityPosition(Ped.Id, true)
	SetPlayerInvincible(PlayerId(), true)
   	SetEntityInvincible(PlayerPedId(), true)
	ESX.UI.Menu.CloseAll()
	ESX.TriggerServerCallback('sandycharacter:fetchcharacters', function(characters)
		local elements = {}
		if characters[1] ~= nil and characters[1].identifier ~= PlayerData.identifier then
			table.insert(elements, {label = characters[1].firstname..' '..characters[1].lastname, value = '1'})
		end
		if characters[2] ~= nil and characters[2].identifier ~= PlayerData.identifier then
			table.insert(elements, {label = characters[2].firstname..' '..characters[2].lastname, value = '2'})
		end
		if characters[3] ~= nil and characters[3].identifier ~= PlayerData.identifier then
			table.insert(elements, {label = characters[3].firstname..' '..characters[3].lastname, value = '3'})
		end
		if characters[4] ~= nil and characters[4].identifier ~= PlayerData.identifier then
			table.insert(elements, {label = characters[4].firstname..' '..characters[4].lastname, value = '4'})
		end

	    ESX.UI.Menu.Open(
	    'default', GetCurrentResourceName(), 'changecharacter_actions',
	    {
	      title    = 'Samolot',
	      align    = 'center',
	      elements = elements
	    },
	    function(data, menu)
	    	TriggerServerEvent('sandycharacter:selectcharacter', data.current.value)
	    	FreezeEntityPosition(Ped.Id, false)
	    	SetPlayerInvincible(PlayerId(), false)
    		SetEntityInvincible(PlayerPedId(), false)
	    	menu.close()
	    	incharacterselection = false
	    end,
	    function(data, menu)
	    end) 
	end)
end

RegisterNetEvent('sandycharacter:spawncharacter')
AddEventHandler('sandycharacter:spawncharacter', function()
	DoScreenFadeOut(50)
	Citizen.Wait(1000)
	TriggerServerEvent('es:firstJoinProper')
	Citizen.Wait(1000)
	TriggerEvent('es:allowedToSpawn')
    SetTimecycleModifier('default')
    TriggerEvent('esx_customui:toggle',true)
    Wait(1000)
    TriggerEvent('esx_jail:shouldbeinjail')
    reloadskin()
    Wait(3000)
    DoScreenFadeIn(50)
end)
