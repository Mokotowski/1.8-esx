ESX                = nil
local IsDead       = false
local IsAnimated   = false
local EnergyThread = nil

local IsAlreadyDrunk = false
local DrunkLevel = -1

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

AddEventHandler('esx_basicneeds:resetStatus', function()
	TriggerEvent('esx_status:set', 'hunger', 1800000)
	TriggerEvent('esx_status:set', 'thirst', 1800000)
	TriggerEvent('esx_status:set', 'drunk', 0)
end)

AddEventHandler('playerSpawned', function()
	Citizen.Wait(50000)
	if IsDead then
		TriggerEvent('esx_basicneeds:resetStatus')
	end

end)

function Drunk(level, start)
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		if start then
			DoScreenFadeOut(800)
			Wait(1000)
		end
		if level == 0 then
			RequestAnimSet("move_m@drunk@slightlydrunk")
			while not HasAnimSetLoaded("move_m@drunk@slightlydrunk") do
				Citizen.Wait(0)
			end
			SetPedMovementClipset(playerPed, "move_m@drunk@slightlydrunk", true)
		elseif level == 1 then
			RequestAnimSet("move_m@drunk@moderatedrunk")
			while not HasAnimSetLoaded("move_m@drunk@moderatedrunk") do
				Citizen.Wait(0)
			end
			SetPedMovementClipset(playerPed, "move_m@drunk@moderatedrunk", true)
		elseif level == 2 then
			RequestAnimSet("move_m@drunk@verydrunk")
			while not HasAnimSetLoaded("move_m@drunk@verydrunk") do
				Citizen.Wait(0)
			end
			SetPedMovementClipset(playerPed, "move_m@drunk@verydrunk", true)
		end
		SetTimecycleModifier("spectator5")
		SetPedMotionBlur(playerPed, true)
		SetPedIsDrunk(playerPed, true)
		if start then
			DoScreenFadeIn(800)
		end
	end)
end

function Reality()
	Citizen.CreateThread(function()
		local playerPed = PlayerPedId()
		DoScreenFadeOut(800)
		Wait(1000)
		ClearTimecycleModifier()
		ResetScenarioTypesEnabled()
		ResetPedMovementClipset(playerPed, 0)
		SetPedIsDrunk(playerPed, false)
		SetPedMotionBlur(playerPed, false)
		DoScreenFadeIn(800)
	end)
end

