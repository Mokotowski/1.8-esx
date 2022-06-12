ESX = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(100)
	end

	PlayerLoaded = true
	ESX.PlayerData = ESX.GetPlayerData()
end)

local vehicles = {}

---- Retrieve the keys of a player when he reconnects.
-- The keys are synchronized with the server. If you restart the server, all keys disappear.
AddEventHandler("playerSpawned", function()
	Citizen.Wait(30000)
    TriggerServerEvent("ls:retrieveVehiclesOnconnect")
end)

RegisterCommand('przekazkluczyki', function(source, args)
local playerped = PlayerPedId()
local vehicle = GetVehiclePedIsIn(playerped, true)
local id = args[1]
if args[1] ~= nil then
local plate = GetVehicleNumberPlateText(vehicle)

TriggerServerEvent('ls:givekeyscommand', id, plate)
else
ESX.ShowNotification("~g~Poprawne Użycie: /przekazklucze id")
end
end, false)


---- Main thread
-- The logic of the script is here
Citizen.CreateThread(function()
    while true do
        Wait(10)
		if(IsControlPressed(1, Config.specialkey)) and (IsControlJustPressed(1, Config.key)) then
			local ply = GetPlayerPed(-1)
			local isInside = false
			
			if(IsPedInAnyVehicle(ply, true))then
				localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
				isInside = true
			end

			if(localVehId and localVehId ~= 0)then
				if(isInside) then
					local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
					local hasKey = false
					for plate, vehicle in pairs(vehicles) do
						if(string.lower(plate) == localVehPlate)then
							if(vehicle ~= "locked")then
								hasKey = true
							end
						end
					end
					
					if(hasKey) then
						TriggerServerEvent("ls:removeOwner", localVehPlate)
					ESX.ShowNotification("AvystonRP", "Kluczyki", "Zostawiasz kluczyki do tego ~g~ pojazdu", "CustomLogo", 1)						
					--	TriggerEvent('pNotify:SendNotification', {text = 'Zostawiasz kluczyki <br>Nr rej.: '..localVehPlate})
					else
						ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Nie masz kluczyków do tego pojazdu", "CustomLogo", 1)					
						--TriggerEvent('pNotify:SendNotification', {text = 'Nie masz kluczków <br>Nr rej.: '..localVehPlate})
					end
				end
			end
		elseif(IsControlJustPressed(1, Config.key))then

            -- Init player infos
            local ply = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(ply, true)
            local px, py, pz = table.unpack(GetEntityCoords(ply, true))
            isInside = false

            -- Retrieve the local ID of the targeted vehicle
            if(IsPedInAnyVehicle(ply, true))then
                -- by sitting inside him
                localVehId = GetVehiclePedIsIn(GetPlayerPed(-1), false)
                isInside = true
            else
                -- by targeting the vehicle
                localVehId = GetTargetedVehicle(pCoords, ply)
            end
	
            -- Get targeted vehicle infos
            if(localVehId and localVehId ~= 0)then
				NetworkRequestControlOfEntity(localVehId)
                local localVehPlateTest = GetVehicleNumberPlateText(localVehId)
                if localVehPlateTest ~= nil then
                    local localVehPlate = string.lower(localVehPlateTest)
                    local localVehLockStatus = GetVehicleDoorLockStatus(localVehId)
                    local hasKey = false

                    -- If the vehicle appear in the table (if this is the player's vehicle or a locked vehicle)
                    for plate, vehicle in pairs(vehicles) do
                        if(string.lower(plate) == localVehPlate)then
                            -- If the vehicle is not locked (this is the player's vehicle)
                            if(vehicle ~= "locked")then
                                hasKey = true
                                if(time > timer)then
                                    -- update the vehicle infos (Useful for hydrating instances created by the /givekey command)
									if not IsPedInAnyVehicle(PlayerPedId()) then
										while not HasAnimDictLoaded('anim@mp_player_intmenu@key_fob@') do 
											RequestAnimDict('anim@mp_player_intmenu@key_fob@')
											Citizen.Wait(5)
										end
                                        TaskPlayAnim(PlayerPedId(), "anim@mp_player_intmenu@key_fob@", "fob_click_fp", 8.0, 8.0, -1, 48, 0, false, false, false)
                                    end
                                    vehicle.update(localVehId, localVehLockStatus)
                                    -- Lock or unlock the vehicle
                                    vehicle.lock()
                                    time = 0
                                else
                                    --TriggerEvent("ls:notify", _U("lock_cooldown", (timer / 1000)))
                                end
                            else
								local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
								ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Nie znalazłeś ~r~kluczyków", "CustomLogo", 1)			
								--TriggerEvent('pNotify:SendNotification', {text = 'Nie udało się znaleźć kluczyków <br>Nr rej.: '..localVehPlate})
                            end
                        end
                    end

                    -- If the player doesn't have the keys
                    if(not hasKey)then
                        -- If the player is inside the vehicle
                        if(isInside)then
                            -- If the player find the keys
                            if(canSteal())then
                                -- Check if the vehicle is already owned.
                                -- And send the parameters to create the vehicle object if this is not the case.
                                TriggerServerEvent('ls:checkOwner', localVehId, localVehPlate, localVehLockStatus)
                            else
                                -- If the player doesn't find the keys
                                -- Lock the vehicle (players can't try to find the keys again)
                                vehicles[localVehPlate] = "locked"
                                TriggerServerEvent("ls:lockTheVehicle", localVehPlate)
								local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
											ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Nie znalazłeś ~r~kluczyków", "CustomLogo", 1)
                                --TriggerEvent('pNotify:SendNotification', {text = 'Nie udało się znaleźć kluczyków <br>Nr rej.: '..localVehPlate})
                            end
                        end
                    end
                else
                    --TriggerEvent("ls:notify", _U("could_not_find_plate"))
                end
            end
        end
    end
end)

---- Timer
Citizen.CreateThread(function()
    timer = Config.lockTimer * 1000
    time = 0
	while true do
		Wait(10000)
		time = time + 10000
	end
end)

---- Prevents the player from breaking the window if the vehicle is locked
-- (fixing a bug in the previous version)
Citizen.CreateThread(function()
	while true do
		Wait(10)
		local ped = GetPlayerPed(-1)
        if DoesEntityExist(GetVehiclePedIsTryingToEnter(PlayerPedId(ped))) then
        	local veh = GetVehiclePedIsTryingToEnter(PlayerPedId(ped))
	        local lock = GetVehicleDoorLockStatus(veh)
	        if lock == 4 then
	        	ClearPedTasks(ped)
	        end
        end
	end
end)



------------------------    EVENTS      ------------------------
------------------------     :)         ------------------------

---- Update a vehicle plate (for developers)
-- @param string oldPlate
-- @param string newPlate
RegisterNetEvent("ls:updateVehiclePlate")
AddEventHandler("ls:updateVehiclePlate", function(oldPlate, newPlate)
    local oldPlate = string.lower(oldPlate)
    local newPlate = string.lower(newPlate)

    if(vehicles[oldPlate])then
        vehicles[newPlate] = vehicles[oldPlate]
        vehicles[oldPlate] = nil

        TriggerServerEvent("ls:updateServerVehiclePlate", oldPlate, newPlate)
    end
end)
RegisterNetEvent("ls:getHasOwner")
AddEventHandler("ls:getHasOwner", function(hasOwner, localVehId, localVehPlate, localVehLockStatus)
    if(not hasOwner)then
        TriggerEvent("ls:newVehicle", localVehPlate, localVehId, localVehLockStatus)
        TriggerServerEvent("ls:addOwner", localVehPlate)

		local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
		--TriggerEvent('pNotify:SendNotification', {text = getRandomMsg()..'<br>Nr rej.:'..localVehPlate})
    else
	local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
				ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Samochód nie należy do ciebie", "CustomLogo", 1)
		--TriggerEvent('pNotify:SendNotification', {text = 'Samochód nie należy do ciebie <br>Nr rej.: '..localVehPlate})
    end
end)

RegisterNetEvent('ls:dodajklucze')
AddEventHandler('ls:dodajklucze', function(localVehPlate)
	TriggerEvent("ls:newVehicle", localVehPlate, nil, nil)
	TriggerServerEvent("ls:addOwner", localVehPlate)
	local tablice = tostring(string.upper(localVehPlate))
	--TriggerEvent('pNotify:SendNotification', {text = 'Dostałeś kluczyki do pojazdu: '..tablice})
end)

---- Create a new vehicle object
-- @param int id [opt]
-- @param string plate
-- @param string lockStatus [opt]
RegisterNetEvent("ls:newVehicle")
AddEventHandler("ls:newVehicle", function(plate, id, lockStatus)
    if(plate)then
        local plate = string.lower(plate)
        if(not id) then 
            id = nil 
        end
        if(not lockStatus) then 
            lockStatus = nil 
        end
        vehicles[plate] = newVehicle()
        vehicles[plate].__construct(plate, id, lockStatus)
       -- print(plate)
    else
        print("Can't create the vehicle instance. Missing argument PLATE")
    end
end)

RegisterNetEvent("ls:giveKeys")
AddEventHandler("ls:giveKeys", function(plate)
    local plate = string.lower(plate)
    TriggerEvent("ls:newVehicle", plate, nil, nil)
	TriggerServerEvent("ls:addOwner", plate)
	local tablice = tostring(string.upper(plate))
	ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Znalazłeś kluczyki do pojazdu ~b~"..tablice.."", "CustomLogo", 1)
	--TriggerEvent('pNotify:SendNotification', {text = 'Dostałeś kluczyki do pojazdu: '..tablice})
end)

RegisterNetEvent("ls:removeKeys")
AddEventHandler("ls:removeKeys", function(plate)
    local plate = string.lower(plate)
	vehicles[plate] = nil
end)

------------------------    FUNCTIONS      ------------------------
------------------------        :O         ------------------------

---- A simple algorithm that checks if the player finds the keys or not.
-- @return boolean
function canSteal()
    nb = math.random(1, 100)
    percentage = Config.percentage
    if(nb < percentage)then
        return true
    else
        return false
    end
end

---- Return a random message
-- @return string
function getRandomMsg()
    msgNb = math.random(1, #Config.randomMsg)
    return Config.randomMsg[msgNb]
end

---- Get a vehicle in direction
-- @param array coordFrom
-- @param array coordTo
-- @return int
function GetVehicleInDirection(coordFrom, coordTo)
	local rayHandle = CastRayPointToPoint(coordFrom.x, coordFrom.y, coordFrom.z, coordTo.x, coordTo.y, coordTo.z, 10, GetPlayerPed(-1), 0)
	local a, b, c, d, vehicle = GetRaycastResult(rayHandle)
	return vehicle
end

---- Get the vehicle in front of the player
-- @param array pCoords
-- @param int ply
-- @return int
function GetTargetedVehicle(pCoords, ply)
    for i = 1, 200 do
        coordB = GetOffsetFromEntityInWorldCoords(ply, 0.0, (6.281)/i, 0.0)
        targetedVehicle = GetVehicleInDirection(pCoords, coordB)
        if(targetedVehicle ~= nil and targetedVehicle ~= 0)then
            return targetedVehicle
        end
    end
    return
end


--Kluczyki


function newVehicle()
    local self = {}

    self.id = nil
    self.plate = nil
    self.lockStatus = nil

    rTable = {}

    rTable.__construct = function(id, plate, lockStatus)
        if(id and type(id) == "number")then
            self.id = id
        end
        if(plate and type(plate) == "string")then
            self.plate = plate
        end
        if(lockStatus and type(lockStatus) == "number")then
            self.lockStatus = lockStatus
        end
    end

    -- Methods

    rTable.update = function(id, lockStatus)
        self.id = id
        self.lockStatus = lockStatus
    end

    -- 0, 1 = unlocked
    -- 2 = locked
    -- 4 = locked and player can't get out\
	--ESX.TriggerServerCallback('esx_kluczyki:getlockstatus', function()
		local playerPed = GetPlayerPed(-1)
    rTable.lock = function()
        lockStatus = self.lockStatus
        if(lockStatus <= 2)then
            self.lockStatus = 4
            SetVehicleDoorsLocked(self.id, self.lockStatus)
            SetVehicleDoorsLockedForAllPlayers(self.id, 1)
            if GetVehicleDoorAngleRatio(self.id, 0) > .2 then
                SetVehicleDoorShut(self.id, 0, false)
            end
            if GetVehicleDoorAngleRatio(self.id, 1) > .2 then
                SetVehicleDoorShut(self.id, 1, false)
            end
            if GetVehicleDoorAngleRatio(self.id, 2) > .2 then
                SetVehicleDoorShut(self.id, 2, false)
            end
            if GetVehicleDoorAngleRatio(self.id, 3) > .2 then
                SetVehicleDoorShut(self.id, 3, false)
            end
			local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
          --  TriggerEvent('pNotify:SendNotification', {text = "Pojazd <font color='red'>zamknięty</font> <br>Nr rej.: "..localVehPlate})
			ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Pojazd ~r~zamknięty", "CustomLogo", 1)
			CloseDoors()
			if not IsPedInAnyVehicle(playerPed, false) then
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.0, 'CarBeep', 0.3)
			else
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.0, 'DoorClose', 0.3)
				SendNUIMessage({action = "lockSwitch", status = false})
			end			
		   TriggerEvent('esx_kluczyki', true)
        elseif(lockStatus > 2)then
		local localVehPlate = string.upper(tostring(GetVehicleNumberPlateText(localVehId)))
            self.lockStatus = 1
			local veh  
			--[[if not IsPedInAnyVehicle(playerPed, false) then
			veh = ESX.Game.GetVehicleInDirection()
			else
			veh = GetVehiclePedIsIn(playerPed)
			end
			while DoesEntityExist(veh) == false do
			Citizen.Wait(20)
				veh   = ESX.Game.GetVehicleInDirection()
			end	]]
			--[[local vehicles = ESX.Game.GetVehicles()
			for _, vehicle in ipairs(vehicles) do
				local vehiclePlate = GetVehicleNumberPlateText(vehicle, true)
				if type(vehiclePlate) == 'string' then
				
				end		
			end]]
			for plate, vehicle in pairs(vehicles) do
				--if(string.lower(plate) == localVehPlate)then
					--if(vehicle ~= "locked")then
					--	print(plate)
						--hasKey = true
					--end
				--end
			end			
			
			if DoesEntityExist(self.id) then
				SetVehicleDoorsLocked(self.id, self.lockStatus)
				SetVehicleDoorsLockedForAllPlayers(self.id, false)		
				Citizen.Wait(100)
				SetVehicleDoorsLocked(self.id, self.lockStatus)
				SetVehicleDoorsLockedForAllPlayers(self.id, false)		
				Citizen.Wait(100)
				SetVehicleDoorsLocked(self.id, self.lockStatus)
				SetVehicleDoorsLockedForAllPlayers(self.id, false)					
				ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Pojazd ~g~otwarty", "CustomLogo", 1)	
				Citizen.Wait(100)
				SetVehicleDoorsLocked(self.id, self.lockStatus)
				SetVehicleDoorsLockedForAllPlayers(self.id, false)					
			end			
           -- TriggerEvent('pNotify:SendNotification', {text = "Pojazd <font color='limegreen'>otwarty</font> <br>Nr rej.: "..localVehPlate})
			if not IsPedInAnyVehicle(playerPed, false) then
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.0, 'CarBeep', 0.3)
			else
				TriggerServerEvent('InteractSound_SV:PlayWithinDistance', 4.0, 'DoorOpen', 0.3)
				SendNUIMessage({action = "lockSwitch", status = true})
			end
			TriggerEvent('esx_kluczyki', false)
        end
    end
	--end)
    -- Setters

    rTable.setId = function(id)
        if(type(id) == "number" and id >= 0)then
            self.id = id
        end
    end

    rTable.setPlate = function(plate)
        if(type(plate) == "string")then
            self.plate = plate
        end
    end

    rTable.setLockStatus = function(lockStatus)
        if(type(lockStatus) == "number" and lockStatus >= 0)then
            self.lockStatus = lockStatus
            SetVehicleDoorsLocked(self.id, lockStatus)
        end
    end

    -- Getters

    rTable.getId = function()
        return self.id
    end

    rTable.getPlate = function()
        return self.plate
    end

    rTable.getLockStatus = function()
        return self.lockStatus
    end

    return rTable
