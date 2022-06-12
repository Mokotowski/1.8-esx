Config = {
	GunshotAlert = true,

	GunshotOnlyCities = true,
	MeleeOnlyCities = true,

	AlertFade = 180, -- in seconds
	GunpowderTimer = 15, -- in minutes

	AllowedWeapons = {
		["WEAPON_STUNGUN"] = true,
		["WEAPON_SNOWBALL"] = true,
		["WEAPON_BALL"] = true,
		["WEAPON_APPiSTOL"] = true,
		["WEAPON_FLARE"] = true,
		["WEAPON_STICKYBOMB"] = true,
		["WEAPON_FIREEXTINGUISHER"] = true,
		["WEAPON_PETROLCAN"] = true,
		["GADGET_PARACHUTE"] = true,
		["WEAPON_SNSPISTOL_MK2"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_VINTAGEPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_PISTOL"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_PISTOL_MK2"] = "COMPONENT_AT_PI_SUPP_02",
		["WEAPON_COMBATPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_HEAVYPISTOL"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_PUMPSHOTGUN"] = "COMPONENT_AT_SR_SUPP",
		["WEAPON_PUMPSHOTGUN_MK2"] = "COMPONENT_AT_SR_SUPP_03",
		["WEAPON_BULLPUPSHOTGUN"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_MICROSMG"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_SMG"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_SMG_MK2"] = "COMPONENT_AT_PI_SUPP",
		["WEAPON_COMBATPDW"] = true,
		["WEAPON_ASSAULTSMG"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_ASSAULTRIFLE"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_CARBINERIFLE"] = "COMPONENT_AT_AR_SUPP",
		["WEAPON_MARKSMANRIFLE"] = "COMPONENT_AT_AR_SUPP",
		["WEAPON_SNIPERRIFLE"] = "COMPONENT_AT_AR_SUPP_02",
		["WEAPON_1911PISTOL"] = "COMPONENT_AT_PI_SUPP"
	}
}

local PlayerData = {}
local Blips = {}
local _in = Citizen.InvokeNative

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end

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

RegisterNetEvent('esx_jb_outlawalert:notifyAccident')
AddEventHandler('esx_jb_outlawalert:notifyAccident', function(coords, text)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipPriority(blip, 4)
		SetBlipScale(blip, 0.9)
		SetBlipSprite(blip, 380)
		SetBlipColour(blip, 2)
		SetBlipAlpha(blip, 250)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('# Wypadek/Kolizja')
		EndTextCommandSetBlipName(blip)

		TriggerEvent("chatMessage", '^0[^3Centrala^0]', { 0, 0, 0 }, text)
		table.insert(Blips, blip)
		Citizen.CreateThread(function()
			local alpha = 250
			while alpha > 0 and DoesBlipExist(blip) do
				Citizen.Wait(Config.AlertFade * 4)
				SetBlipAlpha(blip, alpha)
				alpha = alpha - 1

				if alpha == 0 then
					RemoveBlip(blip)
					for i, b in ipairs(Blips) do
						if b == blip then
							table.remove(Blips, i)
							return
						end
					end

					break
				end
			end
		end)
	end
end)

RegisterNetEvent('esx_jb_outlawalert:notifyThief')
AddEventHandler('esx_jb_outlawalert:notifyThief', function(coords, text)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipPriority(blip, 4)
		SetBlipScale(blip, 0.9)
		SetBlipSprite(blip, 229)
		SetBlipColour(blip, 5)
		SetBlipAlpha(blip, 250)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('# Kradzież/Uprowadzenie pojazdu')
		EndTextCommandSetBlipName(blip)

		TriggerEvent("chatMessage", '^0[^3Centrala^0]', { 0, 0, 0 }, text)
		table.insert(Blips, blip)
		Citizen.CreateThread(function()
			local alpha = 250
			while alpha > 0 and DoesBlipExist(blip) do
				Citizen.Wait(Config.AlertFade * 4)
				SetBlipAlpha(blip, alpha)
				alpha = alpha - 1

				if alpha == 0 then
					RemoveBlip(blip)
					for i, b in ipairs(Blips) do
						if b == blip then
							table.remove(Blips, i)
							return
						end
					end

					break
				end
			end
		end)
	end
end)

RegisterNetEvent('esx_jb_outlawalert:notifyShots')
AddEventHandler('esx_jb_outlawalert:notifyShots', function(coords, text, isPolice)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipPriority(blip, 6)
		SetBlipScale(blip, 0.9)
		SetBlipSprite(blip, 432)
		SetBlipColour(blip, (isPolice and 3 or 76))
		SetBlipAlpha(blip, 250)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('# Strzały ' .. (isPolice and "policyjne" or "cywilne"))
		EndTextCommandSetBlipName(blip)

		TriggerEvent("chatMessage", '^0[^3Centrala^0]', { 0, 0, 0 }, text)
		table.insert(Blips, blip)
		Citizen.CreateThread(function()
			local alpha = 250
			while alpha > 0 and DoesBlipExist(blip) do
				Citizen.Wait(Config.AlertFade * 4)
				SetBlipAlpha(blip, alpha)
				alpha = alpha - 1

				if alpha == 0 then
					RemoveBlip(blip)
					for i, b in ipairs(Blips) do
						if b == blip then
							table.remove(Blips, i)
							return
						end
					end

					break
				end
			end
		end)
	end
end)

RegisterNetEvent('esx_jb_outlawalert:notifyCombat')
AddEventHandler('esx_jb_outlawalert:notifyCombat', function(coords, text)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipPriority(blip, 4)
		SetBlipScale(blip, 0.9)
		SetBlipSprite(blip, 468)
		SetBlipColour(blip, 24)
		SetBlipAlpha(blip, 250)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('# Bójka/Uszkodzenie mienia')
		EndTextCommandSetBlipName(blip)

		TriggerEvent("chatMessage", '^0[^3Centrala^0]', { 0, 0, 0 }, text)
		table.insert(Blips, blip)
		Citizen.CreateThread(function()
			local alpha = 250
			while alpha > 0 and DoesBlipExist(blip) do
				Citizen.Wait(Config.AlertFade * 4)
				SetBlipAlpha(blip, alpha)
				alpha = alpha - 1

				if alpha == 0 then
					RemoveBlip(blip)
					for i, b in ipairs(Blips) do
						if b == blip then
							table.remove(Blips, i)
							return
						end
					end

					break
				end
			end
		end)
	end
end)

RegisterNetEvent('esx_jb_outlawalert:notifyBanking')
AddEventHandler('esx_jb_outlawalert:notifyBanking', function(sender, coords, text, makePhoto)
	if PlayerData.job ~= nil and PlayerData.job.name == 'police' then
		local blip = AddBlipForCoord(coords.x, coords.y, coords.z)
		SetBlipPriority(blip, 5)
		SetBlipSprite(blip, 472)
		SetBlipColour(blip, 48)
		SetBlipAlpha(blip, 250)
		SetBlipAsShortRange(blip, true)

		BeginTextCommandSetBlipName("STRING")
		AddTextComponentString('# Bankomat/Gotówka')
		EndTextCommandSetBlipName(blip)

		table.insert(Blips, blip)
		Citizen.CreateThread(function()
			local alpha = 250
			while alpha > 0 and DoesBlipExist(blip) do
				Citizen.Wait(Config.AlertFade * 4)
				SetBlipAlpha(blip, alpha)
				alpha = alpha - 1

				if alpha == 0 then
					RemoveBlip(blip)
					for i, b in ipairs(Blips) do
						if b == blip then
							table.remove(Blips, i)
							return
						end
					end

					break
				end
			end
		end)

		TriggerEvent("chatMessage", '^0[^3Centrala^0]', { 0, 0, 0 }, text)
		if makePhoto then
			Citizen.CreateThreadNow(function()
				ESX.Game.Utils.RenderHeadshotCached(GetEntityCoords(PlayerPedId(), false), sender, nil, function(pic)
					TriggerEvent("FeedM:showAdvancedNotification", 'Alarm policyjny', '~r~Bankomat/Gotówka', 'Ostatni zrzut z kamery.', pic, 10000, 'danger')
				end)
			end)
		end
	end
end)

AddEventHandler('esx_jb_outlawalert:processThief', function(ped, vehicle, mode)
	local str = "^3" .. (mode == nil and "Próba kradzieży pojazdu" or (mode == true and "Uprowadzenie pojazdu" or "Kradzież pojazdu"))
	if DoesEntityExist(vehicle) then
		vehicle = GetEntityModel(vehicle)

		local coords = GetEntityCoords(ped, true)
		TriggerEvent('esx_vehicleshop:getVehicles', function(base)
			local name = GetDisplayNameFromVehicleModel(vehicle)
			if name ~= 'CARNOTFOUND' then
				local found = false
				for _, veh in ipairs(base) do
					if (veh.game:len() > 0 and veh.game == name) or veh.model == name then
						name = veh.name
						found = true
						break
					end
				end

				if not found then
					local label = GetLabelText(name)
					if label ~= "NULL" then
						name = label
					end
				end

				str = str .. ' ^0' .. name .. '^3'
			end

			local s1, s2 = _in(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
			if s1 ~= 0 and s2 ~= 0 then
				str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1) .. "^3 na skrzyżowaniu z ^0" .. GetStreetNameFromHashKey(s2)
			elseif s1 ~= 0 then
				str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1)
			end

			TriggerServerEvent('esx_jb_outlawalert:notifyThief', {x = coords.x, y = coords.y, z = coords.y}, str)
		end)
	else
		local coords = GetEntityCoords(ped, true)

		local s1, s2 = _in(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
		if s1 ~= 0 and s2 ~= 0 then
			str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1) .. "^3 na skrzyżowaniu z ^0" .. GetStreetNameFromHashKey(s2)
		elseif s1 ~= 0 then
			str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1)
		end

		TriggerServerEvent('esx_jb_outlawalert:notifyThief', {x = coords.x, y = coords.y, z = coords.y}, str)
	end

end)

