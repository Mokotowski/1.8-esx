ESX = nil

local PlayerData = {}
local InventoryData = {}
local ScriptData = {
	isSelling = false,
	timeLeft = 0,
	lspdCount = 1,
	hasDrugs = true,
	lastPed = nil,
	prop = nil,
	prop2 = nil,
	prop3 = nil
}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(10)
	end
	while ESX.GetPlayerData().job == nil do
		Citizen.Wait(10)
	end
	RequestAnimDict('misscarsteal4@actor')
	RequestAnimDict('mp_ped_interaction')
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)


RegisterNetEvent('mk_selldrugs:photoMessage')
AddEventHandler('mk_selldrugs:photoMessage', function(id)
  local myId = PlayerId()
  local pid = GetPlayerFromServerId(id)
  if pid == myId then
  	TriggerEvent('chatMessage',"^*Obywatel zrobił Ci zdjęcie!", {255, 152, 247})
  end
end)


Citizen.CreateThread(function()
	print('[Mokotowski-DRUGS]')
	while true do
		Citizen.Wait(5)
		if not IsJobBlocked() then
			if IsControlJustReleased(0, 51) then
				if not (ScriptData.isSelling) then
				local ez  = 0
				ESX.TriggerServerCallback('count:policeeee', function(_ez)
					 ez = _ez
					 local handle, _pedHandle = FindFirstPed()
					 local success
					 repeat
						 success, _pedHandle = FindNextPed(handle)
							 if not IsPedAPlayer(_pedHandle) then
								 if not IsPedInAnyVehicle(_pedHandle, false) then            
									 if not IsPedDeadOrDying(_pedHandle) then
									 
										 if GetDistanceBetweenCoords(GetEntityCoords(PlayerPedId()), GetEntityCoords(_pedHandle), true) < 0.8 then
											 if (ScriptData.lastPed ~= _pedHandle) then
												 local thisped = _pedHandle
												 if (ScriptData.hasDrugs == true)  then
													 ESX.TriggerServerCallback('mk_selldrugs:checkDrugs', function(cb)
														 if ez >=0 then 
														 if cb == 1 then
															 math.randomseed(math.random(0, 9999999999999))
															 if (math.random(0, 100) >= 20) then
																 SellDrugs(thisped, ScriptData.lspdCount)
															 else
																 FailSellDrugs(thisped)
															 end
														 elseif cb == 2 then
															 ESX.ShowNotification('~r~Nie ma wystarczającej liczby policjantów na służbie')
															 Citizen.Wait(5000)
														 elseif cb == 3 then
															 ESX.ShowNotification('~r~Nie masz przy sobie wystarczająco narkotyków')
															 Citizen.Wait(5000)
														 end
													 else 
														 ESX.ShowNotification('~r~Nie ma wystarczającej liczby policjantów na służbie')
 
													 end 
													 end, ScriptData.lspdCount)											
												 else
													 Citizen.Wait(5000)
												 end
											 else
												 Citizen.Wait(5000)
											 end
										 end
 
									 end
								 end
							 end
						 
					 until not success
					 EndFindPed(handle)

				end)
			
				else
					Citizen.Wait(500)
				end
			end
		else
			Citizen.Wait(500)
		end
	end
end)

IsJobBlocked = function()
	local found = false
	if PlayerData.job ~= nil then
		for i=1, #Config.BlockedJobs, 1 do
			if PlayerData.job.name == Config.BlockedJobs[i] then
				found = true
				break
			end
		end
	end
	return found
end

IsItemDrug = function(itemName)
	if PlayerData.job ~= nil then
		for i=1, #Config.AllowedDrugs, 1 do
			if itemName == Config.AllowedDrugs[i] then
				return true
			end
		end
	end
	return false
end

