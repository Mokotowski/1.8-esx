local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
  ["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local PlayerData = {}
local HasAlreadyEnteredMarker = false
local LastStation, LastPart, LastPartNum, LastEntity
local CurrentAction = nil
local CurrentActionMsg  = ''
local CurrentActionData = {}
local IsHandcuffed = false
local HandcuffTimer = {}
local DragStatus = {}
DragStatus.IsDragged = false
local hasAlreadyJoined = false
local blipsCops = {}
local isDead = false
local CurrentTask = {}
local playerInService = false
local spawnedVehicles, isInShopMenu = {}, false
local prop
ESX                           = nil

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end

	PlayerData = ESX.GetPlayerData()
end)

function OpenBodySearchMenu(player)

	ESX.TriggerServerCallback('bestup_kajdanki:getOtherPlayerData', function(data,money_cash)

		local elements = {}
		table.insert(elements, {
			label     = '<span style="color:red;text-shadow: black 0.1em 0.1em 0.2em;">'.."--- Kasa ---"..'</span>'
		})

		for i=1, #data.accounts, 1 do
			print(data.accounts[i].name)

			if data.accounts[i].name == 'black_money' and data.accounts[i].money > 0 then

				table.insert(elements, {
					label    = 'Brudne pieniądze: <font color=red>'..ESX.Math.Round(data.accounts[i].money)..'€</font>',
					value    = 'black_money',
					itemType = 'item_account',
					amount   = data.accounts[i].money
				})

				break
			end

		end
		if money_cash > 0 then

			table.insert(elements, {
				label    = 'Gotówka: <font color=red>'..ESX.Math.Round(money_cash)..'€</font>',
				value    = 'cash',
				itemType = 'item_cash',
				amount   = money_cash
			})

		end
		table.insert(elements, {
			label     = '<span style="color:red;text-shadow: black 0.1em 0.1em 0.2em;">'.."--- Przedmioty ---"..'</span>'
		})

		for i=1, #data.inventory, 1 do
			if data.inventory[i].count > 0 then
				table.insert(elements, {
					label    = data.inventory[i].label.. ' | '..data.inventory[i].count,
					value    = data.inventory[i].name,
					itemType = 'item_standard',
					amount   = data.inventory[i].count
				})
			end
		end

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'body_search',
		{
			title    = 'Przeszukiwanie',
			align    = 'top-left',
			elements = elements,
		},
		function(data, menu)

			local itemType = data.current.itemType
			local itemName = data.current.value
			local amount   = data.current.amount

			if data.current.value ~= nil then
				TriggerServerEvent('bestup_kajdanki:confiscatePlayerItem', GetPlayerServerId(player), itemType, itemName, amount)
				OpenBodySearchMenu(player)
			end

		end, function(data, menu)
			menu.close()
		end)

	end, GetPlayerServerId(player))

end