AddEventHandler('esx_status:loaded', function(status)

	TriggerEvent('esx_status:registerStatus', 'hunger', 1800000, {255, 210, 0}, true, function(status)
		if not GetPlayerInvincible(PlayerId()) then
			status.remove(250)
		end
	end)

	TriggerEvent('esx_status:registerStatus', 'thirst', 1800000, {0, 198, 255}, true, function(status)
		if not GetPlayerInvincible(PlayerId()) then
			status.remove(250)
		end
	end)

	TriggerEvent("esx_status:registerStatus", "drunk", 0, {0, 198, 255}, function(status)
		if status.val > 0 then
			return true
		else
			return false
		end
	end, function(status)
		status.remove(1500)
	end)

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(1000)
			if not GetPlayerInvincible(PlayerId()) then
				local playerPed  = PlayerPedId()
				local prevHealth = GetEntityHealth(playerPed)
				local health     = prevHealth

				TriggerEvent('esx_status:getStatus', 'hunger', function(status)
					if status.val == 0 then
						if prevHealth <= 50 then
							health = health - 5
						elseif prevHealth <= 150 then
							health = health - 3
						else
							health = health - 1
						end
					end
				end)

				TriggerEvent('esx_status:getStatus', 'thirst', function(status)
					if status.val == 0 then
						if prevHealth <= 50 then
							health = health - 5
						elseif prevHealth <= 150 then
							health = health - 3
						else
							health = health - 1
						end
					end
				end)

				TriggerEvent("esx_status:getStatus", "drunk", function(status)
					if status.val > 0 then
						local start = true
						if IsAlreadyDrunk then
							start = false
						end
						local level = 0
						if status.val <= 250000 then
							level = 0
						elseif status.val <= 500000 then
							level = 1
						else
							level = 2
						end
						if level ~= DrunkLevel then
							Drunk(level, start)
						end
						IsAlreadyDrunk = true
						DrunkLevel = level
					end
					if status.val == 0 then
						if IsAlreadyDrunk then
							Reality()
						end
						IsAlreadyDrunk = false
						DrunkLevel = -1
					end
				end)

				if health ~= prevHealth then
					SetEntityHealth(playerPed,  health)
				end
			end
		end
	end)



	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(300000)
			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val <= 900000 and status.val >= 225000 then
					TriggerEvent("FeedM:showNotification", 'Czujesz się głodny - zjedz coś', 10000, 'warning')
				end
			end)
			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val <= 900000 and status.val >= 225000 then
					TriggerEvent("FeedM:showNotification", 'Robi ci się sucho w gardle - napij się czegoś', 10000, 'warning')
				end
			end)
		end
	end)
	
	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(120000)
			TriggerEvent('esx_status:getStatus', 'hunger', function(status)
				if status.val <= 225000 and status.val >= 0 then
					TriggerEvent("FeedM:showNotification", 'Z braku jedzenia niedługo stracisz przytomność', 10000, 'danger')
				end
			end)
			TriggerEvent('esx_status:getStatus', 'thirst', function(status)
				if status.val <= 225000 and status.val >= 0 then
					TriggerEvent("FeedM:showNotification", 'Z braku jedzenia niedługo stracisz przytomność', 10000, 'danger')
				end
			end)
		end
	end)
	

	Citizen.CreateThread(function()
		while true do
			Citizen.Wait(10000)

			local playerPed = PlayerPedId()
			if IsEntityDead(playerPed) and not IsDead then
				IsDead = true
			end
		end
	end)
end)

AddEventHandler('esx_basicneeds:isEating', function(cb)
	cb(IsAnimated)
end)

RegisterNetEvent('esx_basicneeds:healPlayer')
AddEventHandler('esx_basicneeds:healPlayer', function()
	-- restore hunger & thirst
	TriggerEvent('esx_status:set', 'hunger', 1800000)
	TriggerEvent('esx_status:set', 'thirst', 1800000)

	-- restore hp
	local playerPed = PlayerPedId()
	SetEntityHealth(playerPed, GetEntityMaxHealth(playerPed))
end)














RegisterNetEvent('esx_basicneeds:onEat')
AddEventHandler('esx_basicneeds:onEat', function(prop_name)
    if not IsAnimated then
		local playerPed  = PlayerPedId()
    	IsAnimated = true

        RequestAnimDict('mp_player_inteat@burger')
        while not HasAnimDictLoaded('mp_player_inteat@burger') do
            Citizen.Wait(0)
        end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8.0, -1, 48, 0.0, false, false, false)
        Citizen.Wait(8000)

        IsAnimated = false
        ClearPedSecondaryTask(playerPed)
	end
end)

RegisterNetEvent('esx_basicneeds:chipsy')
AddEventHandler('esx_basicneeds:chipsy', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex = GetPedBoneIndex(playerPed, 57005)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_cs_crisps_01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
			while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
				Citizen.Wait(0)
			end

			TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8.0, -1, 48, 0.0, false, false, false)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
			Citizen.Wait(3000)

			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:apple')
AddEventHandler('esx_basicneeds:apple', function(prop_name)
    if not IsAnimated then
		local playerPed  = PlayerPedId()
    	IsAnimated = true

        RequestAnimDict('mp_player_inteat@burger')
        while not HasAnimDictLoaded('mp_player_inteat@burger') do
            Citizen.Wait(0)
        end

        TaskPlayAnim(playerPed, 'mp_player_inteat@burger', 'mp_player_int_eat_burger_fp', 8.0, -8.0, -1, 48, 0.0, false, false, false)
        Citizen.Wait(8000)

        IsAnimated = false
        ClearPedSecondaryTask(playerPed)
	end
end)

