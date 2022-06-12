local Keys = {
	["ESC"] = 322, ["F1"] = 288, ["F2"] = 289, ["F3"] = 170, ["F5"] = 166, ["F6"] = 167, ["F7"] = 168, ["F8"] = 169, ["F9"] = 56, ["F10"] = 57,
	["~"] = 243, ["1"] = 157, ["2"] = 158, ["3"] = 160, ["4"] = 164, ["5"] = 165, ["6"] = 159, ["7"] = 161, ["8"] = 162, ["9"] = 163, ["-"] = 84, ["="] = 83, ["BACKSPACE"] = 177,
	["TAB"] = 37, ["Q"] = 44, ["W"] = 32, ["E"] = 38, ["R"] = 45, ["T"] = 245, ["Y"] = 246, ["U"] = 303, ["P"] = 199, ["["] = 39, ["]"] = 40, ["ENTER"] = 18,
	["CAPS"] = 137, ["A"] = 34, ["S"] = 8, ["D"] = 9, ["F"] = 23, ["G"] = 47, ["H"] = 74, ["K"] = 311, ["L"] = 182,
	["LEFTSHIFT"] = 21, ["Z"] = 20, ["X"] = 73, ["C"] = 26, ["V"] = 0, ["B"] = 29, ["N"] = 249, ["M"] = 244, [","] = 82, ["."] = 81,
	["LEFTCTRL"] = 36, ["LEFTALT"] = 19, ["SPACE"] = 22, ["RIGHTCTRL"] = 70,
	["HOME"] = 213, ["PAGEUP"] = 10, ["PAGEDOWN"] = 11, ["DELETE"] = 178,
	["LEFT"] = 174, ["RIGHT"] = 175, ["TOP"] = 27, ["DOWN"] = 173,
	["NENTER"] = 201, ["N4"] = 108, ["N5"] = 60, ["N6"] = 107, ["N+"] = 96, ["N-"] = 97, ["N7"] = 117, ["N8"] = 61, ["N9"] = 118
}

local mecanoGUI               = false
local PlayerData              = {}

ESX = nil
Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
	
	Citizen.Wait(5000)
	PlayerData = ESX.GetPlayerData()
end)

RegisterNetEvent('projektsantos:fakturanotify')
AddEventHandler('projektsantos:fakturanotify', function(fine, id, powod, przedrostek)

	ESX.TriggerServerCallback('esx_policejob:getOtherPlayerData', function(data)

		local name = data.firstname .. ' ' .. data.lastname
		--TriggerEvent('chat:addMessage', { args = { przedrostek .. ': ^7^*' .. name .. ' ^7^*otrzymał/a mandat w wysokości: ^2^*' .. fine .. '$ ^7^*Powód: ^2^*' .. powod}, color = { 147, 196, 109 } })

		TriggerEvent('chat:addMessage', {
			template = '<div style="padding: 0.5vw; margin: 0.5vw; background-color: rgba(69, 124, 1, 0.6); border-radius: 3px;"><i class="fas fa-globe"></i> {0}:<br> {1}</div>',
			args = { '^2Faktura^7^*', (name..' otrzymał/a fakturę medyczną w wysokości: ^2^*'..fine..'$ ^7^*Powód: '..powod) }
		})
		
	end, id)
end)


RegisterNetEvent('esx:playerLoaded')
AddEventHandler('esx:playerLoaded', function(xPlayer)
	PlayerData = xPlayer
end)

RegisterNetEvent('esx:setJob')
AddEventHandler('esx:setJob', function(job)
	PlayerData.job = job
end)

Citizen.CreateThread(function()	
	while true do
		Citizen.Wait(1)
		if PlayerData.job ~= nil and (PlayerData.job.name == 'mecano' or PlayerData.job.name == 'offmecano') then
			if IsControlJustPressed(0, Keys["PAGEDOWN"]) then
				if PlayerData.job.name == 'mecano' then
					if not mecanoGUI then
						SetNuiFocus(true, true)
						SendNUIMessage({type = 'open'})
						mecanoGUI = true
						PhonePlayAnim('text')
					end
				else
					ESX.ShowNotification("~r~Nie jesteś na służbie!")
				end
			end
		end
	end
end)