-----------------
RegisterNetEvent('bestup_kajdanki:MenuKajdanek')
AddEventHandler('bestup_kajdanki:MenuKajdanek', function()

ESX.TriggerServerCallback("kajdanki:checkItem", function(output) 
if output then

ESX.UI.Menu.Open(
	'default', GetCurrentResourceName(), 'Kajdanki',
	{
		title    = 'Kajdanki',
		align    = 'top-left',
		elements = {
			{label = 'Skuj/Rozkuj', value = '11'},
			{label = 'Przenieś obywatela', value = '22'},
			{label = 'Przeszukaj obywatela', value = '33'},
			{label = 'Wsadź do pojazdu', value = '44'},
			{label = 'Wyjmij z pojazdu', value = '55'}
		}
	},
	function(data2, menu2)
		if data2.current.value == '11' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 3.0 then
				ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
			else
				if IsPedStill(GetPlayerPed(-1)) then
					local closestPlayerPed = GetPlayerPed(closestPlayer)
		            local health = GetEntityHealth(closestPlayerPed)
		            if health < 1 then
		            	TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(closestPlayer))
		            else
						TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(closestPlayer))
						TriggerServerEvent('bestup_kajdanki:PlayWithinDistance', 1.5, 'cuff', 1.0)
						RequestAnimDict('mp_arrest_paired')
						while not HasAnimDictLoaded('mp_arrest_paired') do
							Citizen.Wait(10)
						end
						--
						AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
						TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
						Citizen.Wait(3000)
						ClearPedTasks(GetPlayerPed(-1))
						DetachEntity(GetPlayerPed(-1))
					end
				else
					ESX.ShowNotification('~y~Nie możesz zakuć podczas poruszania się')
				end
			end
		elseif data2.current.value == '66' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 3.0 then
				ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
			else
				if IsPedStill(GetPlayerPed(-1)) then
					local closestPlayerPed = GetPlayerPed(closestPlayer)
		            local health = GetEntityHealth(closestPlayerPed)
		            if health < 1 then
		            	TriggerServerEvent("bestup_kajdanki:handcuff_all", GetPlayerServerId(closestPlayer))
		            else
						TriggerServerEvent("bestup_kajdanki:handcuff_all", GetPlayerServerId(closestPlayer))
						TriggerServerEvent('bestup_kajdanki:PlayWithinDistance', 1.5, 'cuff', 1.0)
						RequestAnimDict('mp_arrest_paired')
						while not HasAnimDictLoaded('mp_arrest_paired') do
							Citizen.Wait(10)
						end
						--
						AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
						TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
						Citizen.Wait(3000)
						ClearPedTasks(GetPlayerPed(-1))
						DetachEntity(GetPlayerPed(-1))
					end
				else
					ESX.ShowNotification('~y~Nie możesz zakuć podczas poruszania się')
				end
			end
		elseif data2.current.value == '22' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 3.0 then
			ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
			else
			TriggerServerEvent("bestup_kajdanki:drag", GetPlayerServerId(closestPlayer))
			Citizen.Wait(500)
			end
        elseif data2.current.value == '33' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 3.0 then
			ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
			else
				local closestPlayerPed = GetPlayerPed(closestPlayer)
				if IsEntityPlayingAnim(closestPlayerPed, "mp_arresting", "idle", 3 ) then
				RequestAnimDict('amb@prop_human_bum_bin@idle_a')
				while not HasAnimDictLoaded('amb@prop_human_bum_bin@idle_a') do
				Citizen.Wait(10)
				end
				TaskPlayAnim(GetPlayerPed(-1), 'amb@prop_human_bum_bin@idle_a', 'idle_a', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
				OpenBodySearchMenu(closestPlayer)
				else
				ESX.ShowNotification('~y~Osoba nie jest zakuta lub jest nieprzytomna!')
				end
			end
		elseif data2.current.value == '44' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 3.0 then
			ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
			else
			TriggerServerEvent("bestup_kajdanki:putInVehicle", GetPlayerServerId(closestPlayer))
			Citizen.Wait(500)
			end
		elseif data2.current.value == '55' then
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
			if closestPlayer == -1 or closestDistance > 3.0 then
			ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
			else
			TriggerServerEvent("bestup_kajdanki:OutVehicle", GetPlayerServerId(closestPlayer))
			Citizen.Wait(500)
			end
		end
		
	end,
	function(data2, menu2)
		menu2.close()
	
end)

else 
	ESX.ShowNotification('~r~Nie masz kajdanek')

end

end, 'handcuffs', 1)

end)


