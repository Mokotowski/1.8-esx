local pickups = {}

CreateThread(function()
	while not Config.Multichar do
		Wait(0)
		if NetworkIsPlayerActive(PlayerId()) then
			exports.spawnmanager:setAutoSpawn(false)
			DoScreenFadeOut(0)
			Wait(500)
			TriggerServerEvent('esx:onPlayerJoined')
			break
		end
	end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer, isNew, skin)
	ESX.PlayerLoaded = true
	ESX.PlayerData = xPlayer

	FreezeEntityPosition(PlayerPedId(), true)

	if Config.Multichar then
		Wait(3000)
	else
		exports.spawnmanager:spawnPlayer({
			x = ESX.PlayerData.coords.x,
			y = ESX.PlayerData.coords.y,
			z = ESX.PlayerData.coords.z + 0.25,
			heading = ESX.PlayerData.coords.heading,
			model = GetHashKey("mp_m_freemode_01"),
			skipFade = false
		}, function()
			TriggerServerEvent('esx:onPlayerSpawn')
			TriggerEvent('esx:onPlayerSpawn')
			TriggerEvent('esx:restoreLoadout')

			if isNew then
				TriggerEvent('skinchanger:loadDefaultModel', skin.sex == 0)
			elseif skin then
				TriggerEvent('skinchanger:loadSkin', skin)
			end

			TriggerEvent('esx:loadingScreenOff')
			ShutdownLoadingScreen()
			ShutdownLoadingScreenNui()
			FreezeEntityPosition(ESX.PlayerData.ped, false)
		end)
	end

	while ESX.PlayerData.ped == nil do Wait(20) end
	-- enable PVP
	if Config.EnablePVP then
		SetCanAttackFriendly(ESX.PlayerData.ped, true, false)
		NetworkSetFriendlyFireOption(true)
	end

	if Config.DisableHealthRegen then
		SetPlayerHealthRechargeMultiplier(PlayerId(), 0.0)
	end

	if Config.EnableHud then
		for k,v in ipairs(ESX.PlayerData.accounts) do
			local accountTpl = '<div><img src="img/accounts/' .. v.name .. '.png"/>&nbsp;{{money}}</div>'
			ESX.UI.HUD.RegisterElement('account_' .. v.name, k, 0, accountTpl, {money = ESX.Math.GroupDigits(v.money)})
		end

		local jobTpl = '<div>{{job_label}}{{grade_label}}</div>'

		local gradeLabel = ESX.PlayerData.job.grade_label ~= ESX.PlayerData.job.label and ESX.PlayerData.job.grade_label or ''
		if gradeLabel ~= '' then gradeLabel = ' - '..gradeLabel end

		ESX.UI.HUD.RegisterElement('job', #ESX.PlayerData.accounts, 0, jobTpl, {
			job_label = ESX.PlayerData.job.label,
			grade_label = gradeLabel
		})
	end

	FreezeEntityPosition(PlayerPedId(), false)
	StartServerSyncLoops()
end)

RegisterNetEvent('esx:onPlayerLogout')
AddEventHandler('esx:onPlayerLogout', function()
	ESX.PlayerLoaded = false
	if Config.EnableHud then ESX.UI.HUD.Reset() end
end)

RegisterNetEvent('esx:setMaxWeight')
AddEventHandler('esx:setMaxWeight', function(newMaxWeight) ESX.PlayerData.maxWeight = newMaxWeight end)

local function onPlayerSpawn()
	if ESX.PlayerLoaded then
		ESX.SetPlayerData('ped', PlayerPedId())
		ESX.SetPlayerData('dead', false)
	end
end

AddEventHandler('playerSpawned', onPlayerSpawn)
AddEventHandler('esx:onPlayerSpawn', onPlayerSpawn)

AddEventHandler('esx:onPlayerDeath', function()
	ESX.SetPlayerData('ped', PlayerPedId())
	ESX.SetPlayerData('dead', true)
end)

