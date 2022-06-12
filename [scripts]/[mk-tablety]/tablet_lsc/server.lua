ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)


CreateThread(function()
	while dane2 ~= nil do
        local name = GetPlayerName(source)
        wiadomosc = "NICK STEAM: "..name..""
        DiscordHook1('KTOŚ PROBOWAL DAC FAKTURE BEZ JOBA LSC', wiadomosc, 1669329)
        break
	end
end)


RegisterServerEvent('projektsantos:faktura')
AddEventHandler('projektsantos:faktura', function(target, fine, powod)
    local _source = source
    local xPlayer = ESX.GetPlayerFromId(target)
    local identy = xPlayer.getIdentifier()
    local sourceXPlayer = ESX.GetPlayerFromId(_source)
    local targetXPlayer = ESX.GetPlayerFromId(target)
    if sourceXPlayer.job.name == 'mecano' then
        targetXPlayer.removeAccountMoney('bank', fine)
        TriggerEvent('esx_addonaccount:getSharedAccount', 'society_mecano', function(account)
            account.addMoney(fine)
        end)
        sourceXPlayer.addAccountMoney('bank', fine / 2)
        TriggerClientEvent('esx:showNotification', _source, "Wystawiasz fakturę dla ("..target..")")
        TriggerClientEvent('esx:showNotification', xPlayer.source, '('.._source..') Wystawił Ci fakturę na kwotę: ('..fine..'$) z powodem: ('..powod..')!')
        local xPlayers = ESX.GetPlayers()
        local steamid = sourceXPlayer.identifier
        local steamid2 = targetXPlayer.identifier
        local name1 = GetPlayerName(_source)
        local name2 = GetPlayerName(target)
        local dane = ""..name1.."" 
        local dane2 = ""..name2..""
         wiadomosc = "Powód: "..powod.."\nKwota: "..fine.."\nKto wydał: "..dane.."\nKto otrzymał: "..dane2..""
         DiscordHook('LSC faktura', wiadomosc, 1669329)
    else 
        wiadomosc = "NICK STEAM: "..dane..""
        DiscordHook1('KTOŚ PROBOWAL DAC FAKTURE BEZ JOBA LSC', wiadomosc, 1669329)
    end
end)

function DiscordHook (name,message,color)
    local DiscordWebHook = "https://discordapp.com/api/webhooks/935818556568895488/cWYdF-bkW-cK9Q46b2hWlmkEGphTZqz_Nh8-1Msjt8MTTeI8SbG5FkoDjzejigwKxmaE" --
    local embeds = {{["title"]=message,["type"]="rich",["color"] =color,["footer"]={["text"]= "TRIGGER",},}}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
function DiscordHook1 (name,message,color)
    local DiscordWebHook = "https://discordapp.com/api/webhooks/935818556568895488/cWYdF-bkW-cK9Q46b2hWlmkEGphTZqz_Nh8-1Msjt8MTTeI8SbG5FkoDjzejigwKxmaE" --
    local embeds = {{["title"]=message,["type"]="rich",["color"] =color,["footer"]={["text"]= "TRIGGER",},}}
    if message == nil or message == '' then return FALSE end
    PerformHttpRequest(DiscordWebHook, function(err, text, headers) end, 'POST', json.encode({ username = name,embeds = embeds}), { ['Content-Type'] = 'application/json' })
    end