SellDrugs = function(targetPed, lspdCount)
	local playerPed = GetPlayerPed(-1)

	if ScriptData.isSelling then
		return
	end

	ScriptData.lastPed = targetPed

	SetEntityAsMissionEntity(targetPed, true, true)	
	SetEntityInFrontOfPlayer(ScriptData.lastPed, playerPed)

	FreezeEntityPosition(ScriptData.lastPed, true)
	FreezeEntityPosition(playerPed, true)

	SellAnim(playerPed, ScriptData.lastPed)

	-- Check if timer goes 0
	while ScriptData.timeLeft ~= 0 do
		if (ScriptData.isSelling == false and ScriptData.timeLeft == 0) then
			return
		end
		
		if ScriptData.timeLeft < 0 then
			ScriptData.timeLeft = 0
		end
		Citizen.Wait(50)
	end
	TriggerServerEvent('mk_selldrugs:sell', lspdCount)
end

FailSellDrugs = function(targetPed)
	local playerPed = GetPlayerPed(-1)

	if ScriptData.isSelling then
		return
	end

	ScriptData.lastPed = targetPed

	SetEntityAsMissionEntity(targetPed, true, true)	
	SetEntityInFrontOfPlayer(ScriptData.lastPed, playerPed)

	FreezeEntityPosition(ScriptData.lastPed, true)
	FreezeEntityPosition(playerPed, true)

	SellAnim(playerPed, ScriptData.lastPed)
	while ScriptData.timeLeft ~= 0 do
		if (ScriptData.isSelling == false and ScriptData.timeLeft == 0) then
			return
		end
		if ScriptData.timeLeft < 0 then
			ScriptData.timeLeft = 0
		end
		Citizen.Wait(50)
	end
	
	ScriptData.lastPed = targetPed
	TriggerEvent('mk_selldrugs:stopSell', 2)
end

SellAnim = function(localPed, targetPed)
	ScriptData.timeLeft = Config.TimeToSell
	ScriptData.isSelling = true
	PlayAnim('misscarsteal4@actor', 'assistant_berated', 10000, localPed)
	PlayAnim('misscarsteal4@actor', 'assistant_loop', 10000, targetPed)	
end

SetEntityInFrontOfPlayer = function(targetPed, playerPed)
	local playerPedCoords = GetEntityCoords(playerPed)
	local forward   = GetEntityForwardVector(playerPed)	
	local heading = GetEntityHeading(playerPed)
	local newheading = 0

	if(heading >= 180) then
		newheading = heading - 180.0
	else
		newheading = heading + 180.0
	end

	xDFF, yDFF, zDFF   = table.unpack(playerPedCoords + forward * 1.19)

	SetEntityCoords(targetPed, xDFF, yDFF, zDFF-1, false, false, false, false)
	SetEntityHeading(targetPed, newheading)
end

PlayAnim = function(ad, anim, dur, ped)
	local player = ped	

	if ScriptData.isSelling == true then
		TaskPlayAnim( player, ad, anim, 1.0, 1.0, dur, 0, 0.0, 0, 0, 0 )
	end
end

function faceNotification(title, subject, msg, playerID)
  local mugshot, mugshotStr = ESX.Game.GetPedMugshot(GetPlayerPed(GetPlayerFromServerId(playerID)))
  ESX.ShowAdvancedNotification(title, subject, msg, mugshotStr, 1)
  UnregisterPedheadshot(mugshot)
end

RegisterNetEvent('notifyc')
AddEventHandler('notifyc', function(sourceID)
	local title = "Centrala"
	local subject = "Anonim"
	local msg = "Osoba na zdjęciu chciała sprzedać mi narkotyki!"
	faceNotification(title,subject,msg,sourceID)
end)

