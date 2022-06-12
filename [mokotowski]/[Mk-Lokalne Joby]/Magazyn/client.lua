ESX = nil

local JobStart = Config.Warehouse.JobStart
local Boss = Config.Warehouse.Boss
local Garage = Config.Warehouse.Garage
local GarageSpawnPoint = Config.Warehouse.GarageSpawnPoint
local PostOP = Config.Warehouse.PostOP
local GoPostal = Config.Warehouse.GoPostal
local AlphaMail = Config.Warehouse.AlphaMail
local IKEA = Config.Warehouse.IKEA
local PackageMarker = Config.Warehouse.PackageMarker
local HasRandomBox = nil
local Type = nil
local Plate = nil
local done, AmountPayout = 0, 0

onDuty = false
hasCar = false
hasOpenDoor = false
hasBox = false

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(5)
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
    PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

-- STARTING JOB
Citizen.CreateThread(function()
    while true do

        local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)

            if (GetDistanceBetweenCoords(coords, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z, true) < 8) then
                sleep = 7
                DrawMarker(JobStart.Type, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, JobStart.Size.x, JobStart.Size.y, JobStart.Size.z, JobStart.Color.r, JobStart.Color.g, JobStart.Color.b, 500, false, true, 2, false, false, false, false)
                if (GetDistanceBetweenCoords(coords, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z, true) < 1.2) then
                    if not onDuty then
                        sleep = 7
                        DrawText3Ds(JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z + 0.4, '~g~[E]~s~ - Aby przebrać się w ciuchy robocze')
                        if IsControlJustPressed(0, Keys["E"]) then
          
                            Citizen.Wait(2500)
                            ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin, jobSkin)
                            if skin.sex == 0 then
                                TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.male)
                            elseif skin.sex == 1 then
                                TriggerEvent('skinchanger:loadClothes', skin, Config.Clothes.female)
                            end
                            end)
                            exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Zacząłeś pracę, udaj się do szefa, aby uzyskać informacje na temat pracy!", timeout = 3000})
                            onDuty = true
                            addBlips()
                        end
                    elseif onDuty then
                        sleep = 7
                        DrawText3Ds(JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z + 0.4, '~r~[E]~s~ - Przebież się w ciuchy cywilne')
                        DrawMarker(JobStart.Type, JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, JobStart.Size.x, JobStart.Size.y, JobStart.Size.z, JobStart.Color.r, JobStart.Color.g, JobStart.Color.b, 500, false, true, 2, false, false, false, false)
                        if IsControlJustPressed(0, Keys["E"]) then
                            if not HasRandomBox then
             
                                Citizen.Wait(2500)
                                ESX.TriggerServerCallback('esx_skin:getPlayerSkin', function(skin)
                                    TriggerEvent('skinchanger:loadSkin', skin)
                                end)
                                exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Wykonałeś prace!", timeout = 3000})
                                onDuty = false
                                RemoveBlip(bossBlip)
                            elseif HasRandomBox then
                                exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Po pierwsze, anuluj pracę u szefa", timeout = 3000})
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

