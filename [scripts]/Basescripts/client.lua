Citizen.CreateThread(function()
    SetMapZoomDataLevel(0, 0.96, 0.9, 0.08, 0.0, 0.0) -- Level 0
    SetMapZoomDataLevel(1, 1.6, 0.9, 0.08, 0.0, 0.0) -- Level 1
    SetMapZoomDataLevel(2, 8.6, 0.9, 0.08, 0.0, 0.0) -- Level 2
    SetMapZoomDataLevel(3, 12.3, 0.9, 0.08, 0.0, 0.0) -- Level 3
    SetMapZoomDataLevel(4, 22.3, 0.9, 0.08, 0.0, 0.0) -- Level 4
end)
Config = {
	Density = {
		FiveSync = {
			CitizenDefault = 0.5,
			CitizenDriver = 0.5,
			CitizenPassengers = 0.5,
			VehicleDefault = 0.6,
			VehicleDriver = 0.2,
			VehiclePassengers = 0.2
		},

		OneSync = {
			CitizenDefault = 0.5,
			CitizenDriver = 0.5,
			CitizenPassengers = 0.5,
			VehicleDefault = 0.6,
			VehicleDriver = 0.3,
			VehiclePassengers = 0.3
		}
	},
	Scenarios = {
	  'WORLD_VEHICLE_ATTRACTOR',
	  'WORLD_VEHICLE_AMBULANCE',
	  'WORLD_VEHICLE_BOAT_IDLE',
	  'WORLD_VEHICLE_BOAT_IDLE_ALAMO',
	  'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
	  'WORLD_VEHICLE_BOAT_IDLE_MARQUIS',
	  'WORLD_VEHICLE_BROKEN_DOWN',
	  'WORLD_VEHICLE_BUSINESSMEN',
	  'WORLD_VEHICLE_HELI_LIFEGUARD',
	  'WORLD_VEHICLE_CLUCKIN_BELL_TRAILER',
	  'WORLD_VEHICLE_CONSTRUCTION_SOLO',
	  'WORLD_VEHICLE_CONSTRUCTION_PASSENGERS',
	  'WORLD_VEHICLE_DRIVE_PASSENGERS',
	  'WORLD_VEHICLE_DRIVE_PASSENGERS_LIMITED',
	  'WORLD_VEHICLE_DRIVE_SOLO',
	  'WORLD_VEHICLE_FARM_WORKER',
	  'WORLD_VEHICLE_FIRE_TRUCK',
	  'WORLD_VEHICLE_EMPTY',
	  'WORLD_VEHICLE_MARIACHI',
	  'WORLD_VEHICLE_MECHANIC',
	  'WORLD_VEHICLE_MILITARY_PLANES_BIG',
	  'WORLD_VEHICLE_MILITARY_PLANES_SMALL',
	  'WORLD_VEHICLE_PARK_PARALLEL',
	  'WORLD_VEHICLE_PARK_PERPENDICULAR_NOSE_IN',
	  'WORLD_VEHICLE_PASSENGER_EXIT',
	  'WORLD_VEHICLE_POLICE_BIKE',
	  'WORLD_VEHICLE_POLICE_CAR',
	  'WORLD_VEHICLE_POLICE',
	  'WORLD_VEHICLE_POLICE_NEXT_TO_CAR',
	  'WORLD_VEHICLE_QUARRY',
	  'WORLD_VEHICLE_SALTON',
	  'WORLD_VEHICLE_SALTON_DIRT_BIKE',
	  'WORLD_VEHICLE_TOURBUS',
	  'WORLD_VEHICLE_TOURIST',
	  'WORLD_VEHICLE_TANDL',
	  'WORLD_VEHICLE_TRACTOR',
	  'WORLD_VEHICLE_TRACTOR_BEACH',
	  'WORLD_VEHICLE_TRUCK_LOGS',
	  'WORLD_VEHICLE_TRUCKS_TRAILERS',
	  'WORLD_VEHICLE_STREETRACE',
	  'WORLD_VEHICLE_DISTANT_EMPTY_GROUND'
	},
	Zones = {
		['AIRP'] = 'Los Santos International Airport',
		['ALAMO'] = 'Alamo Sea',
		['ALTA'] = 'Alta',
		['ARMYB'] = 'Fort Zancudo',
		['BANHAMC'] = 'Banham Canyon Dr',
		['BANNING'] = 'Banning',
		['BEACH'] = 'Vespucci Beach',
		['BHAMCA'] = 'Banham Canyon',
		['BRADP'] = 'Braddock Pass',
		['BRADT'] = 'Braddock Tunnel',
		['BURTON'] = 'Burton',
		['CALAFB'] = 'Calafia Bridge',
		['CANNY'] = 'Raton Canyon',
		['CCREAK'] = 'Cassidy Creek',
		['CHAMH'] = 'Chamberlain Hills',
		['CHIL'] = 'Vinewood Hills',
		['CHU'] = 'Chumash',
		['CMSW'] = 'Chiliad Mountain State Wilderness',
		['CYPRE'] = 'Cypress Flats',
		['DAVIS'] = 'Davis',
		['DELBE'] = 'Del Perro Beach',
		['DELPE'] = 'Del Perro',
		['DELSOL'] = 'La Puerta',
		['DESRT'] = 'Grand Senora Desert',
		['DOWNT'] = 'Downtown',
		['DTVINE'] = 'Downtown Vinewood',
		['EAST_V'] = 'East Vinewood',
		['EBURO'] = 'El Burro Heights',
		['ELGORL'] = 'El Gordo Lighthouse',
		['ELYSIAN'] = 'Elysian Island',
		['GALFISH'] = 'Galilee',
		['GOLF'] = 'GWC and Golfing Society',
		['GRAPES'] = 'Grapeseed',
		['GREATC'] = 'Great Chaparral',
		['HARMO'] = 'Harmony',
		['HAWICK'] = 'Hawick',
		['HORS'] = 'Vinewood Racetrack',
		['HUMLAB'] = 'Humane Labs and Research',
		['JAIL'] = 'Bolingbroke Penitentiary',
		['KOREAT'] = 'Little Seoul',
		['LACT'] = 'Land Act Reservoir',
		['LAGO'] = 'Lago Zancudo',
		['LDAM'] = 'Land Act Dam',
		['LEGSQU'] = 'Legion Square',
		['LMESA'] = 'La Mesa',
		['LOSPUER'] = 'La Puerta',
		['MIRR'] = 'Mirror Park',
		['MORN'] = 'Morningwood',
		['MOVIE'] = 'Richards Majestic',
		['MTCHIL'] = 'Mount Chiliad',
		['MTGORDO'] = 'Mount Gordo',
		['MTJOSE'] = 'Mount Josiah',
		['MURRI'] = 'Murrieta Heights',
		['NCHU'] = 'North Chumash',
		['NOOSE'] = 'N.O.O.S.E',
		['OCEANA'] = 'Pacific Ocean',
		['PALCOV'] = 'Paleto Cove',
		['PALETO'] = 'Paleto Bay',
		['PALFOR'] = 'Paleto Forest',
		['PALHIGH'] = 'Palomino Highlands',
		['PALMPOW'] = 'Palmer-Taylor Power Station',
		['PBLUFF'] = 'Pacific Bluffs',
		['PBOX'] = 'Pillbox Hill',
		['PROCOB'] = 'Procopio Beach',
		['RANCHO'] = 'Rancho',
		['RGLEN'] = 'Richman Glen',
		['RICHM'] = 'Richman',
		['ROCKF'] = 'Rockford Hills',
		['RTRAK'] = 'Redwood Lights Track',
		['SANAND'] = 'San Andreas',
		['SANCHIA'] = 'San Chianski Mountain Range',
		['SANDY'] = 'Sandy Shores',
		['SKID'] = 'Mission Row',
		['SLAB'] = 'Stab City',
		['STAD'] = 'Maze Bank Arena',
		['STRAW'] = 'Strawberry',
		['TATAMO'] = 'Tataviam Mountains',
		['TERMINA'] = 'Terminal',
		['TEXTI'] = 'Textile City',
		['TONGVAH'] = 'Tongva Hills',
		['TONGVAV'] = 'Tongva Valley',
		['VCANA'] = 'Vespucci Canals',
		['VESP'] = 'Vespucci',
		['VINE'] = 'Vinewood',
		['WINDF'] = 'Ron Alternates Wind Farm',
		['WVINE'] = 'West Vinewood',
		['ZANCUDO'] = 'Zancudo River',
		['ZP_ORT'] = 'Port of South Los Santos',
		['ZQ_UAR'] = 'Davis Quartz'
	},
	Directions = {
		[0] = 'N',
		[45] = 'NW',
		[90] = 'W',
		[135] = 'SW',
		[180] = 'S',
		[225] = 'SE',
		[270] = 'E',
		[315] = 'NE',
		[360] = 'N'
	},
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
local candodriveby = false
local allowid = false
local RPM = 0
local RPMTime = GetGameTimer()
local Status = true
local timehours = nil
local timeminutes = nil
local maxgear = nil
local displayStreet = true
local DisableShuffle = true
local minSpeed = 20
local lockSpeed = false
local checkCruiseLock = 0
local enabled = false
local incharacterselection = false

ESX = nil

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

AddEventHandler('playerSpawned', function()
	Citizen.Wait(50000)

	SetCanAttackFriendly(PlayerPedId(), true, false)
	NetworkSetFriendlyFireOption(true)
	if not alreadyRegisted then
		TriggerServerEvent('bb-queue:removeConnected')
		alreadyRegisted = true
	end
    ESX.TriggerServerCallback('esx_ambulancejob:getDeathStatus', function(isDead)
        if isDead then
            SetEntityHealth(GetPlayerPed(), 0)
        end
	end)
end)
Citizen.CreateThread(function()
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_LOST"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_HILLBILLY"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_BALLAS"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MEXICAN"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_FAMILY"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_MARABUNTE"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_SALVA"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AMBIENT_GANG_WEICHENG"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_1"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_2"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_9"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("GANG_10"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("FIREMAN"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("MEDIC"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("COP"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("ARMY"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("DEALER"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("CIVMALE"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("HEN"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("PRIVATE_SECURITY"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("SECURITY_GUARD"), GetHashKey('PLAYER'))
	SetRelationshipBetweenGroups(1, GetHashKey("AGGRESSIVE_INVESTIGATE"), GetHashKey('PLAYER'))
end)
function HashInTable( hash )
	local scopedWeapons =
	{
		100416529,  -- WEAPON_SNIPERRIFLE
		205991906,  -- WEAPON_HEAVYSNIPER
		3342088282, -- WEAPON_MARKSMANRIFLE
		177293209,   -- WEAPON_HEAVYSNIPER MKII
		1785463520  -- WEAPON_MARKSMANRIFLE_MK2
	}
    for k, v in pairs(scopedWeapons) do
        if (hash == v) then
            return true
        end
    end
    return false
end
Citizen.CreateThread(function()
 	while true do
	    Citizen.Wait(200)
		
	    RemoveAllPickupsOfType(0x20796a82) -- Pistol Ammo
	   	RemoveAllPickupsOfType(0x43AAEAE6) -- Pistol Ammo
	    RemoveAllPickupsOfType(0xe4bd2fc6) -- Rifle Ammo
	    RemoveAllPickupsOfType(0xE5EB8146) -- Rifle Ammo
	    RemoveAllPickupsOfType(0x77f3f2dd) -- Shotgun Ammo
	    RemoveAllPickupsOfType(0x2D5CE030) -- Shotgun Ammo
	    RemoveAllPickupsOfType(0x116fc4e6) -- SMG Ammo
	    RemoveAllPickupsOfType(0xFD4AE5E5) -- SMG Ammo
	end
end)
Citizen.CreateThread(function()
	StatSetProfileSetting(226, 0)
	for i = 1, 15 do
	    EnableDispatchService(i, false)
	end
	for i, v in ipairs(Config.Scenarios) do
	  	SetScenarioTypeEnabled(v, false)
	end
	SetPedInfiniteAmmoClip(PlayerPedId(), false)
	SetEntityProofs(GetPlayerPed(), false, true, true, false, false, false, false, false)
	SwitchTrainTrack(0, true)
	SwitchTrainTrack(3, true)
	SetTrainTrackSpawnFrequency(0, 120000)
	SetRandomTrains(1)
    while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(100)
	end
	while true do
		Citizen.Wait(1000)
		for _, ped in ipairs(ESX.Game.GetPeds()) do
			SetPedDropsWeaponsWhenDead(ped, false)
		end
	end
end)
function HideHUDThisFrame()
	HideHudComponentThisFrame(1)
	HideHudComponentThisFrame(2)
	HideHudComponentThisFrame(3)
	HideHudComponentThisFrame(4)
	HideHudComponentThisFrame(6)
	HideHudComponentThisFrame(7)
	HideHudComponentThisFrame(8)
	HideHudComponentThisFrame(9)
	HideHudComponentThisFrame(14)
	HideHudComponentThisFrame(13)
	HideHudComponentThisFrame(11)
	HideHudComponentThisFrame(12)
	HideHudComponentThisFrame(15)
	HideHudComponentThisFrame(17)
	HideHudComponentThisFrame(20)
	HideHudComponentThisFrame(18)
	HideHudComponentThisFrame(21)
	HideHudComponentThisFrame(22)
end
Citizen.CreateThread(function()
	StatSetProfileSetting(226, 0)
	--[[for key, value in pairs(Config.Visuals) do
		SetVisualSettingFloat(key, value)
	end]]

	for i = 1, 15 do
	    EnableDispatchService(i, false)
	end

	for i, v in ipairs(Config.Scenarios) do
	  	SetScenarioTypeEnabled(v, false)
	end

	SetPedInfiniteAmmoClip(PlayerPedId(), false)
	SetEntityProofs(GetPlayerPed(), false, true, true, false, false, false, false, false)

	SwitchTrainTrack(0, true)
	SwitchTrainTrack(3, true)
	SetTrainTrackSpawnFrequency(0, 120000)
	SetRandomTrains(1)
    while not NetworkIsPlayerActive(PlayerId()) do
		Citizen.Wait(100)
	end
	while true do
		Citizen.Wait(1000)
		for _, ped in ipairs(ESX.Game.GetPeds()) do
			SetPedDropsWeaponsWhenDead(ped, false)
		end
	end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(300)
		Ped.Id = PlayerPedId()
		Ped.RealId = PlayerId()
		Ped.Active = true
		Ped.Ped = GetPlayerPed()
		if not IsEntityDead(Ped.Id) then
			Ped.Alive = true
			Ped.Available = (Ped.Alive)
			Ped.Visible = IsEntityVisible(Ped.Id)
			Ped.OnFoot = IsPedOnFoot(Ped.Id)
			Ped.Coords = GetEntityCoords(Ped.Ped)
			Ped.PhoneVisible = false
		else
			Ped.Alive = false
			Ped.Available = false
			Ped.Visible = IsEntityVisible(Ped.Id)
			Ped.OnFoot = true
			Ped.Collection = false
			Ped.PhoneVisible = false
		end
		if IsPedInAnyVehicle(Ped.Id, false) then
			Ped.InVehicle = true
			Ped.Vehicle = GetVehiclePedIsIn(Ped.Id, false)
			Ped.VehicleClass = GetVehicleClass(Ped.Vehicle)
			Ped.VehicleStopped = IsVehicleStopped(Ped.Vehicle)
			Ped.VehicleEngine = GetIsVehicleEngineRunning(Ped.Vehicle)
			Ped.VehicleCurrentGear = GetVehicleCurrentGear(Ped.Vehicle)
			Ped.VehicleHighGear = GetVehicleHighGear(Ped.Vehicle)
			Ped.Driver = GetPedInVehicleSeat(GetVehiclePedIsIn(Ped.Id, false), -1) == Ped.Id
			Ped.Zone = GetNameOfZone(Ped.Coords.x, Ped.Coords.y, Ped.Coords.z)
			for k, v in pairs(Config.Directions) do
				Ped.Direction = GetEntityHeading(Ped.Id)
				if math.abs(Ped.Direction - k) < 22.5 then
					Ped.Direction = v
					break
				end
			end
			Ped.StreetLabel.zone = (Config.Zones[Ped.Zone:upper()] or Ped.Zone:upper())
			Ped.StreetLabel.street = GetStreetsCustom(Ped.Coords)
			Ped.StreetLabel.direction = (Ped.Direction or 'N')
			Ped.CurrentTimeHours = GetClockHours()
			if Ped.CurrentTimeHours <= 9 then
				Ped.CurrentTimeHours = '0'..Ped.CurrentTimeHours
			end
			Ped.CurrentTimeMinutes = GetClockMinutes()
			if Ped.CurrentTimeMinutes <= 9 then
				Ped.CurrentTimeMinutes = '0'..Ped.CurrentTimeMinutes
			end
			Ped.ShowGears = true
			if Ped.VehicleClass == 13 or Ped.VehicleClass == 14 or Ped.VehicleClass == 15 or Ped.VehicleClass == 16 then
				Ped.ShowGears = false
			end
			Ped.currentFuel = math.ceil(65 * GetVehicleFuelLevel(Ped.Vehicle) / GetVehicleHandlingFloat(Ped.Vehicle,"CHandlingData","fPetrolTankVolume"))
		else
			Ped.Health = GetEntityHealth(Ped.Id)
			Ped.Armor = GetPedArmour(Ped.Id)
			Ped.Underwater = IsPedSwimmingUnderWater(Ped.Id)
			Ped.Stamina = GetPlayerSprintStaminaRemaining(Ped.RealId)

			Ped.UnderwaterTime = GetPlayerUnderwaterTimeRemaining(Ped.RealId)
			if Ped.UnderwaterTime < 0.0 then
				Ped.UnderwaterTime = 0.0
			end
			Ped.InVehicle = false
			Ped.Vehicle = nil
		end
	end
end)
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
    Wait(3000)
    DoScreenFadeIn(50)
end)
RegisterCommand('shuff', function(source, args, raw)
	Citizen.CreateThread(SeatShuffle)
end, false)