local shotTimer = 0
Citizen.CreateThread(function()
	while true do
		Citizen.Wait(100)
		if shotTimer > 0 then
			shotTimer = shotTimer - 100
			if shotTimer < 1 then
				TriggerEvent('esx:updateDecor', 'DEL', NetworkGetNetworkIdFromEntity(PlayerPedId()), "Gunpowder")
				shotTimer = 0
			end
		end
	end
end)

Citizen.CreateThread(function()
	while not NetworkIsSessionStarted() do
		Citizen.Wait(0)
	end

	if not DecorIsRegisteredAsType("Gunpowder", 2) then
		DecorRegister("Gunpowder", 2)
	end

	while true do
		Citizen.Wait(0)

		local ped = PlayerPedId()
		if DoesEntityExist(ped) then
			if IsPedShooting(ped) then
				if shotTimer == 0 then
					TriggerEvent('esx:updateDecor', 'BOOL', NetworkGetNetworkIdFromEntity(ped), "Gunpowder", true)
				end

				local weapon, supress = GetSelectedPedWeapon(ped), nil
				for w, c in pairs(Config.AllowedWeapons) do
					if weapon == GetHashKey(w) then
						if c == true or HasPedGotWeaponComponent(ped, GetHashKey(w), GetHashKey(c)) then
							supress = (c == true)
							break
						end
					end
				end

				if supress ~= true then
					shotTimer = Config.GunpowderTimer * 60000
					if Config.GunshotAlert then
						local coords = GetEntityCoords(ped)

						if CheckArea(coords, Config.GunshotOnlyCities, (supress == false and 10 or 120)) then
							local isPolice = PlayerData.job and PlayerData.job.name == 'police'
							local str = "^" .. (isPolice and "4" or "8") .. "Uwaga, strzały" .. (isPolice and " policyjne" or "")

							local s1, s2 = _in(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
							if s1 ~= 0 and s2 ~= 0 then
								str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1) .. "^" .. (isPolice and "4" or "8") .. " na skrzyżowaniu z ^0" .. GetStreetNameFromHashKey(s2)
							elseif s1 ~= 0 then
								str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1)
							end

							TriggerServerEvent('esx_jb_outlawalert:notifyShots', {x = coords.x, y = coords.y, z = coords.y}, str, isPolice)
							Citizen.Wait(5000)
						end
					end
				end
			end
		end
	end