-- BOSS
Citizen.CreateThread(function()
    while true do

        local sleep = 500
		local ped = PlayerPedId()
		local coords = GetEntityCoords(ped)
        local salary = Config.Payout * AmountPayout

            if onDuty then
                if (GetDistanceBetweenCoords(coords, Boss.Pos.x, Boss.Pos.y, Boss.Pos.z, true) < Config.DrawDistance) then
                    sleep = 7
                    DrawMarker(Boss.Type, Boss.Pos.x, Boss.Pos.y, Boss.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Boss.Size.x, Boss.Size.y, Boss.Size.z, Boss.Color.r, Boss.Color.g, Boss.Color.b, 500, false, true, 2, false, false, false, false)
                    if (GetDistanceBetweenCoords(coords, Boss.Pos.x, Boss.Pos.y, Boss.Pos.z, true) < 1.5) then
                        if not HasRandomBox then
                            DrawText3Ds(Boss.Pos.x, Boss.Pos.y, Boss.Pos.z + 0.4, "~g~[E]~s~ - Zapytaj szefa o pracę na dziś")
                            if IsControlJustPressed(0, Keys["E"]) then
                                HasRandomBox = math.random(6, 16)
                                Companies = Randomize(Config.Companies)
                                CreateWork(Companies.CompanyName)
                                addBlipsHRB()
                                exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Musisz zebrać " ..HasRandomBox.. " paczki z Magazynu. Weź " ..Companies.CompanyName.. " samochód z garażu i zaczynaj!", timeout = 5000})
                            end
                        elseif HasRandomBox then
                            if AmountPayout == 0 then
                                DrawText3Ds(Boss.Pos.x, Boss.Pos.y, Boss.Pos.z + 0.4, "~r~[E]~s~ - Anuluj zlecenie")
                                if IsControlJustPressed(0, Keys["E"]) then
                                    if not hasCar then
                                        done = 0
                                        Type = nil
                                        HasRandomBox = nil
                                        DeleteCompanyBlip()
                                        RemoveBlip(garageBlip)
                                        for i, v in ipairs(Config.WarehouseSpots) do
                                            v.taked = true
                                            RemoveBlip(v.blip)
                                        end
                                        exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Odwołujesz zlecenie", timeout = 3000})
                                    elseif hasCar then
                                        exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Umieść pojazd w garażu", timeout = 3000})
                                    end
                                end
                            elseif AmountPayout == HasRandomBox then
                                DrawText3Ds(Boss.Pos.x, Boss.Pos.y, Boss.Pos.z + 0.4, "~g~[E]~s~ - Otrzymujesz wynagrodzenie w wysokości " ..salary.. "$")
                                if IsControlJustPressed(0, Keys["E"]) then
                                    if not hasCar then
                               

                                        Citizen.Wait(2000)
                                        TriggerServerEvent('inside-warehouse:Payout', AmountPayout)
                                        exports.pNotify:SendNotification({text = '<b>Magazyn</b></br>Zarobiłeś ' ..salary.. '$!', timeout = 3000})
                                        RemoveBlip(garageBlip)
                                        AmountPayout = 0
                                        done = 0
                                        HasRandomBox = nil
                                    elseif hasCar then
                                        exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Umieść pojazd w garażu", timeout = 3000})
                                    end
                                end
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

-- CAR DEPOSIT
Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)

            if HasRandomBox then
                if (GetDistanceBetweenCoords(coords, Garage.Pos.x, Garage.Pos.y, Garage.Pos.z, true) < Config.DrawDistance) then
                    sleep = 7
                    DrawMarker(Garage.Type, Garage.Pos.x, Garage.Pos.y, Garage.Pos.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, Garage.Size.x, Garage.Size.y, Garage.Size.z, Garage.Color.r, Garage.Color.g, Garage.Color.b, 500, false, true, 2, false, false, false, false)
                    if (GetDistanceBetweenCoords(coords, Garage.Pos.x, Garage.Pos.y, Garage.Pos.z, true) < 2.5) then
                        if IsPedInAnyVehicle(ped, false) then
                            DrawText3Ds(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z + 0.4, '~r~[E]~s~ - Zwrot pojazdu')
                            if IsControlJustReleased(0, Keys["E"]) then
                                if hasCar then
                                    ReturnVehicle()
                                    exports.pNotify:SendNotification({text = '<b>Magazyn</b></br>Orzymałeś ' ..Config.DepositPrice.. '$ za zwrot pojazdu', timeout = 1500})
                                    hasCar = false
                                    Plate = nil
                                end
                            end
                        elseif not IsPedInAnyVehicle(ped, false) then
                            if not hasCar then
                                DrawText3Ds(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z + 0.4, '~g~[E]~s~ - Wyjmij pojazd')
                            elseif hasCar then
                                DrawText3Ds(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z + 0.4, 'Masz już wyciągnięty pojazd')
                            end
                            if IsControlJustReleased(0, Keys["E"]) then
                   
                                    if Type == "Post OP" then
                                        ESX.Game.SpawnVehicle(Config.CarPostOP, vector3(GarageSpawnPoint.Pos.x, GarageSpawnPoint.Pos.y, GarageSpawnPoint.Pos.z), GarageSpawnPoint.Pos.h, function(vehicle)
                                        SetVehicleNumberPlateText(vehicle, "WRH"..tostring(math.random(1000, 9999)))
                                        SetVehicleEngineOn(vehicle, true, true)
                                        hasCar = true
                                        Plate = GetVehicleNumberPlateText(vehicle)
                                        BlipsOnWorking()
                                        for i, v in ipairs(Config.WarehouseSpots) do
                                            v.taked = false
                                        end
                                        end)
                                    elseif Type == "GoPostal" then
                                        ESX.Game.SpawnVehicle(Config.CarGoPostal, vector3(GarageSpawnPoint.Pos.x, GarageSpawnPoint.Pos.y, GarageSpawnPoint.Pos.z), GarageSpawnPoint.Pos.h, function(vehicle)
                                        SetVehicleNumberPlateText(vehicle, "WRH"..tostring(math.random(1000, 9999)))
                                        SetVehicleEngineOn(vehicle, true, true)
                                        hasCar = true
                                        Plate = GetVehicleNumberPlateText(vehicle)
                                        BlipsOnWorking()
                                        for i, v in ipairs(Config.WarehouseSpots) do
                                            v.taked = false
                                        end
                                        end)
                                    elseif Type == "Alpha Mail" then
                                        ESX.Game.SpawnVehicle(Config.CarAlphaMail, vector3(GarageSpawnPoint.Pos.x, GarageSpawnPoint.Pos.y, GarageSpawnPoint.Pos.z), GarageSpawnPoint.Pos.h, function(vehicle)
                                        SetVehicleNumberPlateText(vehicle, "WRH"..tostring(math.random(1000, 9999)))
                                        SetVehicleEngineOn(vehicle, true, true)
                                        hasCar = true
                                        Plate = GetVehicleNumberPlateText(vehicle)
                                        BlipsOnWorking()
                                        for i, v in ipairs(Config.WarehouseSpots) do
                                            v.taked = false
                                        end
                                        end)
                                    elseif Type == "IKEA" then
                                        ESX.Game.SpawnVehicle(Config.CarDefault, vector3(GarageSpawnPoint.Pos.x, GarageSpawnPoint.Pos.y, GarageSpawnPoint.Pos.z), GarageSpawnPoint.Pos.h, function(vehicle)
                                        SetVehicleNumberPlateText(vehicle, "WRH"..tostring(math.random(1000, 9999)))
                                        SetVehicleEngineOn(vehicle, true, true)
                                        hasCar = true
                                        Plate = GetVehicleNumberPlateText(vehicle)
                                        BlipsOnWorking()
                                        for i, v in ipairs(Config.WarehouseSpots) do
                                            v.taked = false
                                        end
                                        end)
                                    end
                              
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

