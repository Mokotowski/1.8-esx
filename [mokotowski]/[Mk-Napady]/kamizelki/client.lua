Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

RegisterNetEvent('esx_kamizelka:zakladanie')
AddEventHandler('esx_kamizelka:zakladanie', function()
local ped = GetPlayerPed(-1)

Citizen.Wait(100)
ClearPedTasks(ped)
SetCurrentPedWeapon(ped, GetHashKey("WEAPON_UNARMED"), true)
loadAnimDict( "amb@world_human_cop_idles@male@base" )
TaskPlayAnim(ped, "amb@world_human_cop_idles@male@base", "base", 8.0, 2.0, -1, 50, 2.0, 0, 0, 0 )
Citizen.Wait(700)
SetPedComponentVariation(GetPlayerPed(-1), 9, 4, 3, 2) --- nr 3 odpowiada za kolor kamizelki np 1 = czarny, 0 = szary itp
ClearPedTasks(ped)
SetPedArmour(PlayerPedId(), 50)
Citizen.Wait(600000)
ESX.ShowNotification('Twoja kamizelka właśnie się skończyła')
SetPedArmour(PlayerPedId(), 0)
SetPedComponentVariation(GetPlayerPed(-1), 9, 0, 0, 0)
end)

function loadAnimDict( dict )
	while ( not HasAnimDictLoaded( dict ) ) do
		RequestAnimDict( dict )
		Citizen.Wait( 0 )
	end
end