RegisterNetEvent('bestup_kajdanki:handcuff_all')
AddEventHandler('bestup_kajdanki:handcuff_all', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			prop = CreateObject(GetHashKey('p_cs_cuffs_02_s'), x, y, z+0.2,  true,  true, true)
			AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), -0.02, 0.06, 0.04, 0.0, 100.0, 110.0, true, true, false, true, 1, true)

			RequestAnimDict('mp_arrest_paired')
			while not HasAnimDictLoaded('mp_arrest_paired') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
			Citizen.Wait(3000)
	
			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end
			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			FreezeEntityPosition(playerPed, true)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)

			if Config.EnableHandcuffTimer then

				if HandcuffTimer.Active then
					ESX.ClearTimeout(HandcuffTimer.Task)
				end

				StartHandcuffTimer()
			end

		else
			FreezeEntityPosition(playerPed, true)
			if Config.EnableHandcuffTimer and HandcuffTimer.Active then
				ESX.ClearTimeout(HandcuffTimer.Task)
			end
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			DeleteEntity(prop)
			Citizen.Wait(3110)
			FreezeEntityPosition(playerPed, false)
		end
	end)

end)

RegisterNetEvent('bestup_kajdanki:handcuff')
AddEventHandler('bestup_kajdanki:handcuff', function()
	IsHandcuffed    = not IsHandcuffed
	local playerPed = PlayerPedId()

	Citizen.CreateThread(function()
		if IsHandcuffed then

			local x,y,z = table.unpack(GetEntityCoords(PlayerPedId()))
			prop = CreateObject(GetHashKey('p_cs_cuffs_02_s'), x, y, z+0.2,  true,  true, true)
			AttachEntityToEntity(prop, GetPlayerPed(-1), GetPedBoneIndex(GetPlayerPed(-1), 60309), -0.02, 0.06, 0.04, 0.0, 100.0, 110.0, true, true, false, true, 1, true)

			RequestAnimDict('mp_arrest_paired')
			while not HasAnimDictLoaded('mp_arrest_paired') do
				Citizen.Wait(10)
			end
			TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'crook_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
			Citizen.Wait(3000)
	
			RequestAnimDict('mp_arresting')
			while not HasAnimDictLoaded('mp_arresting') do
				Citizen.Wait(100)
			end
			TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0, 0, 0, 0)

			SetEnableHandcuffs(playerPed, true)
			DisablePlayerFiring(playerPed, true)
			FreezeEntityPosition(playerPed, false)
			SetCurrentPedWeapon(playerPed, GetHashKey('WEAPON_UNARMED'), true) -- unarm player
			SetPedCanPlayGestureAnims(playerPed, false)

			if Config.EnableHandcuffTimer then

				if HandcuffTimer.Active then
					ESX.ClearTimeout(HandcuffTimer.Task)
				end

				StartHandcuffTimer()
			end

		else

			if Config.EnableHandcuffTimer and HandcuffTimer.Active then
				ESX.ClearTimeout(HandcuffTimer.Task)
			end
			FreezeEntityPosition(playerPed, true)
			ClearPedSecondaryTask(playerPed)
			SetEnableHandcuffs(playerPed, false)
			DisablePlayerFiring(playerPed, false)
			SetPedCanPlayGestureAnims(playerPed, true)
			DeleteEntity(prop)
			Citizen.Wait(3110)
			FreezeEntityPosition(playerPed, false)
		end
	end)

end)

RegisterNetEvent('bestup_kajdanki:unrestrain')
AddEventHandler('bestup_kajdanki:unrestrain', function()
	if IsHandcuffed then
		local playerPed = PlayerPedId()
		IsHandcuffed = false

		ClearPedSecondaryTask(playerPed)
		SetEnableHandcuffs(playerPed, false)
		DisablePlayerFiring(playerPed, false)
		SetPedCanPlayGestureAnims(playerPed, true)

		if Config.EnableHandcuffTimer and HandcuffTimer.Active then
			ESX.ClearTimeout(HandcuffTimer.Task)
		end
	end
end)

RegisterNetEvent('bestup_kajdanki:drag')
AddEventHandler('bestup_kajdanki:drag', function(copID)
	if not IsHandcuffed then
		return
	end

	DragStatus.IsDragged = not DragStatus.IsDragged
	DragStatus.CopId     = tonumber(copID)
end)