-- OPENING VAN DOORS
Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)

            if hasCar then
                if not IsPedInAnyVehicle(ped, false) then
                    if Plate == GetVehicleNumberPlateText(vehicle) then
                        local trunkpos = GetOffsetFromEntityInWorldCoords(vehicle, 0, -3.5, 0)
                        if (GetDistanceBetweenCoords(coords.x, coords.y, coords.z, trunkpos.x, trunkpos.y, trunkpos.z, true) < 2) then
                            sleep = 7
                            if not hasOpenDoor and not hasBox then
                                sleep = 7
                                DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.4, "~g~[G]~s~ - Otwórz drzwi")
                                if IsControlJustReleased(0, Keys["G"]) then
                      
                                    Citizen.Wait(1500)
                                    SetVehicleDoorOpen(vehicle, 3, false, false)
                                    SetVehicleDoorOpen(vehicle, 2, false, false)
                                    hasOpenDoor = true
                                end
                            elseif hasOpenDoor then
                                sleep = 7
                                DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.25, "Paczek: ~g~" ..done.. "/" ..HasRandomBox.. "~s~")
                                if not hasBox and done == 0 then
                                    sleep = 7
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.4, "~r~[G]~s~ - Zamknij drzwi")
                                    if IsControlJustReleased(0, Keys["G"]) then
                       
                                        Citizen.Wait(1500)
                                        SetVehicleDoorShut(vehicle, 3, false)
                                        SetVehicleDoorShut(vehicle, 2, false)
                                        hasOpenDoor = false
                                    end
                                elseif not hasBox then
                                    sleep = 7
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.4, "~r~[G]~s~ - Zamknij drzwi | ~r~[E]~s~ - Wyjmij paczkę")
                                    if IsControlJustReleased(0, Keys["G"]) then
                            
                                        Citizen.Wait(1500)
                                        SetVehicleDoorShut(vehicle, 3, false)
                                        SetVehicleDoorShut(vehicle, 2, false)
                                        hasOpenDoor = false
                                    elseif IsControlJustReleased(0, Keys["E"]) then
                           
                                        Citizen.Wait(1500)
                                        addPackage()
                                        hasBox = true
                                        done = done - 1
                                    end
                                elseif hasBox then
                                    sleep = 7
                                    DrawText3Ds(trunkpos.x, trunkpos.y, trunkpos.z + 0.4, "~g~[E]~s~ - Umieść opakowanie")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                     
                                        Citizen.Wait(1500)
                                        removePackage()
                                        hasBox = false
                                        done = done + 1
                                        if done == HasRandomBox then
                                            exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Zebrałeś wszystkie skrzynki z bazy, teraz dostarcz je do " ..Companies.CompanyName.. ' firmy!', timeout = 5000})
                                            if Type == "GoPostal" then
                                                SetNewWaypoint(GoPostal.Pos.x, GoPostal.Pos.y, GoPostal.Pos.z)
                                            elseif Type == "Post OP" then
                                                SetNewWaypoint(PostOP.Pos.x, PostOP.Pos.y, PostOP.Pos.z)
                                            elseif Type == "Alpha Mail" then
                                                SetNewWaypoint(AlphaMail.Pos.x, AlphaMail.Pos.y, AlphaMail.Pos.z)
                                            elseif Type == "IKEA" then
                                                SetNewWaypoint(IKEA.Pos.x, IKEA.Pos.y, IKEA.Pos.z)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