function GetStreetsCustom(coords)
	local s1, s2 = Citizen.InvokeNative(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
	local street1, street2 = GetStreetNameFromHashKey(s1), GetStreetNameFromHashKey(s2)
	return "~w~" .. street1 .. (street2 ~= "" and " ".."~s~ | ".." " .. street2 or "")
end
function DisableSeatShuffle(sstatus)
	DisableShuffle = sstatus
end
function SeatShuffle()
	local ped = PlayerPedId()
	if IsPedInAnyVehicle(ped, false) then
		local vehicle = GetVehiclePedIsIn(ped, false)
		if GetPedInVehicleSeat(vehicle, 0) == ped then
			DisableSeatShuffle(false)
			Citizen.Wait(5000)
			DisableSeatShuffle(true)
		else
			TaskShuffleToNextVehicleSeat(ped, vehicle)
		end
	end
end
function reloadskin()
    Wait(5000)
    ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
        TriggerEvent('skinchanger:loadSkin', skin)
    end)
    TriggerEvent('esx_tattooshop:requestPlayerTattoos')
end
RegisterCommand("refreshskin", function()
    reloadskin()
end)
Citizen.CreateThread(function()
	while true do

		Citizen.Wait(60000)

        local name = GetPlayerName(PlayerId())
		local id = GetPlayerServerId(PlayerId())
		local PlayerData = ESX.GetPlayerData()
		local ped = PlayerPedId()
		local currentWeaponHash = GetSelectedPedWeapon(ped)
		local health 		= GetEntityHealth(playerPed)

        SetDiscordAppId(868921044256325662)
		SetDiscordRichPresenceAsset('AvystonRP')
		SetDiscordRichPresenceAssetSmall('info')
	    SetDiscordRichPresenceAssetSmallText(name .. ' | ID: ' .. id .. ' | ' .. #GetActivePlayers() .. '/128')
		SetDiscordRichPresenceAssetText(' AvystonRP')

		SetDiscordRichPresenceAction(0, 'Dołącz na Discorda, rozpocznij nową przygode', 'https://discord.gg/')
		SetDiscordRichPresenceAction(1, 'Aktywna i pomocna administracja', 'https://discord.gg/')


		if	PlayerData.job.name == 'police' then
			SetRichPresence('🚓 Szuka przestępców')
		elseif PlayerData.job.name == 'ambulance' then
			SetRichPresence('🚑 Ratuje ludzi')
		elseif PlayerData.job.name == 'mecano' then
			SetRichPresence('🔧 Naprawia pojazdy')
		elseif IsPedInAnyVehicle(ped, true) then
			SetRichPresence('🛴 Wozi się')
		elseif currentWeaponHash == GetHashKey("WEAPON_PISTOL_MK2") then
			SetRichPresence('🔫 Bawi się bronią')
		elseif health ~= 150 then
		SetRichPresence('😷 Jest ranny')
		else
			SetRichPresence('🤫 SOON')
		end

    end
end)
Citizen.CreateThread(function()
    while true do
        Citizen.Wait(5000)
            if IsPedInAnyVehicle(PlayerPedId()) then
                SetUserRadioControlEnabled(false)
                if GetPlayerRadioStationName() ~= nil then
                SetVehRadioStation(GetVehiclePedIsIn(PlayerPedId()),"OFF")
            end
        end
    end
end)


CreateThread(function()
	while true do
		Citizen.Wait(1000)

		local playerPed = PlayerPedId()
		local pid = PlayerId()
		local car = GetVehiclePedIsIn(playerPed, false)
		if car then
			if PlayerData ~= nil and GetEntitySpeed(car) * 3.6 < 0 then
				SetPlayerCanDoDriveBy(pid, true)
			else
				local AktualnaBron = GetSelectedPedWeapon(playerPed)
				if GetEntitySpeed(car) * 3.6 > 0 or AktualnaBron == `WEAPON_UNARMED` then
					SetPlayerCanDoDriveBy(pid, false)
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)



Citizen.CreateThread(function()
    while true do
        Wait(6)
		function AddTextEntry(key, value)
			Citizen.InvokeNative(GetHashKey("ADD_TEXT_ENTRY"), key, value)
		end
		
		local config = {
			["TITLE"] = "AvystonRP",
			["SUBTITLE"] = "",
		
		}
		HideHUDThisFrame()
        local ped = GetPlayerPed( -1 )
		if IsPedArmed(ped, 6) then
            DisableControlAction(1, 140, true)
            DisableControlAction(1, 141, true)
            DisableControlAction(1, 142, true)
        end

    end

end)
local shot = false
local check = false
local check2 = false
local count = 0

CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		if IsPlayerFreeAiming(PlayerId()) then
		    if GetFollowPedCamViewMode() == 4 and check == false then
			    check = false
			else
			    SetFollowPedCamViewMode(4)
			    check = true
			end
		else
		    if check == true then
		        SetFollowPedCamViewMode(1)
				check = false
			end
		end
	end
end)

CreateThread(function()
	while true do
		SetBlackout(false)
		Citizen.Wait( 1 )
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == false and GetFollowPedCamViewMode() ~= 4 then
			check2 = true
			shot = true
			SetFollowPedCamViewMode(4)
		end
		
		if IsPedShooting(GetPlayerPed(-1)) and shot == true and GetFollowPedCamViewMode() == 4 then
			count = 0
		end
		
		if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
		    count = count + 1
		end

        if not IsPedShooting(GetPlayerPed(-1)) and shot == true then
			if not IsPedShooting(GetPlayerPed(-1)) and shot == true and count > 20 then
		        if check2 == true then
				    check2 = false
					shot = false
					SetFollowPedCamViewMode(1)
				end
			end
		end	    
	end
end)



