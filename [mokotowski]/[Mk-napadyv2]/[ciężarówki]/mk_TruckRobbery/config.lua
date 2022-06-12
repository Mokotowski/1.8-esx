Config = {}

-- Police Settings:
Config.RequiredPoliceOnline = 3	-- required police online for players to do missions
Config.PoliceDatabaseName = "police"	-- set the exact name from your jobs database for police
Config.PoliceNotfiyEnabled = true		-- police notification upon truck robbery enabled (true) or disabled (false)
Config.PoliceBlipShow = true			-- enable or disable blip on map on police notify
Config.PoliceBlipTime = 30				-- miliseconds that blip is active on map (this value is multiplied with 4 in the script)
Config.PoliceBlipRadius = 50.0			-- set radius of the police notify blip
Config.PoliceBlipAlpha = 250			-- set alpha of the blip
Config.PoliceBlipColor = 5				-- set blip color

-- Set cooldown timer, which player has to wait before being able to do a mission again, in minutes here:
Config.CooldownTimer = 90

-- Enable or disable player wearing a 'heist money bag' after the robbery:
Config.EnablePlayerMoneyBag = false

-- Hacking Settings:
Config.EnableAnimationB4Hacking = true		-- enable/disable hacking or typing animation
Config.HackingBlocks = 4						-- amount of blocks u have to match
Config.HackingSeconds = 60						-- seconds to hack

-- Mission Cost Settings:
Config.MissionCost = 100		            -- taken from bank account // set to 0 to disable mission cost

-- Reward Settings:
Config.MinReward = 5000						-- set minimum reward amount
Config.MaxReward = 15000						-- set maximum reward amount
Config.RewardInDirtyMoney = true			-- reward as dirty money (true) or as normal cash (false)
Config.EnableItemReward = false 				-- requires to add your desired items into your items table in database
Config.ItemName1 = "folia"				-- exact name of your item1
Config.ItemMinAmount1 = 2			-- set minimum reward amount of item1
Config.ItemMaxAmount1 = 3					-- set maximum reward amount of item1
Config.EnableRareItemReward = false			-- add another item as reward but this has only 25% chance 
Config.ItemName2 = "labcard"				-- exact name of your item2
Config.ItemMinAmount2 = 1					-- set minimum reward amount of item2
Config.ItemMaxAmount2 = 3					-- set maximum reward amount of item2
Config.RandomChance = 20					-- Set chance, 1/2 is default, which is 50% chance. If u e.g. change value to 4, then 1/4 equals 25% chance.

-- Mission Blip Settings:
Config.EnableMapBlip = false							-- set between true/false
Config.BlipNameOnMap = "Zlecenie na Ciężarówke"		-- set name of the blip
Config.BlipSprite = 67								-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipDisplay = 4								-- set blip display behaviour, find list of types here: https://runtime.fivem.net/doc/natives/#_0x9029B2F3DA924928
Config.BlipScale = 0.7								-- set blip scale/size on your map
Config.BlipColour = 5								-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/

-- Armored Truck Blip Settings:
Config.BlipNameForTruck = "Ciężarówka"			-- set name of the blip
Config.BlipSpriteTruck = 632						-- set blip sprite, lists of sprite ids are here: https://docs.fivem.net/game-references/blips/
Config.BlipColourTruck = 66							-- set blip color, list of colors available in the bottom of this link: https://docs.fivem.net/game-references/blips/
Config.BlipScaleTruck = 0.9							-- set blip scale/size on your map

-- Mission Start Location:
Config.MissionSpot = {
	{ ["x"] = -569.05, ["y"] = 227.9, ["z"] = 74.89, ["h"] = 0 },
}

-- Mission Marker Settings:
Config.MissionMarker = 27 												-- marker type
Config.MissionMarkerColor = { r = 255, g = 27, b = 7, a = 500 } 		-- rgba color of the marker
Config.MissionMarkerScale = { x = 1.5, y = 1.5, z = 1.0 }  			-- the scale for the marker on the x, y and z axis
Config.Draw3DText = "Naciśnij ~g~[E]~s~ aby wziąść ~y~Zlecenie~s~"		-- set your desired text here