-- WORKING
Citizen.CreateThread(function()
    while true do

        local sleep = 500
        local ped = PlayerPedId()
        local coords = GetEntityCoords(ped)
        local vehicle = GetVehiclePedIsIn(GetPlayerPed(-1), true)
        local vheading = GetEntityHeading(vehicle)

            if hasCar then
                for i, v in ipairs(Config.WarehouseSpots) do
                    if HasRandomBox and i > HasRandomBox then break end
                    if not v.taked then
                        if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 40) then
                            sleep = 7
                            DrawMarker(PackageMarker.Type, v.x, v.y, v.z - 0.95, 0.0, 0.0, 0.0, 0, 0.0, 0.0, PackageMarker.Size.x, PackageMarker.Size.y, PackageMarker.Size.z, PackageMarker.Color.r, PackageMarker.Color.g, PackageMarker.Color.b, 500, false, true, 2, false, false, false, false)
                            if not hasBox then
                                if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                                    sleep = 7
                                    DrawText3Ds(v.x, v.y, v.z + 0.4, "~g~[E]~s~ - Odbierz opakowanie")
                                    if IsControlJustReleased(0, Keys["E"]) then
                                        if hasOpenDoor then
                                    
                                            Citizen.Wait(1500)
                                            addPackage()
                                            v.taked = true
                                            hasBox = true
                                            RemoveBlip(v.blip)
                                        elseif not hasOpenDoor then
                                            exports.pNotify:SendNotification({text = "<b>Magazyn</b></br>Otwórz tylnie drzwi w samochodzie!", timeout = 5000})
                                        end
                                    end
                                end
                            end
                        end
                    end
                end
            end
            if Type == "GoPostal" then
                for i, v in ipairs(Config.GoPostal) do
                    if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 15) then
                        sleep = 7
                        DrawMarker(PackageMarker.Type, v.x, v.y, v.z - 0.85, 0.0, 0.0, 0.0, 0, 0.0, 0.0, PackageMarker.Size.x, PackageMarker.Size.y, PackageMarker.Size.z, PackageMarker.Color.r, PackageMarker.Color.g, PackageMarker.Color.b, 500, false, true, 2, false, false, false, false)
                        if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                            if not hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "Wyjmij opakowanie z pojazdu")
                            elseif hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "~g~[E]~s~ - Dostarcz opakowanie")
                                if IsControlJustReleased(0, Keys["E"]) then
                                
                                    Citizen.Wait(1500)
                                    removePackage()
                                    hasBox = false
                                    AmountPayout = AmountPayout + 1
                                    if AmountPayout == HasRandomBox then
                                        exports.pNotify:SendNotification({text = '<b>Magazyn</b></br>Dostarczyłeś wszystkie paczki do GoPostu, teraz wróć pojazdem i udaj się do szefa!', timeout = 5000})
                                        SetNewWaypoint(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z)
                                        Type = nil
                                        DeleteCompanyBlip()
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "Post OP" then
                for i, v in ipairs(Config.PostOP) do
                    if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 15) then
                        sleep = 7
                        DrawMarker(PackageMarker.Type, v.x, v.y, v.z - 0.85, 0.0, 0.0, 0.0, 0, 0.0, 0.0, PackageMarker.Size.x, PackageMarker.Size.y, PackageMarker.Size.z, PackageMarker.Color.r, PackageMarker.Color.g, PackageMarker.Color.b, 500, false, true, 2, false, false, false, false)
                        if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                            if not hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "Wyjmij opakowanie z pojazdu")
                            elseif hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "~g~[E]~s~ - Dostarcz opakowanie")
                                if IsControlJustReleased(0, Keys["E"]) then
                             
                                    Citizen.Wait(1500)
                                    removePackage()
                                    hasBox = false
                                    AmountPayout = AmountPayout + 1
                                    if AmountPayout == HasRandomBox then
                                        exports.pNotify:SendNotification({text = '<b>Magazyn</b></br>Dostarczyłeś wszystkie paczki do GoPostu, teraz wróć pojazdem i udaj się do szefa!', timeout = 5000})
                                        SetNewWaypoint(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z)
                                        Type = nil
                                        DeleteCompanyBlip()
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "Alpha Mail" then
                for i, v in ipairs(Config.AlphaMail) do
                    if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 15) then
                        sleep = 7
                        DrawMarker(PackageMarker.Type, v.x, v.y, v.z - 0.85, 0.0, 0.0, 0.0, 0, 0.0, 0.0, PackageMarker.Size.x, PackageMarker.Size.y, PackageMarker.Size.z, PackageMarker.Color.r, PackageMarker.Color.g, PackageMarker.Color.b, 500, false, true, 2, false, false, false, false)
                        if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                            if not hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "Wyjmij opakowanie z pojazdu")
                            elseif hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "~g~[E]~s~ - Dostarcz opakowanie")
                                if IsControlJustReleased(0, Keys["E"]) then
                              
                                    Citizen.Wait(1500)
                                    removePackage()
                                    hasBox = false
                                    AmountPayout = AmountPayout + 1
                                    if AmountPayout == HasRandomBox then
                                        exports.pNotify:SendNotification({text = '<b>Magazyn</b></br>Dostarczyłeś wszystkie paczki do GoPostu, teraz wróć pojazdem i udaj się do szefa!', timeout = 5000})
                                        SetNewWaypoint(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z)
                                        Type = nil
                                        DeleteCompanyBlip()
                                    end
                                end
                            end
                        end
                    end
                end
            elseif Type == "IKEA" then
                for i, v in ipairs(Config.IKEA) do
                    if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 15) then
                        sleep = 7
                        DrawMarker(PackageMarker.Type, v.x, v.y, v.z - 0.85, 0.0, 0.0, 0.0, 0, 0.0, 0.0, PackageMarker.Size.x, PackageMarker.Size.y, PackageMarker.Size.z, PackageMarker.Color.r, PackageMarker.Color.g, PackageMarker.Color.b, 500, false, true, 2, false, false, false, false)
                        if (GetDistanceBetweenCoords(coords, v.x, v.y, v.z, true) < 1.2) then
                            if not hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "Wyjmij opakowanie z pojazdu")
                            elseif hasBox then
                                DrawText3Ds(v.x, v.y, v.z + 0.4, "~g~[E]~s~ - Dostarcz opakowanie")
                                if IsControlJustReleased(0, Keys["E"]) then
                          
                                    Citizen.Wait(1500)
                                    removePackage()
                                    hasBox = false
                                    AmountPayout = AmountPayout + 1
                                    if AmountPayout == HasRandomBox then
                                        exports.pNotify:SendNotification({text = '<b>Magazyn</b></br>Dostarczyłeś wszystkie paczki do GoPostu, teraz wróć pojazdem i udaj się do szefa!', timeout = 5000})
                                        SetNewWaypoint(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z)
                                        Type = nil
                                        DeleteCompanyBlip()
                                    end
                                end
                            end
                        end
                    end
                end
            end
        Citizen.Wait(sleep)
    end