Citizen.CreateThread(function()
	local playerPed
	local targetPed

	while true do
		Citizen.Wait(1)

		if IsHandcuffed then
			playerPed = PlayerPedId()

			if DragStatus.IsDragged then
				targetPed = GetPlayerPed(GetPlayerFromServerId(DragStatus.CopId))
					AttachEntityToEntity(playerPed, targetPed, 11816, 0.54, 0.54, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, true)

				if IsPedDeadOrDying(targetPed, true) then
					DragStatus.IsDragged = false
					DetachEntity(playerPed, true, false)
				end

			else
				DetachEntity(playerPed, true, false)
			end
		else
			Citizen.Wait(500)
		end
	end
end)
RegisterNetEvent('bestup_kajdanki:putInVehicle')
AddEventHandler('bestup_kajdanki:putInVehicle', function()
	local playerPed = PlayerPedId()
	local coords = GetEntityCoords(playerPed)

	if not IsHandcuffed then
		return
	end

	if IsAnyVehicleNearPoint(coords, 5.0) then
		local vehicle = GetClosestVehicle(coords, 5.0, 0, 71)

		if DoesEntityExist(vehicle) then
			local maxSeats, freeSeat = GetVehicleMaxNumberOfPassengers(vehicle)

			for i=maxSeats - 1, 0, -1 do
				if IsVehicleSeatFree(vehicle, i) then
					freeSeat = i
					break
				end
			end

			if freeSeat then
				TaskWarpPedIntoVehicle(playerPed, vehicle, freeSeat)
				DragStatus.IsDragged = false
			end
		end
	end
end)
RegisterNetEvent('bestup_kajdanki:OutVehicle')
AddEventHandler('bestup_kajdanki:OutVehicle', function()
	local playerPed = PlayerPedId()

	if not IsPedSittingInAnyVehicle(playerPed) then
		return
	end

	local vehicle = GetVehiclePedIsIn(playerPed, false)
	TaskLeaveVehicle(playerPed, vehicle, 16)
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(10)
		
		if IsHandcuffed then
		ESX.UI.Menu.CloseAll()
		Citizen.Wait(700)
		else
		Citizen.Wait(1500)
		end
		
end
end)
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		
		if IsHandcuffed then
		Citizen.Wait(1500)
		ESX.ShowNotification('~r~[Masz na sobie kajdanki]')
		else
		Citizen.Wait(2500)
		end
		
end
end)


Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1)
		local playerPed = PlayerPedId()

		if IsHandcuffed then
			
			DisableControlAction(2, 24, true) 
			DisableControlAction(2, 257, true) 
			DisableControlAction(2, 25, true) 
			DisableControlAction(2, 263, true) 
			DisableControlAction(2, Keys['R'], true)
			DisableControlAction(0, 140, true) 
			DisableControlAction(2, Keys['TOP'], true) 
			DisableControlAction(2, Keys['SPACE'], true) 
			DisableControlAction(2, Keys['Q'], true) 
			DisableControlAction(2, Keys['TAB'], true) 
			DisableControlAction(2, Keys['P'], true) 
			DisableControlAction(2, 59, true) 
			DisableControlAction(2, Keys['LEFTCTRL'], true)
		    DisableControlAction(0, Keys['X'], true)
		    DisableControlAction(0, Keys['B'], true)
			DisableControlAction(0, Keys['F2'], true)  
			DisableControlAction(0, Keys['F1'], true)  
			DisableControlAction(0, Keys['F3'], true)  
			DisableControlAction(0, Keys['F5'], true)  
			DisableControlAction(0, Keys['F4'], true) 
			DisableControlAction(0, Keys['F6'], true)
			DisableControlAction(0, Keys['M'], true)
			DisableControlAction(0, 23, true) 
			DisableControlAction(2, 23, true)
			DisableControlAction(1, 23, true)
			DisableControlAction(0, 75, true)  -- Disable exit vehicle
			DisableControlAction(27, 75, true) -- Disable exit vehicle
			
			
			if IsEntityPlayingAnim(playerPed, 'mp_arresting', 'idle', 3) ~= 1 then
				Citizen.Wait(3000)
				ESX.Streaming.RequestAnimDict('mp_arresting', function()
				TaskPlayAnim(playerPed, 'mp_arresting', 'idle', 8.0, -8, -1, 49, 0.0, false, false, false)
				end)
			end
			
			
		else
			Citizen.Wait(500)
		end
		
		
	end
