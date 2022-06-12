-- ############################################
-- --------------------------------------------
-- 3dme : /me command but its 3D printed
-- Author : Elio
-- Client side
-- --------------------------------------------
-- ############################################

-- --------------------------------------------
-- Settings
-- --------------------------------------------

local defaultScale = 0.5 -- Text scale
local color = { r = 255, g = 255, b = 255, a = 255 } -- Text color
local font = 0 -- Text font
--local displayTime = 5000 -- Duration to display the text (in ms)
local distToDraw = 70 -- Min. distance to draw 

-- --------------------------------------------
-- Variable
-- --------------------------------------------

local pedDisplaying = {}

-- --------------------------------------------
-- Functions
-- --------------------------------------------

-- OBJ : draw text in 3d
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function DrawText3D(coords, text)
    local camCoords = GetGameplayCamCoord()
    local dist = #(coords - camCoords)
    
    -- Experimental math to scale the text down
    local scale = 150 / (GetGameplayCamFov() * dist)
	local text = ' ' .. text .. ' '

    --if onScreen then

        -- Format the text
        SetTextColour(color.r, color.g, color.b, color.a)
        SetTextScale(0.0, defaultScale * scale)
        SetTextDropshadow(0, 0, 0, 0, 20)
        SetTextDropShadow()
        SetTextCentre(true)

        -- Diplay the text
        BeginTextCommandDisplayText("STRING")
        AddTextComponentSubstringPlayerName(text)
        SetDrawOrigin(coords, 0)
        EndTextCommandDisplayText(0.0, 0.0)
        ClearDrawOrigin()
        
end


-- OBJ : handle the drawing of text above a ped head
-- PARAMETERS :
--      - coords : world coordinates to where you want to draw the text
--      - text : the text to display
local function Display(ped, text)

    local playerPed = PlayerPedId()
    local playerCoords = GetEntityCoords(playerPed)
    local pedCoords = GetEntityCoords(ped)
    local dist = #(playerCoords - pedCoords)

    if dist <= distToDraw then

        pedDisplaying[ped] = (pedDisplaying[ped] or 1) + 1

		
		if string.len(text) > 0 then
			display = true
		else
			display = false
		end
        --[[Citizen.CreateThread(function()
            Wait(displayTime)
            display = false
        end)]]

        -- Display
        local offset = -0.4 + pedDisplaying[ped] * 0.2
			while display do
				if HasEntityClearLosToEntity(playerPed, ped, 17 ) then
					local x, y, z = table.unpack(GetEntityCoords(ped))
					z = z + offset
					DrawText3D(vector3(x, y, z), text)
				end
				Wait(0)
				if not display then 
					break 
				end
			end

        pedDisplaying[ped] = pedDisplaying[ped] - 1

    end
end

-- --------------------------------------------
-- Event
-- --------------------------------------------

RegisterNetEvent('3dme:shareDisplay')
AddEventHandler('3dme:shareDisplay', function(text, serverId)
    local ped = GetPlayerPed(GetPlayerFromServerId(serverId))
    Display(ped, text)
end)