end)

function Randomize(tb)
	local keys = {}
	for k in pairs(tb) do table.insert(keys, k) end
	return tb[keys[math.random(#keys)]]
end

function CreateWork(type)

    if type == "GoPostal" then
        for i, v in ipairs(Config.GoPostal) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 318)
            SetBlipColour(v.blip, 24)
            SetBlipScale(v.blip, 0.6)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Magazynier] GoPostal')
            EndTextCommandSetBlipName(v.blip)
        end
    elseif type == "Post OP" then
        for i, v in ipairs(Config.PostOP) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 318)
            SetBlipColour(v.blip, 24)
            SetBlipScale(v.blip, 0.6)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Magazynier] Post OP')
            EndTextCommandSetBlipName(v.blip)
        end
    elseif type == "Alpha Mail" then
        for i, v in ipairs(Config.AlphaMail) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 318)
            SetBlipColour(v.blip, 24)
            SetBlipScale(v.blip, 0.6)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Magazynier] Alpha Mail')
            EndTextCommandSetBlipName(v.blip)
        end
    elseif type == "IKEA" then
        for i, v in ipairs(Config.IKEA) do
            v.blip = AddBlipForCoord(v.x, v.y, v.z)
            SetBlipSprite(v.blip, 318)
            SetBlipColour(v.blip, 24)
            SetBlipScale(v.blip, 0.6)
            SetBlipAsShortRange(v.blip, true)
            BeginTextCommandSetBlipName("STRING")
            AddTextComponentString('[Magazynier] IKEA')
            EndTextCommandSetBlipName(v.blip)
        end
    end
    Type = type