AddEventHandler('skinchanger:modelLoaded', function()
	while not ESX.PlayerLoaded do
		Wait(100)
	end
	TriggerEvent('esx:restoreLoadout')
end)

AddEventHandler('esx:restoreLoadout', function()
	ESX.SetPlayerData('ped', PlayerPedId())

	if not Config.OxInventory then
		local ammoTypes = {}
		RemoveAllPedWeapons(ESX.PlayerData.ped, true)

		for k,v in ipairs(ESX.PlayerData.loadout) do
			local weaponName = v.name
			local weaponHash = GetHashKey(weaponName)

			GiveWeaponToPed(ESX.PlayerData.ped, weaponHash, 0, false, false)
			SetPedWeaponTintIndex(ESX.PlayerData.ped, weaponHash, v.tintIndex)

			local ammoType = GetPedAmmoTypeFromWeapon(ESX.PlayerData.ped, weaponHash)

			for k2,v2 in ipairs(v.components) do
				local componentHash = ESX.GetWeaponComponent(weaponName, v2).hash
				GiveWeaponComponentToPed(ESX.PlayerData.ped, weaponHash, componentHash)
			end

			if not ammoTypes[ammoType] then
				AddAmmoToPed(ESX.PlayerData.ped, weaponHash, v.ammo)
				ammoTypes[ammoType] = true
			end
		end
	end
end)

RegisterNetEvent('esx:setAccountMoney')
AddEventHandler('esx:setAccountMoney', function(account)
	for k,v in ipairs(ESX.PlayerData.accounts) do
		if v.name == account.name then
			ESX.PlayerData.accounts[k] = account
			break
		end
	end

	ESX.SetPlayerData('accounts', ESX.PlayerData.accounts)

	if Config.EnableHud then
		ESX.UI.HUD.UpdateElement('account_' .. account.name, {
			money = ESX.Math.GroupDigits(account.money)
		})
	end
end)