end)


function CheckArea(coords, should, dist)
	if not should then
		return true
	end

	local found = false
	for _, ped in ipairs(ESX.Game.GetPeds(list)) do
		local pedType = GetPedType(ped)
		if pedType ~= 28 and pedType ~= 27 and pedType ~= 6 then
			if #(coords - GetEntityCoords(ped)) < dist then
				return true
			end
		end
	end

	return false
end

local lastVehicle
AddEventHandler('gameEventTriggered', function(name, args)
	if PlayerData.job and PlayerData.job.name == 'police' then

	if name == 'CEventNetworkEntityDamage' then
		local target, source = table.unpack(args)
		if source == PlayerPedId() and IsEntityAVehicle(target) then
			local driver = GetPedInVehicleSeat(target, -1)
			if driver and not GetPlayerByEntityID(driver) and (not lastVehicle or lastVehicle ~= target) then
				SetBlockingOfNonTemporaryEvents(driver, true)
				local coords = GetEntityCoords(target, false)

				local str, s1, s2 = "^2Niszczenie mienia", _in(0x2EB41072B4C1E4C0, coords.x, coords.y, coords.z, Citizen.PointerValueInt(), Citizen.PointerValueInt())
				if s1 ~= 0 and s2 ~= 0 then
					str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1) .. "^2 na skrzyżowaniu z ^0" .. GetStreetNameFromHashKey(s2)
				elseif s1 ~= 0 then
					str = str .. " przy ^0" .. GetStreetNameFromHashKey(s1)
				end

				TriggerServerEvent('esx_jb_outlawalert:notifyCombat', {x = coords.x, y = coords.y, z = coords.y}, str)
				lastVehicle = target
			end
			end
		end
	end
end)

function GetPlayerByEntityID(id)
	for _, player in ipairs(GetActivePlayers()) do
		if id == GetPlayerPed(player) then
			return player
		end
	end
end