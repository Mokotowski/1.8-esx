ESX = nil
TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

ESX.RegisterServerCallback('inside-illegalordersType1:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForFirstOrder
	xPlayer.addMoney(money)
    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

ESX.RegisterServerCallback('inside-illegalordersType2:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForSecondOrder
	xPlayer.addMoney(money)
    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

ESX.RegisterServerCallback('inside-illegalordersType3:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForThirdOrder
	xPlayer.addMoney(money)
    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

ESX.RegisterServerCallback('inside-illegalordersType4:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForFourthOrder
	xPlayer.addMoney(money)
    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

ESX.RegisterServerCallback('inside-illegalordersType5:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForFifthOrder
	xPlayer.addMoney(money)
    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

ESX.RegisterServerCallback('inside-illegalordersType6:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForSixthOrder
	xPlayer.addMoney(money)
    xPlayer.addInventoryItem('id_card_f', 1)


    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

ESX.RegisterServerCallback('inside-illegalordersType7:payout', function(source, cb)
	local xPlayer = ESX.GetPlayerFromId(source)
    local money = Config.PayoutForSeventhOrder
	xPlayer.addMoney(money)
    cb(money)
    local luck = math.random(0, 100)

    local czesci = {
        "bread",
        "water",
        "ig_car3guy2",
    }

    local weapon = czesci[math.random(#czesci)]
    if luck >= 50 then
        xPlayer.addItem(weapon)
        TriggerClientEvent("esx:showNotification", source, "Otrzymałeś "..weapon.."")
    end
end)

AddEventHandler('playerDropped', function()
    TriggerClientEvent('inside-illegalorders:removecars', source)
end)