function ESX.ShowInventory()
	local playerPed = ESX.PlayerData.ped
	local elements, currentWeight = {}, 0
	ESX.TriggerServerCallback("OsloRP:getSims", function(result)




		table.insert(elements, {
			label     = 'Praca: ' .. ESX.PlayerData.job.label .. ' - ' .. ESX.PlayerData.job.grade_label
	  })





	  for k,v in pairs(ESX.PlayerData.accounts) do
		if v.money > 0 then
		local formattedMoney = _U('locale_currency', ESX.Math.GroupDigits(v.money))
			local canDrop = v.name ~= 'bank'
			if v.name == 'money' then 
			table.insert(elements, {
				label = ('%s: <span style="color:green;">%s</span>'):format(v.label, formattedMoney),
				count = v.money,
				type = 'item_account',
				value = v.name,
				usable = false,
				rare = false,
				canRemove = canDrop
			})


			elseif v.name == 'black_money' then 

				table.insert(elements, {
					label = ('%s: <span style="color:red;">%s</span>'):format(v.label, formattedMoney),
					count = v.money,
					type = 'item_account',
					value = v.name,
					usable = false,
					rare = false,
					canRemove = canDrop
				})

			end
		end
	end

	table.insert(elements, {
		label     = '<span style="color:#f5f5f5;">- - - Karty SIM - - -</span>',
  })


	for key, value in pairs(result) do
		if result[key].property == nil then
			table.insert(elements, {
				label     = result[key].label,
				count     = 1,
				type 	  = "item_sim",
				name 	  = 'sim',
				usable    = true,
				rare      = false,
				canRemove = true
			})
		end
	end 


	table.insert(elements, {
		label     = '<span style="color:#f5f5f5;">- - - Itemy - - -</span>',
  })
  
	for k,v in ipairs(ESX.PlayerData.inventory) do
		if v.count > 0 then
			currentWeight = currentWeight + (v.weight * v.count)

			table.insert(elements, {
				label = ('%s x%s'):format(v.label, v.count),
				count = v.count,
				type = 'item_standard',
				value = v.name,
				usable = v.usable,
				rare = v.rare,
				canRemove = v.canRemove
			})
		end
	end



	ESX.UI.Menu.CloseAll()

	ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'inventory', {
		title    = _U('inventory', currentWeight, ESX.PlayerData.maxWeight),
		align    = 'bottom-right',
		elements = elements
	}, function(data, menu)
		menu.close()
		local player, distance = ESX.Game.GetClosestPlayer()
		elements = {}

		if data.current.usable then
			table.insert(elements, {label = _U('use'), action = 'use', type = data.current.type, value = data.current.value})
		end

		if data.current.canRemove then
			if player ~= -1 and distance <= 3.0 then
				table.insert(elements, {label = _U('give'), action = 'give', type = data.current.type, value = data.current.value})
			end

			table.insert(elements, {label = _U('remove'), action = 'remove', type = data.current.type, value = data.current.value})
		end


		table.insert(elements, {label = _U('return'), action = 'return'})

		ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'inventory_item', {
			title    = data.current.label,
			align    = 'bottom-right',
			elements = elements,
		}, function(data1, menu1)
			local item, type = data1.current.value, data1.current.type

			if data1.current.action == 'give' then
				local playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)

				if #playersNearby > 0 then
					local players = {}
					elements = {}

					for k,playerNearby in ipairs(playersNearby) do
						players[GetPlayerServerId(playerNearby)] = true
					end

					ESX.TriggerServerCallback('esx:getPlayerNames', function(returnedPlayers)
						for playerId,playerName in pairs(returnedPlayers) do
							table.insert(elements, {
								label = playerName,
								playerId = playerId
							})
						end

						ESX.UI.Menu.Open('default', GetCurrentResourceName(), 'give_item_to', {
							title    = _U('give_to'),
							align    = 'bottom-right',
							elements = elements
						}, function(data2, menu2)
							local selectedPlayer, selectedPlayerId = GetPlayerFromServerId(data2.current.playerId), data2.current.playerId
							playersNearby = ESX.Game.GetPlayersInArea(GetEntityCoords(playerPed), 3.0)
							playersNearby = ESX.Table.Set(playersNearby)

							if playersNearby[selectedPlayer] then
								local selectedPlayerPed = GetPlayerPed(selectedPlayer)

								if IsPedOnFoot(selectedPlayerPed) and not IsPedFalling(selectedPlayerPed) then
									if type == 'item_weapon' then
							
									else
										ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'inventory_item_count_give', {
											title = _U('amount')
										}, function(data3, menu3)
											local quantity = tonumber(data3.value)

											if quantity and quantity > 0 and data.current.count >= quantity then
												TriggerServerEvent('esx:giveInventoryItem', selectedPlayerId, type, item, quantity)
												menu3.close()
												menu2.close()
												menu1.close()
											else
												ESX.ShowNotification(_U('amount_invalid'))
											end
										end, function(data3, menu3)
											menu3.close()
										end)
									end
								else
									ESX.ShowNotification(_U('in_vehicle'))
								end
							else
								ESX.ShowNotification(_U('players_nearby'))
								menu2.close()
							end
						end, function(data2, menu2)
							menu2.close()
						end)
					end, players)
				else
					ESX.ShowNotification(_U('players_nearby'))
				end
			elseif data1.current.action == 'remove' then
				if IsPedOnFoot(playerPed) and not IsPedFalling(playerPed) then
					local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
					ESX.Streaming.RequestAnimDict(dict)

					if type == 'item_weapon' then

					else
						ESX.UI.Menu.Open('dialog', GetCurrentResourceName(), 'inventory_item_count_remove', {
							title = _U('amount')
						}, function(data2, menu2)
							local quantity = tonumber(data2.value)

							if quantity and quantity > 0 and data.current.count >= quantity then
								menu2.close()
								menu1.close()
								TaskPlayAnim(playerPed, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
								RemoveAnimDict(dict)
								Wait(1000)
								TriggerServerEvent('esx:removeInventoryItem', type, item, quantity)
							else
								ESX.ShowNotification(_U('amount_invalid'))
							end
						end, function(data2, menu2)
							menu2.close()
						end)
					end
				end
			elseif data1.current.action == 'use' then
				if type == 'item_sim' then
					TriggerServerEvent("neey_sim:useSIM", label)
				else
					TriggerServerEvent('esx:useItem', item)
				end
			elseif data1.current.action == 'return' then
				ESX.UI.Menu.CloseAll()
				ESX.ShowInventory()
			
			end
		end, function(data1, menu1)
			ESX.UI.Menu.CloseAll()
			ESX.ShowInventory()
		end)
	end, function(data, menu)
		menu.close()
	end)




	end, GetPlayerServerId(PlayerId()))

