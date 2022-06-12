Config = {}
Config.distance = 1.5
Config.Car = "comet2"
Config.Plate = "ELECTRIC"
Config.framework = "esx" -- Esx or qbcore, easy to adapt to your framework.

Config.Pay = math.random(500,1000)
Config.Account = 'bank' --This is where the money is go.

Config.postes = {
	{prop = 'prop_streetlight_01', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_streetlight_01b', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_streetlight_03b', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
	{prop = 'prop_telegraph_01b', scenario = 'PROP_HUMAN_SEAT_BENCH', verticalOffset = -0.5, forwardOffset = 0.0, leftOffset = 0.0, angularOffset = 180.0},
}

Config.TiempoParaArreglar = 6  -- Segundos

Config.Locales = {
	iniciarrepa = "Naciśnij  ~b~Y~w~  ABY ROZPOCZĄĆ NAPRAWĘ",
	ponerescalera = "Naciśnij  ~b~Y~w~  USTAWIĆ DRABINĘ",
	sacarescalera = "Naciśnij  ~b~Y~w~  BY ZŁAPAĆ DRABINĘ",
	espera = "Czekanie ~b~ ", -- ..seconds 
	tofinish = "~w~ sekund do zakończenia naprawy.",
	startjob = "Naciśnij  ~b~E~w~   BY ROZPOCZĄĆ PRACĘ",
	jobiniciado = "Rozpoczęła się praca, idź na parking.",
	endjob = "Wciśnij  ~b~E~w~  ABY ZAKOŃCZYĆ PRACĘ",
	jobterminado = "Skończyłeś/aś pracę",
	saveescalera = "Naciśnij  ~b~E~w~  PRZECHOWYWANIE DRABINKI",
	cogerescala = "Naciśnij  ~b~E~w~  BY ZŁAPAĆ DRABINĘ"
}


--ESX CLOTHES--
--Clothes
Config.Clothes = {
    male = {
        ['tshirt_1'] = 0,  ['tshirt_2'] = 0,
        ['torso_1'] = 122,   ['torso_2'] = 0,
        ['arms'] = 1,  ['pants_1'] = 5,
    },
    female = {
        ['tshirt_1'] = 15,  ['tshirt_2'] = 0,
        ['torso_1'] = 4,   ['torso_2'] = 14,
        ['arms'] = 4,
        ['pants_1'] = 25,   ['pants_2'] = 1,
        ['shoes_1'] = 16,   ['shoes_2'] = 4,
    }
}

---qbcore clothes--

Config.Uniforms = {
	['male'] = {
		outfitData = {
			['t-shirt'] = {item = 15, texture = 0},
			['torso2']  = {item = 56, texture = 0},
			['arms']    = {item = 85, texture = 0},
			['pants']   = {item = 45, texture = 4},
			['shoes']   = {item = 42, texture = 2},
		}
	},
	['female'] = {
	 	outfitData = {
			['t-shirt'] = {item = 14, texture = 0},
			['torso2']  = {item = 22, texture = 0},
			['arms']    = {item = 85, texture = 0},
			['pants']   = {item = 47, texture = 4},
			['shoes']   = {item = 98, texture = 1},
	 	}
	},
}