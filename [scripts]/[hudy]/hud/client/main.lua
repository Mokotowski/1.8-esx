local lastProximity, lastEEE, showhud = 0, false, true



RegisterKeyMapping("hudv", "Ukryj/Pokaż Hud", "keyboard", "pagedown")
RegisterCommand("hudv", function()
    showhud = not showhud
    SendNUIMessage({action = 'UPDATE_HUD', show = showhud})
end)


RegisterNetEvent('hud:display')
AddEventHandler('hud:display', function(status)
	SendNUIMessage({action = 'UPDATE_HUD', show = status})
end)
  


RegisterNUICallback('NUIFocusOff', function(data)
	SetNuiFocus(false, false)
end)



CreateThread(function()
    while true do
        Citizen.Wait(1000)

        -- status
        local ped, pid = PlayerPedId(), PlayerId()
        local health, armor, hunger, thirst, drunk, oxygen, sprint = GetEntityHealth(ped), GetPedArmour(ped), 0, 0, 0, GetPlayerUnderwaterTimeRemaining(pid), 100 - GetPlayerSprintStaminaRemaining(pid)

        TriggerEvent('esx_status:getStatus', 'hunger', function(status)
            hunger = status.getPercent()
        end)
        TriggerEvent('esx_status:getStatus', 'thirst', function(status)
            thirst = status.getPercent()
        end)
        TriggerEvent('esx_status:getStatus', 'drunk', function(status)
            drunk = status.getPercent()
        end)

        SendNUIMessage({
            action = 'UPDATE_HUD',
            show = showhud,
            health = health,
            armor = armor,
            hunger = hunger,
            thirst = thirst
        })
    end
end)