end



if not Config.OxInventory then
	RegisterNetEvent('esx:addInventoryItem')
	AddEventHandler('esx:addInventoryItem', function(item, count, showNotification)
		for k,v in ipairs(ESX.PlayerData.inventory) do
			if v.name == item then
				ESX.UI.ShowInventoryItemNotification(true, v.label, count - v.count)
				ESX.PlayerData.inventory[k].count = count
				break
			end
		end

		if showNotification then
			ESX.UI.ShowInventoryItemNotification(true, item, count)
		end


	end)

	RegisterNetEvent('esx:removeInventoryItem')
	AddEventHandler('esx:removeInventoryItem', function(item, count, showNotification)
		for k,v in ipairs(ESX.PlayerData.inventory) do
			if v.name == item then
				ESX.UI.ShowInventoryItemNotification(false, v.label, v.count - count)
				ESX.PlayerData.inventory[k].count = count
				break
			end
		end

		if showNotification then
			ESX.UI.ShowInventoryItemNotification(false, item, count)
		end


	end)

	RegisterNetEvent('esx:addWeapon')
	AddEventHandler('esx:addWeapon', function(weapon, ammo)
		GiveWeaponToPed(ESX.PlayerData.ped, GetHashKey(weapon), ammo, false, false)
	end)

	RegisterNetEvent('esx:addWeaponComponent')
	AddEventHandler('esx:addWeaponComponent', function(weapon, weaponComponent)
		local componentHash = ESX.GetWeaponComponent(weapon, weaponComponent).hash
		GiveWeaponComponentToPed(ESX.PlayerData.ped, GetHashKey(weapon), componentHash)
	end)

	RegisterNetEvent('esx:setWeaponAmmo')
	AddEventHandler('esx:setWeaponAmmo', function(weapon, weaponAmmo)
		SetPedAmmo(ESX.PlayerData.ped, GetHashKey(weapon), weaponAmmo)
	end)

	RegisterNetEvent('esx:setWeaponTint')
	AddEventHandler('esx:setWeaponTint', function(weapon, weaponTintIndex)
		SetPedWeaponTintIndex(ESX.PlayerData.ped, GetHashKey(weapon), weaponTintIndex)
	end)

	RegisterNetEvent('esx:removeWeapon')
	AddEventHandler('esx:removeWeapon', function(weapon)
		local playerPed = ESX.PlayerData.ped
		RemoveWeaponFromPed(ESX.PlayerData.ped, GetHashKey(weapon))
		SetPedAmmo(ESX.PlayerData.ped, GetHashKey(weapon), 0)
	end)

	RegisterNetEvent('esx:removeWeaponComponent')
	AddEventHandler('esx:removeWeaponComponent', function(weapon, weaponComponent)
		local componentHash = ESX.GetWeaponComponent(weapon, weaponComponent).hash
		RemoveWeaponComponentFromPed(ESX.PlayerData.ped, GetHashKey(weapon), componentHash)
	end)