end

RegisterNetEvent('ls:sprawdzfury')
AddEventHandler('ls:sprawdzfury', function()
klucze()
end)

function klucze()
	local elements = {		
	}
	local ply = GetPlayerPed(-1)
	local pCoords = GetEntityCoords(ply, true)
	local vehiclesesx = ESX.Game.GetVehiclesInArea(pCoords, 20.0)
	for _, vehicle in ipairs(vehiclesesx) do
		for plate, vehicled in pairs(vehicles) do
			local vehiclePlate = GetVehicleNumberPlateText(vehicle, true)
			if type(vehiclePlate) == 'string' then
				if string.lower(plate) == string.lower(vehiclePlate) then	
				local model = GetEntityModel(vehicle)
				local displaytext = GetDisplayNameFromVehicleModel(model)	
					table.insert(elements, {label = vehiclePlate..' - '..displaytext, value = plate})
				end
			end
		end
	end	
	
	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'klucze', {
		title    = 'Kluczyki',
		align    = 'left',
		elements = elements
	}, function(data, menu)

		if data.current.value ~= nil then
		    local ply = GetPlayerPed(-1)
            local pCoords = GetEntityCoords(ply, true)
			local vehicles = ESX.Game.GetVehiclesInArea(pCoords, 30.0)
			for _, vehicle in ipairs(vehicles) do
				local vehiclePlate = GetVehicleNumberPlateText(vehicle, true)
				if type(vehiclePlate) == 'string' then
					if string.lower(data.current.value) == string.lower(vehiclePlate) then
						NetworkRequestControlOfEntity(vehicle)					
						local doorlock = GetVehicleDoorLockStatus(vehicle)
						if doorlock > 12 then
							TriggerServerEvent('esx_kluczyki:open', NetworkGetNetworkIdFromEntity(vehicle))
							SetVehicleDoorsLocked(vehicle, 1)
							SetVehicleDoorsLockedForAllPlayers(vehicle, false)			
							ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Pojazd ~g~otwarty", "CustomLogo", 1)
						elseif doorlock <= 12 then
							SetVehicleDoorsLocked(vehicle, 4)
							SetVehicleDoorsLockedForAllPlayers(vehicle, true)			
							ESX.ShowAdvancedNotification("AvystonRP", "Kluczyki", "Pojazd ~r~zamknięty", "CustomLogo", 1)						
						end						
					end					
				end		
			end	
		
	
		end
	end, function(data, menu)
		menu.close()
	end)
end
RegisterCommand('klucze', function(source, args)
	klucze()
end, false) 

function CloseDoors()
	local vehicle = ESX.Game.GetVehicleInDirection()
	if vehicle and DoesEntityExist(vehicle) then
		for i = 0, 3 do
			SetVehicleDoorShut(vehicle, i, false)
		end
	end
end