RegisterNUICallback('NUIFocusOff', function()
	SetNuiFocus(false, false)
	mecanoGUI = false
	PhonePlayAnim('out')
end)

RegisterNUICallback('mandat', function(data, cb)
    local sender = GetPlayerServerId(player)
    local closestPlayer, closestDistance = ESX.Game.GetClosestPlayer()
    if closestPlayer ~= -1 and closestDistance <= 3.0 then
        TriggerServerEvent("projektsantos:faktura", GetPlayerServerId(closestPlayer), tonumber(data.mandatamount), data.mandatreason)
    end
end)

------------------------------------------------------------------------

local myPedId = nil

local phoneProp = 0
local phoneModel = "prop_cs_tablet"
-- OR "prop_npc_phone"
-- OR "prop_npc_phone_02"
-- OR "prop_cs_phone_01"

local currentStatus = 'out'
local lastDict = nil
local lastAnim = nil
local lastIsFreeze = false

local ANIMS = {
	['cellphone@'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_listen_base',
			
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_call_out',
			['text'] = 'cellphone_call_to_text',
		}
	},
	['anim@cellphone@in_car@ps'] = {
		['out'] = {
			['text'] = 'cellphone_text_in',
			['call'] = 'cellphone_call_in',
		},
		['text'] = {
			['out'] = 'cellphone_text_out',
			['call'] = 'cellphone_text_to_call',
		},
		['call'] = {
			['out'] = 'cellphone_horizontal_exit',
			['text'] = 'cellphone_call_to_text',
		}
	}
}

function newPhoneProp()
	deletePhone()
	--(phoneModel)
	--while not HasModelLoaded(phoneModel) do
		--Citizen.Wait(1)
	--end
	phoneProp = CreateObject(GetHashKey('prop_cs_tablet'), 1.0, 1.0, 1.0, 1, 1, 0)
	local bone = GetPedBoneIndex(myPedId, 28422)
	AttachEntityToEntity(phoneProp, myPedId, bone, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 1, 1, 0, 0, 2, 1)
end

function deletePhone ()
	if phoneProp ~= 0 then
		Citizen.InvokeNative(0xAE3CBE5BF394C9C9 , Citizen.PointerValueIntInitialized(phoneProp))
		phoneProp = 0
	end
end

--[[
	out || text || Call ||
--]]
function PhonePlayAnim (status, freeze)
	if currentStatus == status then
		return
	end
	myPedId = GetPlayerPed(-1)
	local freeze = freeze or false

	local dict = "cellphone@"
	if IsPedInAnyVehicle(myPedId, false) then
		dict = "anim@cellphone@in_car@ps"
	end
	loadAnimDict(dict)

	local anim = ANIMS[dict][currentStatus][status]
	if currentStatus ~= 'out' then
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end
	local flag = 50
	if freeze == true then
		flag = 14
	end
	TaskPlayAnim(myPedId, dict, anim, 3.0, -1, -1, flag, 0, false, false, false)

	if status ~= 'out' and currentStatus == 'out' then
		Citizen.Wait(380)
		newPhoneProp()
	end

	lastDict = dict
	lastAnim = anim
	lastIsFreeze = freeze
	currentStatus = status

	if status == 'out' then
		Citizen.Wait(180)
		deletePhone()
		StopAnimTask(myPedId, lastDict, lastAnim, 1.0)
	end

end

function PhonePlayOut ()
	PhonePlayAnim('out')
end

function PhonePlayText ()
	PhonePlayAnim('text')
end

function PhonePlayCall (freeze)
	PhonePlayAnim('call', freeze)
end

function PhonePlayIn () 
	if currentStatus == 'out' then
		PhonePlayText()
	end
end

function loadAnimDict(dict)
	RequestAnimDict(dict)
	while not HasAnimDictLoaded(dict) do
		Citizen.Wait(1)
	end
end