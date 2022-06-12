function OpenInventory(otherInv)
    if IsPauseMenuActive() then return end

    if Config.Blur then SetTimecycleModifier('hud_def_blur') end

    local hotbar = nil
    hotbarLock = false

    if Config.Hotbar then
        hotbar = {slotCount = Config.HotbarSlots, items = nil}
    end

    SetNuiFocus(true, true)
    SendNUIMessage({
        action = 'open',
        inventory = {type = 'main', title = 'Twój <b>Ekwipunek</b>', weight = Config.PlayerWeight},
        otherInventory = otherInv,
        players = GetPlayersInArea(),
        sound = Config.SoundEffects,
        hotbar = hotbar,
        invName = GetCurrentResourceName(),
        middleClickUse = Config.MiddleClickToUse,
        clickOutside = Config.ClickOutsideToClose,
        locales = Locales
    })

    Wait(50)

    GetInventory()
    if otherInv then
        GetInventory(otherInv)
    end

    OtherInventory = otherInv
end

function GetInventory(otherInv, refresh)
    if otherInv then
        ESX.TriggerServerCallback("inventory:getOtherInventory", function(items, weight)
            if otherInv.timeout and not refresh then Wait(otherInv.timeout) end
            SendNUIMessage({
                action = 'setOtherItems',
                items = items,
                weight = weight
            })
        end, otherInv)
    else 
        ESX.TriggerServerCallback("inventory:getInventory", function(items, weight, hotbar)
            SendNUIMessage({
                action = 'setItems',
                items = items,
                weight = weight,
                hotbar = hotbar
            })
        end)
    end
end

function CloseInventory()
    SetNuiFocus(false, false)
    if Config.Blur then
        SetTimecycleModifier('default')
    end

    if not IsPedInAnyVehicle(PlayerPedId()) then
        if Config.Rob then handsup = false end

    
    end

    TriggerEvent("inventory:close")

    if OtherInventory then
        TriggerServerEvent("inventory:close", OtherInventory)
    end
end

function GetPlayersInArea()
    local players = {}

    for k,v in pairs(ESX.Game.GetPlayersInArea(GetEntityCoords(PlayerPedId()), 5.0)) do 
        local src = GetPlayerServerId(v)
        local name = GetPlayerName(v)
        table.insert(players, {src = src, name = name})
    end

    return players
end


RegisterNetEvent('inventory:open', function(otherInv)
    OpenInventory(otherInv)
end)