end

RegisterNetEvent('esx:teleport')
AddEventHandler('esx:teleport', function(coords)
	ESX.Game.Teleport(ESX.PlayerData.ped, coords)
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(Job)
	if Config.EnableHud then
		local gradeLabel = Job.grade_label ~= Job.label and Job.grade_label or ''
		if gradeLabel ~= '' then gradeLabel = ' - '..gradeLabel end
		ESX.UI.HUD.UpdateElement('job', {
			job_label = Job.label,
			grade_label = gradeLabel
		})
	end
	ESX.SetPlayerData('job', Job)
end)

RegisterNetEvent('esx:spawnVehicle')
AddEventHandler('esx:spawnVehicle', function(vehicle)
	ESX.TriggerServerCallback("esx:isUserAdmin", function(admin)
		if admin then
			local model = (type(vehicle) == 'number' and vehicle or GetHashKey(vehicle))

			if IsModelInCdimage(model) then
				local playerCoords, playerHeading = GetEntityCoords(ESX.PlayerData.ped), GetEntityHeading(ESX.PlayerData.ped)

				ESX.Game.SpawnVehicle(model, playerCoords, playerHeading, function(vehicle)
					TaskWarpPedIntoVehicle(ESX.PlayerData.ped, vehicle, -1)
				end)
			else
				ESX.ShowNotification('Invalid vehicle model.')
			end
		end
	end)
end)

if not Config.OxInventory then
	RegisterNetEvent('esx:createPickup')
	AddEventHandler('esx:createPickup', function(pickupId, label, coords, type, name, components, tintIndex)
		local function setObjectProperties(object)
			SetEntityAsMissionEntity(object, true, false)
			PlaceObjectOnGroundProperly(object)
			FreezeEntityPosition(object, true)
			SetEntityCollision(object, false, true)

			pickups[pickupId] = {
				obj = object,
				label = label,
				inRange = false,
				coords = vector3(coords.x, coords.y, coords.z)
			}
		end

		if type == 'item_weapon' then
			local weaponHash = GetHashKey(name)
			ESX.Streaming.RequestWeaponAsset(weaponHash)
			local pickupObject = CreateWeaponObject(weaponHash, 50, coords.x, coords.y, coords.z, true, 1.0, 0)
			SetWeaponObjectTintIndex(pickupObject, tintIndex)

			for k,v in ipairs(components) do
				local component = ESX.GetWeaponComponent(name, v)
				GiveWeaponComponentToWeaponObject(pickupObject, component.hash)
			end

			setObjectProperties(pickupObject)
		else
			ESX.Game.SpawnLocalObject('prop_money_bag_01', coords, setObjectProperties)
		end
	end)

	RegisterNetEvent('esx:createMissingPickups')
	AddEventHandler('esx:createMissingPickups', function(missingPickups)
		for pickupId, pickup in pairs(missingPickups) do
			TriggerEvent('esx:createPickup', pickupId, pickup.label, pickup.coords - vector3(0,0, 1.0), pickup.type, pickup.name, pickup.components, pickup.tintIndex)
		end
	end)
end

RegisterNetEvent('esx:registerSuggestions')
AddEventHandler('esx:registerSuggestions', function(registeredCommands)
	for name,command in pairs(registeredCommands) do
		if command.suggestion then
			TriggerEvent('chat:addSuggestion', ('/%s'):format(name), command.suggestion.help, command.suggestion.arguments)
		end
	end
end)

if not Config.OxInventory then
	RegisterNetEvent('esx:removePickup')
	AddEventHandler('esx:removePickup', function(pickupId)
		if pickups[pickupId] and pickups[pickupId].obj then
			ESX.Game.DeleteObject(pickups[pickupId].obj)
			pickups[pickupId] = nil
		end
	end)
end