-- Control Keys
Config.KeyToStartMission = 38	-- default: [E] // set key to start the mission
Config.KeyToOpenTruckDoor = 47
Config.KeyToRobFromTruck = 38										

-- ESX.ShowNotifications:
Config.NoMissionsAvailable = "Nie ma aktyalnie ~y~zleceń~s~ przyjdź później!"
Config.HackingFailed = "~r~Nieduane~s~ Hakowanie~s~"
Config.TruckMarkedOnMap = "~y~Openczerzony Wóz~s~ został zaznaczony na twojej mapie"
Config.KillTheGuards = "~r~Zlikwiduj~s~ ochroniarzy ~y~Ciężarówki~s~"
Config.MissionCompleted = "~g~Udało ci się~s~ ~r~obrabować~s~ ~y~Ciężarówke~s~ Uciekaj!"
Config.BeginToRobTruck = "Udaj się do ~y~Ciężarówki~s~ a następnie ją okradnij"
Config.GuardsNotKilledYet = "Wyrzuć z pojazdu ~b~kierowce~s~ oraz ~b~pasażera~s~"
Config.TruckIsNotStopped = "Zatrzymaj ~y~Ciężarówke~s~ przed ~r~napadnięciem~s~!"
Config.NotEnoughMoney = "Potrzebujesz ~g~$"..Config.MissionCost.."~s~ na swoim koncie ~b~bankowym~s~ aby dostać ~y~zlecanie~s~"
Config.NotEnoughPolice = "Aby dostać ~y~zlecenie~s~ musi być: ~b~"..Config.RequiredPoliceOnline.. " policjantów na służbie!"
Config.CooldownMessage = "Kolejne  ~y~Zlecanie~s~ za: ~b~%s minutes~s~"
Config.RewardMessage = "Zebrałeś ~g~$%s ~s~z ~y~Ciężarówki~s~"
Config.Item1Message = "Zebrałeś ~b~%sx~s~ Złote zegarki"
Config.Item2Message = "Zebrałeś ~b~%sx~s~ Sztabki złota"
Config.DispatchMessage = "^3 10-90 ^0 Napad na ciężaówke ^5%s^0"

-- ESX.ShowHelpNotifications:
Config.OpenTruckDoor = "Naciśnij ~INPUT_DETONATE~ aby otworzyć drzwi"
Config.RobFromTruck = "Naciśnij ~INPUT_PICKUP~ aby obrabować ciężarówke"

Config.Progress1 = "Zbieranie informacji o ciężarówce"
Config.Progress2 = "Podkładanie C4"
Config.Progress3 = "Uciekaj!"
Config.Progress4 = "Okradanie..."

-- ProgressBar Timers, in seconds:
Config.RetrieveMissionTimer = 22.5	-- time from pressed E to receving location on the truck
Config.DetonateTimer = 7.5			-- time until bomb is detonated
Config.RobTruckTimer = 20			-- time spent to rob the truck

-- Guards Weapons:
Config.DriverWeapon = "WEAPON_PUMPSHOTGUN"		-- weapon for driver
Config.PassengerWeapon = "WEAPON_SMG" 			-- weapon for passenger

-- Armored Truck Spawn Locations
Config.ArmoredTruck = 
{
	{ 
		Location = vector3(-1327.479736328,-86.045326232910,49.31), 
		InUse = false
	},
	{ 
		Location = vector3(-2075.888183593,-233.73908996580,21.10), 
		InUse = false
	},
	{ 
		Location = vector3(-972.1781616210,-1530.9045410150,4.890), 
		InUse = false
	},
	{ 
		Location = vector3(798.184265136720,-1799.8173828125,29.33), 
		InUse = false
	},
	{ 
		Location = vector3(1247.0718994141,-344.65634155273,69.08), 
		InUse = false
	}
}