RegisterNetEvent('mk_selldrugs:stopSell')
AddEventHandler('mk_selldrugs:stopSell', function(soldInt, soldString)
	local playerPed = GetPlayerPed(-1)
	local targetPed = ScriptData.lastPed

	ScriptData.isSelling = false
	ScriptData.timeLeft = 100
	ClearPedTasksImmediately(playerPed)
	ClearPedTasksImmediately(targetPed)
	Citizen.Wait(300)
	
	if soldInt == 1 then
		TaskPlayAnim(playerPed, 'mp_ped_interaction', 'handshake_guy_a', 8.0, -8.0, -1, 0, 0, false, false, false)
		TaskPlayAnim(targetPed, 'mp_ped_interaction', 'handshake_guy_a', 8.0, -8.0, -1, 0, 0, false, false, false)
		Citizen.Wait(1500)
	end

	FreezeEntityPosition(playerPed, false)
	FreezeEntityPosition(targetPed, false)
	ClearPedTasksImmediately(playerPed)
	ClearPedTasksImmediately(targetPed)

	DeleteObject(ScriptData.prop)
	DeleteObject(ScriptData.prop2)
	DeleteObject(ScriptData.prop3)

	SetEntityAsNoLongerNeeded(targetPed)
	
	if soldInt == 0 then
		ScriptData.timeLeft = 0
		ESX.ShowNotification('~b~Przerwano sprzedaż!')
	elseif soldInt == 1 then
		ESX.ShowNotification('~b~Sprzedano ' .. soldString)
	elseif soldInt == 2 then
		local notify = math.random(1,3)
		if notify == 1 then
			local coords = GetEntityCoords(playerPed)
			local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
			-- Zamień na funkcję na /do, która pojawi się na czacie
			TriggerEvent('mk_selldrugs:photoMessage', GetPlayerServerId(PlayerId()))
			TriggerServerEvent('mk_selldrugs:triggerDispatch', coords, street, true)
			ESX.ShowNotification('~b~Osoba nie jest zainteresowana')
		elseif notify == 2 then
			local coords = GetEntityCoords(playerPed)
			local street = GetStreetNameFromHashKey(GetStreetNameAtCoord(coords.x, coords.y, coords.z))
			TriggerServerEvent('mk_selldrugs:triggerDispatch', coords, street, false)
			ESX.ShowNotification('~b~Osoba nie jest zainteresowana')
		elseif notify == 3 then
			ESX.ShowNotification('~b~Osoba nie jest zainteresowana')
		end
	end
end)

Citizen.CreateThread(function()
	while true do
		Citizen.Wait(1000)

		if ScriptData.isSelling then
			if ScriptData.timeLeft > 1 then
				ScriptData.timeLeft = (ScriptData.timeLeft-1)
				ESX.ShowNotification('~b~Trwa sprzedaż ~o~')
			else
				ScriptData.timeLeft = 0
			end
		end
	end
end)

RegisterNetEvent('mk_selldrugs:showNotify')
AddEventHandler('mk_selldrugs:showNotify', function(pos, street, msg)
	if PlayerData.job ~= nil and (PlayerData.job.name == 'police') then
		--[[TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw;  margin: 0.5vw; background-color: rgba(29, 9, 38, 0.7); color: white; border-radius: 3px;"><i class="fas fa-phone"style="font-size:15px;color:rgb(255,255,255,0.5)"> <font color="#FFFFFF">{0}</font>&ensp;<font color="white">{1}</font></div>',
			args = { "", msg}
		})]]
		TriggerEvent("chatMessage", '^0[^3Centrala^0]', { 0, 0, 0 }, msg)
	  
		local opacity = 250
		local blip = AddBlipForCoord(pos.x, pos.y, pos.z)

		SetBlipSprite(blip,  51)
		SetBlipColour(blip,  30)
		SetBlipAlpha(blip,  opacity)
		SetBlipAsShortRange(blip, false)
		SetBlipScale(blip, 0.8)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('# Narkotyki')
		EndTextCommandSetBlipName(blip)
		
		PlaySoundFrontend(-1, "HACKING_CLICK_GOOD", 0, 1)

		Citizen.Wait(60000)

		while opacity ~= 0 do
			Wait(30*4)
			opacity = opacity - 1

			SetBlipAlpha(blip, opacity)

			if opacity == 0 then
				RemoveBlip(blip)
				break
			end
		end		   
	end
end)