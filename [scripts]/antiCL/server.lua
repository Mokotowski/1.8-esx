local webhook = "https://discord.com/api/webhooks/883366827055542283/tDr-DLlbnP7VSzWvbu32R7UVBhU9iMV6Z6xqNXChZYww3iMaIu3PFpREvxsmsMqsf3iU"



RegisterCommand("acl", function(source, args, rawcmd)
    TriggerClientEvent("pixel_antiCL:show", source)
end)

AddEventHandler("playerDropped", function(reason)
    local crds = GetEntityCoords(GetPlayerPed(source), 0)
    local id = source
    local identifier = ""
    if Config.UseSteam then
        identifier = GetPlayerIdentifier(source, 0)
    else
        identifier = GetPlayerIdentifier(source, 1)
    end
    TriggerClientEvent("pixel_anticl", -1, id, crds, identifier, reason)
    if Config.LogSystem then
        SendLog(id, crds, identifier, reason)
    end
end)

function SendLog(id, crds, identifier, reason)
    local name = GetPlayerName(id)
    local date = os.date('*t')
    if date.month < 10 then date.month = '0' .. tostring(date.month) end
    if date.day < 10 then date.day = '0' .. tostring(date.day) end
    if date.hour < 10 then date.hour = '0' .. tostring(date.hour) end
    if date.min < 10 then date.min = '0' .. tostring(date.min) end
    if date.sec < 10 then date.sec = '0' .. tostring(date.sec) end
    local date = (''..date.day .. '.' .. date.month .. '.' .. date.year .. ' - ' .. date.hour .. ':' .. date.min .. ':' .. date.sec..'')
    local embeds = {
        {
            ["title"] = "Gracz wyszedl z serwera",
            ["type"]="rich",
            ["color"] = 4777493,
            ["fields"] = {
                {
                    ["name"] = "HEX",
                    ["value"] = identifier,
                    ["inline"] = true,
                },{
                    ["name"] = "Nick",
                    ["value"] = name,
                    ["inline"] = true,
                },{
                    ["name"] = "ID",
                    ["value"] = id,
                    ["inline"] = true,
                },{
                   ["name"] = "Kordy",
                    ["value"] = "X: "..crds.x..", Y: "..crds.y..", Z: "..crds.z,
                    ["inline"] = true,
                },
               {
                    ["name"] = "Powod",
                    ["value"] = reason,
                    ["inline"] = true,
                },
            },
            ["footer"]=  {
               -- ["icon_url"] = "",
                ["text"]= "Wysłano: " ..date.."",
            },
        }
    }
    PerformHttpRequest(webhook, function(err, text, headers) end, 'POST', json.encode({ username = Config.LogBotName,embeds = embeds}), { ['Content-Type'] = 'application/json' })
end