end

function DeleteCompanyBlip()
    for i, v in ipairs(Config.PostOP) do
        RemoveBlip(v.blip)
    end
    for i, v in ipairs(Config.GoPostal) do
        RemoveBlip(v.blip)
    end
    for i, v in ipairs(Config.AlphaMail) do
        RemoveBlip(v.blip)
    end
    for i, v in ipairs(Config.IKEA) do
        RemoveBlip(v.blip)
    end
end

-- RETURNING VEHICLE
function ReturnVehicle()
    local ped = PlayerPedId()
    local vehicle = GetVehiclePedIsIn(ped)

    ESX.Game.DeleteVehicle(vehicle)
end

-- MAIN BLIP
Citizen.CreateThread(function()
    mainBlip = AddBlipForCoord(JobStart.Pos.x, JobStart.Pos.y, JobStart.Pos.z)
    SetBlipSprite(mainBlip, 365)
    SetBlipDisplay(mainBlip, 4)
    SetBlipScale(mainBlip, JobStart.BlipScale)
    SetBlipAsShortRange(mainBlip, true)
    SetBlipColour(mainBlip, JobStart.BlipColor)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(JobStart.BlipLabel)
    EndTextCommandSetBlipName(mainBlip)
end)

-- ONDUTY BLIP
function addBlips()

    bossBlip = AddBlipForCoord(Boss.Pos.x, Boss.Pos.y, Boss.Pos.z)
    SetBlipSprite(bossBlip, 408)
    SetBlipDisplay(bossBlip, 4)
    SetBlipScale(bossBlip, Boss.BlipScale)
    SetBlipAsShortRange(bossBlip, true)
    SetBlipColour(bossBlip, Boss.BlipColor)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Boss.BlipLabel)
    EndTextCommandSetBlipName(bossBlip)
