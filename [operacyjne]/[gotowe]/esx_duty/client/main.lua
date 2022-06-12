local Keys = {
  ["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
  ["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
  ["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
  ["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
  ["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
  ["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
  ["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
  ["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
}

local PlayerData              = {}
Config                            = {}
Config.Locale                     = 'en'

CreateThread(function ()
  while ESX == nil do
    TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
    Citizen.Wait(0)
 	PlayerData = ESX.GetPlayerData()
  end
end)

RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
  PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
  PlayerData.job = job
end)










RegisterCommand('dutyems', function()
  if PlayerData.job.name == 'ambulance' or PlayerData.job.name == 'offambulance' then
    TriggerServerEvent('duty:ambulance')
  if PlayerData.job.name == 'ambulance' then
    TriggerEvent('esx:showAdvancedNotification', _U('offduty'))
    Wait(1000)
  else
    TriggerEvent('esx:showAdvancedNotification', _U('onduty'))
    Wait(1000)
  end
else
  TriggerEvent('esx:showAdvancedNotification', _U('notamb'))
  Wait(1000)
end
end)



RegisterCommand('dutylspd', function()
    if PlayerData.job.name == 'police' or PlayerData.job.name == 'offpolice' then
      TriggerServerEvent('duty:police')
    if PlayerData.job.name == 'police' then
      TriggerEvent('esx:showAdvancedNotification', _U('offduty'))
      Wait(1000)
    else
      TriggerEvent('esx:showAdvancedNotification', _U('onduty'))
      Wait(1000)
    end
    else
    TriggerEvent('esx:showAdvancedNotification', _U('notpol'))
    Wait(1000)
    end

end)



RegisterCommand('dutymecano', function()
  if PlayerData.job.name == 'mecano' or PlayerData.job.name == 'offmecano' then
    TriggerServerEvent('duty:mecanooo')
  if PlayerData.job.name == 'mecano' then
    TriggerEvent('esx:showAdvancedNotification', _U('offduty'))
    Wait(1000)
  else
    TriggerEvent('esx:showAdvancedNotification', _U('onduty'))
    Wait(1000)
  end
else
  TriggerEvent('esx:showAdvancedNotification', _U('notmec'))
  Wait(1000)
  end

end)