RegisterNetEvent('esx:deleteVehicle')
AddEventHandler('esx:deleteVehicle', function(radius)
	if radius and tonumber(radius) then
		radius = tonumber(radius) + 0.01
		local vehicles = ESX.Game.GetVehiclesInArea(GetEntityCoords(ESX.PlayerData.ped), radius)

		for k,entity in ipairs(vehicles) do
			local attempt = 0

			while not NetworkHasControlOfEntity(entity) and attempt < 100 and DoesEntityExist(entity) do
				Wait(100)
				NetworkRequestControlOfEntity(entity)
				attempt = attempt + 1
			end

			if DoesEntityExist(entity) and NetworkHasControlOfEntity(entity) then
				ESX.Game.DeleteVehicle(entity)
			end
		end
	else
		local vehicle, attempt = ESX.Game.GetVehicleInDirection(), 0

		if IsPedInAnyVehicle(ESX.PlayerData.ped, true) then
			vehicle = GetVehiclePedIsIn(ESX.PlayerData.ped, false)
		end

		while not NetworkHasControlOfEntity(vehicle) and attempt < 100 and DoesEntityExist(vehicle) do
			Wait(100)
			NetworkRequestControlOfEntity(vehicle)
			attempt = attempt + 1
		end

		if DoesEntityExist(vehicle) and NetworkHasControlOfEntity(vehicle) then
			ESX.Game.DeleteVehicle(vehicle)
		end
	end
end)

-- Pause menu disables HUD display
if Config.EnableHud then
	CreateThread(function()
		local isPaused = false
		local time = 500
		while true do
			Wait(time)

			if IsPauseMenuActive() and not isPaused then
				time = 100
				isPaused = true
				ESX.UI.HUD.SetDisplay(0.0)
			elseif not IsPauseMenuActive() and isPaused then
				time = 100
				isPaused = false
				ESX.UI.HUD.SetDisplay(1.0)
			end
		end
	end)

	AddEventHandler('esx:loadingScreenOff', function()
		ESX.UI.HUD.SetDisplay(1.0)
	end)
end



function StartServerSyncLoops()
	if not Config.OxInventory then
			-- keep track of ammo

			CreateThread(function()
					local currentWeapon = {Ammo = 0}
					while ESX.PlayerLoaded do
						local sleep = 300
						if GetSelectedPedWeapon(ESX.PlayerData.ped) ~= -1569615261 then
							sleep = 0
							local _,weaponHash = GetCurrentPedWeapon(ESX.PlayerData.ped, true)
							local weapon = ESX.GetWeaponFromHash(weaponHash) 
							if weapon then
								local ammoCount = GetAmmoInPedWeapon(ESX.PlayerData.ped, weaponHash)
								if weapon.name ~= currentWeapon.name then 
									currentWeapon.Ammo = ammoCount
									currentWeapon.name = weapon.name
								else
									if ammoCount ~= currentWeapon.Ammo then
										currentWeapon.Ammo = ammoCount
										TriggerServerEvent('esx:updateWeaponAmmo', weapon.name, ammoCount)
									end 
								end   
							end
						end    
					Wait(sleep)
					end
			end)
	end

	-- sync current player coords with server
	CreateThread(function()
		local previousCoords = vector3(-1213.72, -191.010, 39.322)

		while ESX.PlayerLoaded do
			local playerPed = PlayerPedId()
			if ESX.PlayerData.ped ~= playerPed then ESX.SetPlayerData('ped', playerPed) end

			if DoesEntityExist(ESX.PlayerData.ped) then
				local playerCoords = GetEntityCoords(ESX.PlayerData.ped)
				local distance = #(playerCoords - previousCoords)

				if distance > 1 then
					previousCoords = playerCoords
					local playerHeading = ESX.Math.Round(GetEntityHeading(ESX.PlayerData.ped), 1)
					local formattedCoords = {x = ESX.Math.Round(playerCoords.x, 1), y = ESX.Math.Round(playerCoords.y, 1), z = ESX.Math.Round(playerCoords.z, 1), heading = playerHeading}
					TriggerServerEvent('esx:updateCoords', formattedCoords)
				end
			end
			Wait(1500)
		end
	end)
