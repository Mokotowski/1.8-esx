Config                            = {}

Config.DrawDistance							= 35.0
Config.MarkerColor							= { r = 255, g = 27, b = 6 }
Config.MarkerSize								= { x = 1.5, y = 1.5, z = 1.0 }
Config.DeleteMarkerSize					= { x = 3.0, y = 3.0, z = 1.0 }
Config.DeathCameraRadius					= 1.5
Config.ReviveReward							= 2000  -- revive reward, set to 0 if you don't want it enabled
Config.EnableSocietyOwnedVehicles	= false
Config.AntiCombatLog						= true -- enable anti-combat logging?
Config.Locale										= 'pl'
Config.EnablePeds = true
Config.DoctorLimit = true
Config.maxDoctor = 2
Config.doctorPrice = 2500

Config.LicensePrice							= {
	[3] = 15000,
	[7] = 30000,
	[14] = 50000,
	[30] = 90000
}

Config.Doctor = {
    {x = 320.11, y = -589.18, z = 43.20, heading = 160.19, type = 'legal'},
    {x = 349.33, y = -587.7, z = 28.8, heading = 256.19, type = 'legal'},
    {x = -248.0, y = 6320.42, z = 32.43, heading = 353.19, type = 'legal'},

}

Config.RespawnToHospitalDelay		= 300000
Config.RemoveWeaponsAfterRPDeath	= true
Config.RemoveCashAfterRPDeath		= true
Config.RemoveItemsAfterRPDeath		= true

Config.Blips = {
    {
        Pos     = { x = -809.51, y = -1234.84, z = 7.15 },
        Sprite  = 61,
        Display = 4,
        Scale   = 0.8,
        Colour  = 2,
        Label = _U('hospital')
    },
	{
        Pos     = { x = -247.28, y = 6321.84, z = 7.15 },
        Sprite  = 61,
        Display = 4,
        Scale   = 0.8,
        Colour  = 2,
        Label = _U('hospital')
    },
	{
        Pos     = { x = 302.51, y = -586.84, z = 7.15 },
        Sprite  = 61,
        Display = 4,
        Scale   = 0.8,
        Colour  = 2,
        Label = _U('szpital')
    }
}

Config.DeathPosition = {
	x = -807.79, y = -1222.62, z = 7.34, heading = 136.77
}

Config.AuthorizedVehicles = {
	{
		grade = 0,
		model = 'stretcher',
		label = 'Nosze',
		livery = 0,
	},
	{
		grade = 0,
		model = 'f450ambo',
		label = 'Karetka',
		livery = 0
		
	},

}


Config.Ilosc = {
	{x = -814.51, y = -1234.47, z = 7.34}
}

