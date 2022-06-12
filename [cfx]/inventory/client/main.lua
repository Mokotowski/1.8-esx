
OtherInventory = nil
Drops = {}
hotbarLock = false


Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(10)
	end
end)



RegisterNetEvent('inventory:refresh', function()
    GetInventory()
    if OtherInventory then
        GetInventory(OtherInventory, true)
    end
end)

RegisterNetEvent('inventory:refreshDrops', function(nDrops) 
    Drops = nDrops
end)

RegisterNetEvent('inventory:notify', function(type, msg)
    SendNUIMessage({
        action = 'notify',
        type = type,
        msg = msg
    })
end)

-- NUI callbacks
RegisterNUICallback('MoveItemToPlayer', function(data, cb)
    TriggerServerEvent('inventory:moveItemToPlayer', data.item, tonumber(data.count), OtherInventory)
    Wait(150)
    cb(200)
end)

RegisterNUICallback('MoveItemToOther', function(data, cb)
    TriggerServerEvent('inventory:moveItemToOther', data.item, tonumber(data.count), OtherInventory)
    Wait(150)
    cb(200)
end)

RegisterNUICallback('AddItemToHotbar', function(data)
    TriggerServerEvent('inventory:addItemToHotbar', data.slot, data.item)
end)

RegisterNUICallback('RemoveItemFromHotbar', function(data)
    TriggerServerEvent('inventory:removeItemFromHotbar', data.slot)
end)

RegisterNUICallback('GetPlayers', function(data, cb)
    cb(GetPlayersInArea())
end)



RegisterNUICallback('UseItem', function(data)
    for k,v in pairs(Config.CloseOnUse) do
        if v == data.item.name then
            SendNUIMessage({
                action = 'close',
                invName = GetCurrentResourceName()
            })    
            break
        end
    end

    TriggerServerEvent('esx:useItem', data.item.name)
    Wait(150)
    TriggerEvent("inventory:refresh") 
end)

RegisterNUICallback('GiveItem', function(data)
    local target = GetPlayerFromServerId(data.src)
    local distance = #(GetEntityCoords(GetPlayerPed(target)) - GetEntityCoords(PlayerPedId()))

    if distance <= 5.0 then
        if data.item.type == 'item_account' then
            if data.item.name == 'cash' then
                if not Config.PlayerWeight then
                    TriggerServerEvent("esx:giveInventoryItem", data.src, 'item_money', 'cash', tonumber(data.count)) 
                else 
                    TriggerServerEvent("esx:giveInventoryItem", data.src, data.item.type, 'money', tonumber(data.count)) 
                end
            else 
                TriggerServerEvent("esx:giveInventoryItem", data.src, data.item.type, data.item.name, tonumber(data.count)) 
            end
        else
            TriggerServerEvent("esx:giveInventoryItem", data.src, data.item.type, data.item.name, tonumber(data.count)) 
        end
    
        Wait(150)
        TriggerEvent("inventory:refresh") 
    end
end)

RegisterNUICallback('RemoveItem', function(data, cb)
    if IsPedInAnyVehicle(PlayerPedId(), true) then 
        Wait(50)
        cb(200)
        return 
    end
    
    for k,v in pairs(Drops) do
        local distance = #(v.coords - GetEntityCoords(PlayerPedId()))
        if distance < 2.0 then
            TriggerServerEvent('inventory:moveItemToOther', data.item, tonumber(data.count), {id = k, type = 'drop', title = '🗑️ Wyrzuć - ' .. k})
            Wait(50)
            cb(200)
            return
        end
    end 

    TriggerServerEvent('inventory:removeItem', data.item, tonumber(data.count), GetEntityCoords(PlayerPedId()))
    Wait(50)
    cb(200)
end)

RegisterNUICallback('close', function()
    CloseInventory()
end)

local tryb  = 1


RegisterNetEvent("inventory:savess1")
AddEventHandler("inventory:savess1", function()
tryb = 1       
end)


RegisterNetEvent("inventory:savess2")
AddEventHandler("inventory:savess2", function()
tryb = 2      
end)

--[[
Citizen.CreateThread(function()
        ESX.TriggerServerCallback('inventory:danedlaequ', function(data)
        --    print(data)
        if data == 1 then 
        TriggerEvent('inventory:savess1')
        else data == 2 then
        TriggerEvent('inventory:savess2')
        end
    
        end, GetPlayerServerId(player))
    


end)
]]


RegisterCommand('equ', function()
if tryb == 1 then 
    tryb = 2
    --TriggerServerEvent("inventory:savess", 2)

else  
    tryb = 1
    --TriggerServerEvent("inventory:savess", 1)

end 
end)


CreateThread(function()
    while true do
        Wait(10)

        if tryb == 1 then 
            if IsControlJustReleased(0, 289)  then

                ESX.ShowInventory()
            end 
        else  
            if IsControlJustReleased(0, 289)  then

                OpenInventory()
            end
            
        end 
    end
end)