end



-- disable wanted level
if not Config.EnableWantedLevel then
	ClearPlayerWantedLevel(PlayerId())
	SetMaxWantedLevel(0)
end

if not Config.OxInventory then
	CreateThread(function()
		while true do
			local Sleep = 1500
			local playerCoords = GetEntityCoords(ESX.PlayerData.ped)
			local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer(playerCoords)

			for pickupId,pickup in pairs(pickups) do
				local distance = #(playerCoords - pickup.coords)

				if distance < 5 then
					Sleep = 0
					local label = pickup.label

					if distance < 1 then
						if IsControlJustReleased(0, 38) then
							if IsPedOnFoot(ESX.PlayerData.ped) and (closestDistance == -1 or closestDistance > 3) and not pickup.inRange then
								pickup.inRange = true

								local dict, anim = 'weapons@first_person@aim_rng@generic@projectile@sticky_bomb@', 'plant_floor'
								ESX.Streaming.RequestAnimDict(dict)
								TaskPlayAnim(ESX.PlayerData.ped, dict, anim, 8.0, 1.0, 1000, 16, 0.0, false, false, false)
								RemoveAnimDict(dict)
								Wait(1000)

								TriggerServerEvent('esx:onPickup', pickupId)
								PlaySoundFrontend(-1, 'PICK_UP', 'HUD_FRONTEND_DEFAULT_SOUNDSET', false)
							end
						end

						label = ('%s~n~%s'):format(label, _U('threw_pickup_prompt'))
					end

					ESX.Game.Utils.DrawText3D({
						x = pickup.coords.x,
						y = pickup.coords.y,
						z = pickup.coords.z + 0.25
					}, label, 1.2, 1)
				elseif pickup.inRange then
					pickup.inRange = false
				end
			end
			Wait(Sleep)
		end
	end)
end

----- Admin commnads from esx_adminplus

RegisterNetEvent("esx:tpm")
AddEventHandler("esx:tpm", function()
local PlayerPedId = PlayerPedId
local GetEntityCoords = GetEntityCoords
local GetGroundZFor_3dCoord = GetGroundZFor_3dCoord

	ESX.TriggerServerCallback("esx:isUserAdmin", function(admin)
		if admin then
			local blipMarker = GetFirstBlipInfoId(8)
			if not DoesBlipExist(blipMarker) then
					ESX.ShowNotification('No Waypoint Set.', true, false, 140)
					return 'marker'
			end
	
			-- Fade screen to hide how clients get teleported.
			DoScreenFadeOut(650)
			while not IsScreenFadedOut() do
					Wait(0)
			end
	
			local ped, coords = PlayerPedId(), GetBlipInfoIdCoord(blipMarker)
			local vehicle = GetVehiclePedIsIn(ped, false)
			local oldCoords = GetEntityCoords(ped)
	
			-- Unpack coords instead of having to unpack them while iterating.
			-- 825.0 seems to be the max a player can reach while 0.0 being the lowest.
			local x, y, groundZ, Z_START = coords['x'], coords['y'], 850.0, 950.0
			local found = false
			if vehicle > 0 then
					FreezeEntityPosition(vehicle, true)
			else
					FreezeEntityPosition(ped, true)
			end
	
			for i = Z_START, 0, -25.0 do
					local z = i
					if (i % 2) ~= 0 then
							z = Z_START - i
					end
	
					NewLoadSceneStart(x, y, z, x, y, z, 50.0, 0)
					local curTime = GetGameTimer()
					while IsNetworkLoadingScene() do
							if GetGameTimer() - curTime > 1000 then
									break
							end
							Wait(0)
					end
					NewLoadSceneStop()
					SetPedCoordsKeepVehicle(ped, x, y, z)
	
					while not HasCollisionLoadedAroundEntity(ped) do
							RequestCollisionAtCoord(x, y, z)
							if GetGameTimer() - curTime > 1000 then
									break
							end
							Wait(0)
					end
	
					-- Get ground coord. As mentioned in the natives, this only works if the client is in render distance.
					found, groundZ = GetGroundZFor_3dCoord(x, y, z, false)
					if found then
							Wait(0)
							SetPedCoordsKeepVehicle(ped, x, y, groundZ)
							break
					end
					Wait(0)
			end
	
			-- Remove black screen once the loop has ended.
			DoScreenFadeIn(650)
			if vehicle > 0 then
					FreezeEntityPosition(vehicle, false)
			else
					FreezeEntityPosition(ped, false)
			end
	
			if not found then
					-- If we can't find the coords, set the coords to the old ones.
					-- We don't unpack them before since they aren't in a loop and only called once.
					SetPedCoordsKeepVehicle(ped, oldCoords['x'], oldCoords['y'], oldCoords['z'] - 1.0)
					ESX.ShowNotification('Successfully Teleported', true, false, 140)
			end
	
			-- If Z coord was found, set coords in found coords.
			SetPedCoordsKeepVehicle(ped, x, y, groundZ)
			ESX.ShowNotification('Successfully Teleported', true, false, 140)
		end
	end)
end)

