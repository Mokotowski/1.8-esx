Config                            = {}
Config.DrawDistance               = 5.0
Config.MarkerColor                = { r = 255, g = 27 , b = 6 }
Config.EnablePlayerManagement     = false -- enables the actual car dealer job. You'll need esx_addonaccount, esx_billing and esx_society
Config.EnableOwnedVehicles        = true
Config.EnableSocietyOwnedVehicles = false -- use with EnablePlayerManagement disabled, or else it wont have any effects
Config.ResellPercentage           = 50

Config.Locale                     = 'pl'

Config.LicenseEnable = TwitterCreateAccount -- require people to own drivers license when buying vehicles? Only applies if EnablePlayerManagement is disabled. Requires esx_license

-- looks like this: 'LLL NNN'
-- The maximum plate length is 8 chars (including spaces & symbols), don't go past it!
Config.PlateLetters  = 3
Config.PlateNumbers  = 3
Config.PlateUseSpace = true

Config.Zones = {

    ShopEntering = {
        Pos   = { x = -783.62, y = -212.85, z = 36.15 },
        Size  = { x = 1.5, y = 1.5, z = 1.0 },
        Type  = 27
    },

    ShopInside = {
        Pos     = { x = -792.01, y = -217.16, z = 36.41 },
        Size    = { x = 1.5, y = 1.5, z = 1.0 },
        Heading = 214.69,
        Type    = -1
    },

    ShopOutside = {
        Pos     = { x = -772.74, y = -234.7, z = 36.15 },
        Size    = { x = 1.5, y = 1.5, z = 1.0 },
        Heading = 202.61,
        Type    = -1
    },

	BossActions = {
		Pos   = { x = -32.065, y = -1114.277, z = 25.422 },
		Size  = { x = 1.5, y = 1.5, z = 1.0 },
		Type  = -1
	},

	GiveBackVehicle = {
		Pos   = { x = -18.227, y = -1078.558, z = 25.675 },
		Size  = { x = 3.0, y = 3.0, z = 1.0 },
		Type  = (Config.EnablePlayerManagement and 1 or -1)
	},

}