Config.Zones = {
	--[[HospitalInteriorElevator1 = { -- Pillbox main elevator
		Pos	= { x = 335.9275, y = -580.0391, z = 27.9511 },
		Teleport = { x = 335.2135, y = -581.6018, z = 27.9511, heading = 158.56 },
		Type = 1
	},

	HospitalInteriorElevator2 = {
		Pos	= { x = 335.9061, y = -579.9466, z = 42.341 },
		Teleport = { x = 335.2173, y = -581.7332, z = 42.3353, heading = 160.73 },
		Type = 1
	},

	HospitalInteriorElevator3 = {
		Pos	= { x = 335.8353, y = -580.11, z = 47.2909 },
		Teleport = { x = 335.2168, y = -581.7358, z = 47.2742, heading = 162.76 },
		Type = 1
	},

	HospitalInteriorElevator4 = {
		Pos	= { x = 335.8838, y = -579.9323, z = 73.1204 },
		Teleport = { x = 335.2468, y = -581.6038, z = 73.1188, heading = 156.18 },
		Type = 1
	},

	HospitalInteriorEntering1 = { -- Pillbox second elevator
		Pos	= { x = 331.0914, y = -593.0497, z = 27.9511 },
		Teleport = { x = 331.8472, y = -591.3918, z = 42.332, heading = 341.5 },
		Type = 1
	},

	HospitalInteriorExit1 = {
		Pos	= { x = 331.064, y = -593.1516, z = 42.332 },
		Teleport = { x = 331.8382, y = -591.4169, z = 27.9511, heading = 340.78 },
		Type = 1
	},

	HospitalInteriorEntering2 = { -- LSFD floor
		Pos	= { x = 1128.2247, y = -1510.0708, z = 38.7765 },
		Teleport = { x = 1121.6097, y = -1516.8363, z = 29.725, heading = 327.27 },
		Type = 1
	},

	HospitalInteriorExit2 = {
		Pos	= { x = 1121.6097, y = -1516.8363, z = 29.725 },
		Teleport = { x = 1128.2247, y = -1510.0708, z = 38.7765, heading = 269.64 },
		Type = 1
	},

	HospitalInteriorEntering3 = { -- LSFD back
		Pos	= { x = 1102.2629, y = -1528.6625, z = 34.0826 },
		Teleport = { x = 1175.8319, y = -1556.2474, z = 29.5386, heading = 321.82 },
		Type = 1
	},

	HospitalInteriorExit3 = {
		Pos	= { x = 1175.8319, y = -1556.2474, z = 29.5386 },
		Teleport = { x = 1102.2629, y = -1528.6625, z = 34.0826, heading = 176.2 },
		Type = 1
	},

	HospitalInteriorEntering4 = { -- Eclipse Rooftop
		Pos	= { x = -668.6606, y = 350.3919, z = 82.2046 },
		Teleport = { x = -689.8287, y = 322.7919, z = 139.198, heading = 85.39 },
		Type = 1
	},

	HospitalInteriorExit4 = {
		Pos	= { x = -689.8287, y = 322.7919, z = 139.198 },
		Teleport = { x = -668.6606, y = 350.3919, z = 82.2046, heading = 175.63 },
		Type = 1
	},]]

	--ECLIPSE
	AmbulanceActions = {
		Pos	= { x = -826.18, y = -1237.2, z = 6.34 },
		Type = 27
	},

	Pharmacy = {
		Pos	= { x = -821.93, y = -1240.73, z = 6.44 },
		Type = 27
	},

	BossActions = { 
		Pos	= { x = -791.11, y = -1245.64, z = 6.34 },
		Type = 27
	},

	VehicleSpawner = {
		Pos	= { x = -824.65, y = -1226.48, z = 6.0 },
		Type = 27
	},

	VehicleSpawnPoint = {
		Pos	= { x = -821.68, y = -1206.8, z = 6.3 },
		Heading = 50.0,
		Type = -1
	},
	
	VehicleDeleter = {
		Pos	= { x = -818.81, y = -1216.64, z = 7.0 },
		Type = 36
	},

	HeliDeleter = {
		Pos	= {  x = -794.46, y = -1188.6, z = 53.03 },
		Type = 34
	},

	HeliSpawner = {
		Pos	= { x = -775.7, y = -1205.84, z = 50.25 },
		Type = 27
	},

	HeliSpawnPoint = {
		Pos	= { x = -791.15, y = -1191.61, z = 53.03 },
		Heading = 49.17,
		Type = -1
	},

	
	--PLAETO
	AmbulanceActions3 = {
		Pos	= { x = -249.18, y = 6326.46, z = 31.5 },
		Type = 27
	},

	Pharmacy3 = {
		Pos	= { x = -259.50, y = 6312.57, z = 31.50 },
		Type = 27
	},

	BossActions3 = {
		Pos	= { x = -269.66, y = 6320.33, z = 31.50 },
		Type = 27
	},
--------------------------------------------------------------------------------------
	VehicleSpawner2 = {
		Pos	= { x = 253.75, y = 6339.36, z = -31.45 },
		Type = 27
	},

	VehicleSpawnPoint2 = {
		Pos	= { x = 244.0, y = 6339.05, z = -31.35 },
		Heading = 225.2,
		Type = -1
	},

	VehicleDeleter2 = {
		Pos	= { x = 259.63, y = 6347.79, z = -32.36 },
		Type = 36
	},

	HeliDeleter2 = {
		Pos	= { x = -252.52, y = 6319.08, z = 39.8 },
		Type = 34
	},

	HeliSpawner2 = {
		Pos	= {  x = -255.6, y = 6312.86, z = 38.76  },
		Type = 27
	},

	HeliSpawnPoint2 = {
		Pos	= { x = -252.43, y = 6319.24, z = 38.66  },
		Heading = 248.17,
		Type = -1
	}
}