local noclip = false
RegisterNetEvent("esx:noclip")
AddEventHandler("esx:noclip", function(input)
	ESX.TriggerServerCallback("esx:isUserAdmin", function(admin)
		if admin then
    local player = PlayerId()

    local msg = "disabled"
	if(noclip == false)then
		noclip_pos = GetEntityCoords(ESX.PlayerData.ped, false)
	end

	noclip = not noclip

	if(noclip)then
		msg = "enabled"
	end

	TriggerEvent("chatMessage", "Noclip has been ^2^*" .. msg)
	end
	end)
end)

	local heading = 0
	CreateThread(function()
	while true do
		local Sleep = 1500

		if(noclip)then
			Sleep = 0
			SetEntityCoordsNoOffset(ESX.PlayerData.ped, noclip_pos.x, noclip_pos.y, noclip_pos.z, 0, 0, 0)

			if IsDisabledControlPressed(0, 32) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(ESX.PlayerData.ped, 0.0, -1.0, 0.0)
			end

			if IsDisabledControlPressed(0, 33) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(ESX.PlayerData.ped, 0.0, 1.0, 0.0)
			end

			if IsDisabledControlPressed(0, 34) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) + 2.0)
			end

			if IsDisabledControlPressed(0, 35) then
				SetEntityHeading(PlayerPedId(), GetEntityHeading(PlayerPedId()) - 2.0)
			end

			if IsDisabledControlPressed(0, 44) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(ESX.PlayerData.ped, 0.0, 0.0, 1.0)
			end

			if IsDisabledControlPressed(0, 20) then
				noclip_pos = GetOffsetFromEntityInWorldCoords(ESX.PlayerData.ped, 0.0, 0.0, -1.0)
			end

		end
	Wait(Sleep)
	end
end)

RegisterNetEvent("esx:killPlayer")
AddEventHandler("esx:killPlayer", function()
  SetEntityHealth(ESX.PlayerData.ped, 0)
end)

RegisterNetEvent("esx:freezePlayer")
AddEventHandler("esx:freezePlayer", function(input)
    local player = PlayerId()
    if input == 'freeze' then
        SetEntityCollision(ESX.PlayerData.ped, false)
        FreezeEntityPosition(ESX.PlayerData.ped, true)
        SetPlayerInvincible(player, true)
    elseif input == 'unfreeze' then
        SetEntityCollision(ESX.PlayerData.ped, true)
	    FreezeEntityPosition(ESX.PlayerData.ped, false)
        SetPlayerInvincible(player, false)
    end
end)




