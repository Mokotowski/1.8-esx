local veh = nil
local tesla_blip = nil
local tesla_pilot = false
local tesla_pilot_ped = nil
local tesla_dance = false

local pilot = false
local crash = false
local dance = false
local crash_ped_fl = nil
local crash_ped_fr = nil
local crash_ped_rl = nil
local crash_ped_rr = nil



RegisterCommand("autopilot", function(source, args)
	
	waypoint = Citizen.InvokeNative(0xFA7C7F0AADF25D09, GetFirstBlipInfoId(8), Citizen.ResultAsVector())
				print(waypoint)
				if(IsWaypointActive()) then
					if(pilot) then
						pilot = false
						minimap("Auto-Pilot anulowany.")
						ClearPedTasks(GetPlayerPed(-1))
					else
						pilot = true
						minimap("Auto-Pilot aktywny.")
						TaskVehicleDriveToCoord(GetPlayerPed(-1), GetVehiclePedIsIn(GetPlayerPed(-1), 0), waypoint["x"], waypoint["y"], waypoint["z"], 100.0, 1.0, GetHashKey(GetVehiclePedIsIn(GetPlayerPed(-1), 0)), 786603, 1.0, 1)
						Citizen.CreateThread(function()
							while pilot do
								Wait(100)
								if(GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(-1))["x"], GetEntityCoords(GetPlayerPed(-1))["y"], GetEntityCoords(GetPlayerPed(-1))["z"], waypoint["x"], waypoint["y"], waypoint["z"], 0) < 10.0) then
									while GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0)) - 1.0 > 0.0 do
										SetVehicleForwardSpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0), GetEntitySpeed(GetVehiclePedIsIn(GetPlayerPed(-1), 0)) - 1.0)
										Wait(100)
									end
									pilot = false
									ClearPedTasks(GetPlayerPed(-1))
									minimap("Auto-Pilot wyłączony.")
								end
							end
						end)
					end
				else
					minimap("Ustaw gps.")
				end
end, false)

function minimap(text)
	SetNotificationTextEntry("STRING")
	AddTextComponentString(text)
	DrawNotification(0,1)
end

function translatespeed(float)
local speed = float + 11
return speed
end

autopilotenabled = false