end)
AddEventHandler('esx:onPlayerDeath', function(data)
	isDead = true
end)
function StartHandcuffTimer()
	if Config.EnableHandcuffTimer and HandcuffTimer.Active then
		ESX.ClearTimeout(HandcuffTimer.Task)
	end

	HandcuffTimer.Active = true

	HandcuffTimer.Task = ESX.SetTimeout(Config.HandcuffTimer, function()
		ESX.ShowNotification('~y~Kajdanki sie poluzowały')
		TriggerEvent('bestup_kajdanki:unrestrain')
		HandcuffTimer.Active = false
	end)
end
RegisterNetEvent('bestup_kajdanki2:PlayWithinDistance')
AddEventHandler('bestup_kajdanki2:PlayWithinDistance', function(playerNetId, maxDistance, soundFile, soundVolume)
    local lCoords = GetEntityCoords(GetPlayerPed(-1))
    local eCoords = GetEntityCoords(GetPlayerPed(GetPlayerFromServerId(playerNetId)))
    local distIs  = Vdist(lCoords.x, lCoords.y, lCoords.z, eCoords.x, eCoords.y, eCoords.z)
    if(distIs <= maxDistance) then
        SendNUIMessage({
            transactionType     = 'playSound',
            transactionFile     = soundFile,
            transactionVolume   = soundVolume
        })
    end
end)


zakuwam = false
Citizen.CreateThread(function ()
	while true do 
		Citizen.Wait(0)
		if IsControlPressed(0, 19) and IsControlPressed(0, 74) then
			if not zakuwam then
				zakuwam = true
				if not IsHandcuffed then
					if not IsPedInAnyVehicle(GetPlayerPed(-1),  true) then
						if GetEntityHealth(GetPlayerPed(-1)) > 1 then
							if PlayerData.job.name ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'mafia' or PlayerData.job.name == 'vagos' or PlayerData.job.name == 'ballas' or PlayerData.job.name == 'bikers' or PlayerData.job.name == 'familia') then
								local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
								if closestPlayer == -1 or closestDistance > 3.0 then
									ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
								else
									if IsPedStill(GetPlayerPed(-1)) then
										local closestPlayerPed = GetPlayerPed(closestPlayer)
							            local health = GetEntityHealth(closestPlayerPed)
							            if health < 1 then
							            	TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(closestPlayer))
							            	Citizen.Wait(3000)
							            	zakuwam = false
							            else
											TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(closestPlayer))
											TriggerServerEvent('bestup_kajdanki:PlayWithinDistance', 1.5, 'cuff', 1.0)
											RequestAnimDict('mp_arrest_paired')
											while not HasAnimDictLoaded('mp_arrest_paired') do
												Citizen.Wait(10)
											end
											--
											AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
											TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
											Citizen.Wait(3000)
											ClearPedTasks(GetPlayerPed(-1))
											DetachEntity(GetPlayerPed(-1))
											zakuwam = false
										end
									else
										ESX.ShowNotification('~y~Nie możesz zakuć podczas poruszania się')
										zakuwam = false
									end
								end
							else
								ESX.TriggerServerCallback('bestup_kajdanki:get_amount', function(quantity)
									if quantity > 0 then			
										local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()			
										if closestPlayer == -1 or closestDistance > 3.0 then
											ESX.ShowNotification('~y~Nie ma nikogo w pobliżu')
										else
											if IsPedStill(GetPlayerPed(-1)) then
												local closestPlayerPed = GetPlayerPed(closestPlayer)
									            local health = GetEntityHealth(closestPlayerPed)
									            if health < 1 then
									            	TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(closestPlayer))
									            	Citizen.Wait(3000)
									            	zakuwam = false
									            else
													TriggerServerEvent("bestup_kajdanki:handcuff", GetPlayerServerId(closestPlayer))
													TriggerServerEvent('bestup_kajdanki:PlayWithinDistance', 1.5, 'cuff', 1.0)
													RequestAnimDict('mp_arrest_paired')
													while not HasAnimDictLoaded('mp_arrest_paired') do
														Citizen.Wait(10)
													end
													AttachEntityToEntity(GetPlayerPed(-1), GetPlayerPed(closestPlayer), 11816, 0.0, -0.6, 0.0, 0.0, 0.0, 0.0, false, false, false, false, 2, false)
													TaskPlayAnim(GetPlayerPed(-1), 'mp_arrest_paired', 'cop_p2_back_left', 8.0, 8.0, -1, 40, 0, 0, 0, 0)
													Citizen.Wait(3000)
													ClearPedTasks(GetPlayerPed(-1))
													DetachEntity(GetPlayerPed(-1))
													zakuwam = false
												end
											else
												ESX.ShowNotification('~y~Nie możesz zakuć podczas poruszania się')
												zakuwam = false
											end
										end
									else
										zakuwam = false
									end
								end, "handcuffs")
							end
						else
							zakuwam = false
						end
					else
						zakuwam = false
					end
				else
					zakuwam = false
				end
			end
		end
	end