end

-- AFTER BOSS BLIPS
function addBlipsHRB()
    
    garageBlip = AddBlipForCoord(Garage.Pos.x, Garage.Pos.y, Garage.Pos.z)
    SetBlipSprite(garageBlip, 326)
    SetBlipDisplay(garageBlip, 4)
    SetBlipScale(garageBlip, Garage.BlipScale)
    SetBlipAsShortRange(garageBlip, true)
    SetBlipColour(garageBlip, Garage.BlipColor)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentSubstringPlayerName(Garage.BlipLabel)
    EndTextCommandSetBlipName(garageBlip)
end

-- WORKING BLIPS
function BlipsOnWorking()
    for i, v in ipairs(Config.WarehouseSpots) do
        if HasRandomBox and i > HasRandomBox then break end
        v.blip = AddBlipForCoord(v.x, v.y, v.z)
        SetBlipSprite(v.blip, 1)
        SetBlipColour(v.blip, 24)
        SetBlipScale(v.blip, 0.3)
        SetBlipAsShortRange(v.blip, true)
        BeginTextCommandSetBlipName("STRING")
        AddTextComponentSubstringPlayerName('[Magazynier] Paczki')
        EndTextCommandSetBlipName(v.blip)
    end
end

function addPackage()
    local ped = PlayerPedId()
    local coords = GetEntityCoords(ped)

    RequestAnimDict("anim@heists@box_carry@")
    while (not HasAnimDictLoaded("anim@heists@box_carry@")) do
        Citizen.Wait(7)
    end
    TaskPlayAnim(GetPlayerPed(-1), "anim@heists@box_carry@" ,"idle", 5.0, -1, -1, 50, 0, false, false, false)
    pack = CreateObject(GetHashKey('prop_cs_cardbox_01'), coords.x, coords.y, coords.z,  true,  true, true)
    AttachEntityToEntity(pack, ped, GetPedBoneIndex(ped, 57005), 0.05, 0.1, -0.3, 300.0, 250.0, 20.0, true, true, false, true, 1, true)
end

function removePackage()
    local ped = PlayerPedId()

    ClearPedTasks(ped)
    DeleteEntity(pack)
end

function DrawText3Ds(x, y, z, text)
	SetTextScale(0.35, 0.35)
    SetTextFont(4)
    SetTextProportional(1)
    SetTextColour(255, 255, 255, 215)
    SetTextEntry("STRING")
    SetTextCentre(true)
    AddTextComponentString(text)
    SetDrawOrigin(x,y,z, 0)
    DrawText(0.0, 0.0)
    local factor = (string.len(text)) / 370
    DrawRect(0.0, 0.0+0.0125, 0.017+ factor, 0.03, 0, 0, 0, 75)
    ClearDrawOrigin()
end