RegisterNetEvent('esx_basicneeds:onDrink')
AddEventHandler('esx_basicneeds:onDrink', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_ld_flow_bottle', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:milk')
AddEventHandler('esx_basicneeds:milk', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_cs_milk_01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.075, 0.055, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:b_coffee')
AddEventHandler('esx_basicneeds:b_coffee', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('ng_proc_coffee_01a', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.06, -0.075, 0.055, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:coffee')
AddEventHandler('esx_basicneeds:coffee', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('p_ing_coffeecup_01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.008, 0.055, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:onEnergy')
AddEventHandler('esx_basicneeds:onEnergy', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_energy_drink', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, "mp_player_intdrink", "loop_bottle", 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end

	if EnergyThread then
		TerminateThread(EnergyThread)
	end

	Citizen.CreateThread(function()
		EnergyThread = GetIdOfThisThread()

		local timer = 0
		while timer < 60 do
			ResetPlayerStamina(PlayerId())
			Citizen.Wait(3000)
			timer = timer + 3
		end

		EnergyThread = nil
	end)
end)

RegisterNetEvent('esx_basicneeds:donut')
AddEventHandler('esx_basicneeds:donut', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex = GetPedBoneIndex(playerPed, 57005)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_donut_02', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
			while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
				Citizen.Wait(0)
			end

			TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8.0, -1, 48, 0.0, false, false, false)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
			Citizen.Wait(8000)

			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

-- Cigarett 
RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx_cigarett:startSmoke')
AddEventHandler('esx_cigarett:startSmoke', function(source)
	SmokeAnimation()
end)

function SmokeAnimation()
	local playerPed = PlayerPedId()
	
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)               
	end)
end

function SmokeAnimation()
	local playerPed = PlayerPedId()
	
	Citizen.CreateThread(function()
        TaskStartScenarioInPlace(playerPed, "WORLD_HUMAN_SMOKING", 0, true)               
	end)
end
RegisterNetEvent('esx_basicneeds:juice')
AddEventHandler('esx_basicneeds:juice', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex  = GetPedBoneIndex(playerPed, 18905)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_food_cb_juice01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('mp_player_intdrink')  
			while not HasAnimDictLoaded('mp_player_intdrink') do
				Citizen.Wait(0)
			end

			AttachEntityToEntity(object, playerPed, boneIndex, 0.04, -0.117, 0.100, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
			TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
			Citizen.Wait(4000)

	        IsAnimated = false
	        ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:sandwich')
AddEventHandler('esx_basicneeds:sandwich', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex = GetPedBoneIndex(playerPed, 57005)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_sandwich_01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
			while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
				Citizen.Wait(0)
			end

			TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8.0, -1, 48, 0.0, false, false, false)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
			Citizen.Wait(8000)

			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)

RegisterNetEvent('esx_basicneeds:hamburger')
AddEventHandler('esx_basicneeds:hamburger', function()
	if not IsAnimated then
		local playerPed  = PlayerPedId()
		local coords     = GetEntityCoords(playerPed)
		local boneIndex = GetPedBoneIndex(playerPed, 57005)

		IsAnimated = true
		ESX.Game.SpawnObject('prop_cs_burger_01', {
			x = coords.x,
			y = coords.y,
			z = coords.z - 3
		}, function(object)
			RequestAnimDict('amb@code_human_wander_eating_donut@male@idle_a')
			while not HasAnimDictLoaded('amb@code_human_wander_eating_donut@male@idle_a') do
				Citizen.Wait(0)
			end

			TaskPlayAnim(playerPed, "amb@code_human_wander_eating_donut@male@idle_a", "idle_c", 3.5, -8.0, -1, 48, 0.0, false, false, false)
			AttachEntityToEntity(object, playerPed, boneIndex, 0.15, 0.01, -0.06, 185.0, 215.0, 180.0, true, true, false, true, 1, true)
			Citizen.Wait(8000)

			IsAnimated = false
			ClearPedSecondaryTask(playerPed)
			DeleteObject(object)
		end)
	end
end)


RegisterNetEvent('esx_extraitems:oxygen_mask')
AddEventHandler('esx_extraitems:oxygen_mask', function()
    local playerPed  = PlayerPedId()
    local coords     = GetEntityCoords(playerPed)
    local boneIndex  = GetPedBoneIndex(playerPed, 12844)
    local boneIndex2 = GetPedBoneIndex(playerPed, 24818)

    ESX.Game.SpawnObject('p_s_scuba_mask_s', {
        x = coords.x,
        y = coords.y,
        z = coords.z - 3
    }, function(object)
        ESX.Game.SpawnObject('p_s_scuba_tank_s', {
            x = coords.x,
            y = coords.y,
            z = coords.z - 3
        }, function(object2)
            AttachEntityToEntity(object2, playerPed, boneIndex2, -0.30, -0.22, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
            AttachEntityToEntity(object, playerPed, boneIndex, 0.0, 0.0, 0.0, 0.0, 90.0, 180.0, true, true, false, true, 1, true)
            SetPedDiesInWater(playerPed, false)

            ESX.ShowNotification(_U('dive_suit_on') .. '%.')
            Citizen.Wait(300000)
            ESX.ShowNotification(_U('oxygen_notify', '~y~', '50') .. '%.')
            Citizen.Wait(150000)
            ESX.ShowNotification(_U('oxygen_notify', '~o~', '25') .. '%.')
            Citizen.Wait(150000)
            ESX.ShowNotification(_U('oxygen_notify', '~r~', '0') .. '%.')

            SetPedDiesInWater(playerPed, true)
            DeleteObject(object)
            DeleteObject(object2)
            ClearPedSecondaryTask(playerPed)
        end)
    end)
end)

RegisterNetEvent('esx_extraitems:redgull')
AddEventHandler('esx_extraitems:redgull', function()

	local playerPed  = PlayerPedId()
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_energy_drink', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
		TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)


	ESX.ShowNotification('Wypiłeś redbulla! Przez następne 300 sekund nie odczujesz braku tchu!')
	
    StartScreenEffect("DrugsDrivingOut",3000,false)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.01)

	local timer = 0
	while timer < 300 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(5000)
		timer = timer + 5
	end
	ESX.ShowNotification('Twoje tętno wraca do normalnego stanu')
end)


RegisterNetEvent('esx_extraitems:redgullgbs')
AddEventHandler('esx_extraitems:redgullgbs', function()

	local playerPed  = PlayerPedId()
	local coords     = GetEntityCoords(playerPed)
	local boneIndex  = GetPedBoneIndex(playerPed, 18905)
	local boneIndex2 = GetPedBoneIndex(playerPed, 57005)

	RequestAnimDict('mp_player_intdrink')
	while not HasAnimDictLoaded('mp_player_intdrink') do
		Citizen.Wait(1)
	end
	
	ESX.Game.SpawnObject('prop_energy_drink', {
		x = coords.x,
		y = coords.y,
		z = coords.z - 3
	}, function(object)
		AttachEntityToEntity(object, playerPed, boneIndex, 0.09, -0.065, 0.045, -100.0, 0.0, -25.0, 1, 1, 0, 1, 1, 1)
		TaskPlayAnim(playerPed, 'mp_player_intdrink', 'loop_bottle', 1.0, -1.0, -1, 48, 0.0, false, false, false)
		Citizen.Wait(3000)
		DeleteObject(object)
		ClearPedSecondaryTask(playerPed)
	end)


	ESX.ShowNotification('Wypiłeś kawe GBS! Przez następne 300 sekund nie odczujesz braku tchu!')
	
    StartScreenEffect("DrugsDrivingOut",3000,false)
	ShakeGameplayCam('LARGE_EXPLOSION_SHAKE', 0.01)

	local timer = 0
	while timer < 120 do
		ResetPlayerStamina(PlayerId())
		Citizen.Wait(2000)
		timer = timer + 2
	end
	ESX.ShowNotification('Twoje tętno wraca do normalnego stanu')
end)