end)




Citizen.CreateThread(function()
    local dict = "missminuteman_1ig_2"
  	RequestAnimDict(dict)
    local handsup = false
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 243) then --Start holding X
			if IsHandcuffed then
				Citizen.Wait(500)
			else
				ClearPedTasks(PlayerPedId())
				TaskPlayAnim(GetPlayerPed(-1), dict, "handsup_enter", 8.0, 8.0, -1, 50, 0, false, false, false)
				handsup = true
			end
		end
	end

end)
radio_anim = false
Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 56) then
			if not IsHandcuffed then
				if PlayerData.job ~= nil and (PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mafia' or PlayerData.job.name == 'vagos' or PlayerData.job.name == 'ballas' or PlayerData.job.name == 'bikers' or PlayerData.job.name == 'mecano') then
					radio_anim = true
					ClearPedTasks(GetPlayerPed(-1))
					RequestAnimDict("random@arrests")
					while not HasAnimDictLoaded("random@arrests") do
						Citizen.Wait(10)
					end
					TaskPlayAnim(GetPlayerPed(-1), "random@arrests", "generic_radio_chatter", 8.0, -8, -1, 49, 0, 0, 0, 0)
				end
			end
		end
	end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsControlJustPressed(0, 56) then
			if not IsHandcuffed then
				if PlayerData.job ~= nil and (PlayerData.job.name == 'police') then
					ESX.TriggerServerCallback('bestup_kajdanki:get_amount', function(quantity)
						if quantity > 0 then
							radio_anim = true
							ClearPedTasks(GetPlayerPed(-1))
							RequestAnimDict("random@arrests")
							while not HasAnimDictLoaded("random@arrests") do
								Citizen.Wait(10)
							end
							TaskPlayAnim(GetPlayerPed(-1), "random@arrests", "generic_radio_chatter", 8.0, -8, -1, 49, 0, 0, 0, 0)
						end
					end, "radio")
				end
			end
		end
	end
end)

Citizen.CreateThread(function ()
	while true do
		Citizen.Wait(0)
		if IsControlJustReleased(0, 56) then
			if not IsHandcuffed then
				if PlayerData.job ~= nil and (PlayerData.job.name == 'police' or PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'mafia' or PlayerData.job.name == 'vagos' or PlayerData.job.name == 'ballas' or PlayerData.job.name == 'bikers' or PlayerData.job.name == 'mecano') then
					if radio_anim then
						ClearPedTasks(GetPlayerPed(-1))
						radio_anim = false
					end
				end
			end
		end	
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