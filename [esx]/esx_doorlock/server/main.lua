ESX				= nil
local DoorInfo	= {}

local doors = {

	[1] = { objects = {
			[1] = {
				object = 'v_ilev_shrfdoor',
				x = 1855.0894,
				y = 3683.5247,
				z = 35.82319
			},



	},
	position = vector3(1855.2894, 3683.3247, 35.08319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[2] = { objects = {
			[1] = {
				object = 'v_ilev_rc_door2',
				x = 1856.5894,
				y = 3689.5247,
				z = 34.82319
			},
		},
	position = vector3(1856.6894, 3690.1247, 34.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[3] = { objects = {
			[1] = {
				object = 'v_ilev_rc_door2',
				x = 1856.5894,
				y = 3689.5247,
				z = 34.82319
			},
		},
	position = vector3(1856.6894, 3690.1247, 34.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[4] = { objects = {
		[1] = {
			object = 'v_ilev_rc_door2',
			x = 1850.7444, 
			y = 3683.7556, 
			z = 34.2153
		},
		[2] = {
			object = 'v_ilev_rc_door2',
			x = 1850.7444, 
			y = 3682.0781, 
			z = 34.8153
		},
	},
	position = vector3(1850.7548, 3683.0033, 34.58926),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = true,},locked = false,distance = 1.45,size = 0.6, can = false, draw = true},

	[5] = { objects = {
			[1] = {
				object = 'v_ilev_rc_door2',
				x = 1847.7444, 
				y = 3690.7556, 
				z = 34.2153
			},
			[2] = {
				object = 'v_ilev_rc_door2',
				x = 1848.7444, 
				y = 3690.8781, 
				z = 34.8153
			},
		},
	position = vector3(1848.7548, 3690.0033, 34.88926),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = true,},locked = false,distance = 1.45,size = 0.6, can = false, draw = true},


	[6] = { objects = {
			[1] = {
				object = 'v_ilev_rc_door2',
				x = 1849.9444, 
				y = 3683.2556, 
				z = 30.2153
			},
			[2] = {
				object = 'v_ilev_rc_door2',
				x = 1850.7444, 
				y = 3681.8781, 
				z = 30.2153
			},
		},
	position = vector3(1850.2548, 3682.6033, 30.88926),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = true,},locked = false,distance = 1.45,size = 0.6, can = false, draw = true},

	[7] = { objects = {
			[1] = {
				object = 'v_ilev_arm_secdoor',
				x = 1852.5894,
				y = 3686.0247,
				z = 30.82319
			},
		},
	position = vector3(1852.6894, 3686.1247, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[8] = { objects = {
			[1] = {
				object = 'v_ilev_arm_secdoor',
				x = 1855.5894,
				y = 3687.8247,
				z = 30.82319
			},
		},
	position = vector3(1855.4894, 3687.7247, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[9] = { objects = {
			[1] = {
				object = 'v_ilev_ph_cellgate1',
				x = 1859.5894,
				y = 3687.3447,
				z = 30.22319
			},
		},
	position = vector3(1859.4894, 3687.3247, 30.78319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[10] = { objects = {
			[1] = {
				object = 'v_ilev_ph_cellgate1',
				x = 1862.6894,
				y = 3689.0447,
				z = 30.22319
			},
		},
	position = vector3(1862.6894, 3689.0247, 30.78319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[11] = { objects = {
			[1] = {
				object = 'v_ilev_ph_cellgate1',
				x = 1860.8894,
				y = 3692.0447,
				z = 30.22319
			},
		},
	position = vector3(1860.46894, 3692.0247, 30.78319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[12] = { objects = {
			[1] = {
				object = 'v_ilev_ph_cellgate1',
				x = 1858.1894,
				y = 3695.0447,
				z = 30.22319
			},
		},
	position = vector3(1858.16894, 3695.5247, 30.78319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},


	[13] = { objects = {
			[1] = {
				object = 'v_ilev_shrfdoor',
				x = 1860.1894,
				y = 3691.0447,
				z = 34.22319
			},
		},
	position = vector3(1860.16894, 3691.6247, 35.08319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},



	[14] = { objects = {
		[1] = {
			object = 'gabz_mrpd_reception_entrancedoor',
			x = 434.7444, 
			y = -980.7556, 
			z = 30.8153
		},
		[2] = {
			object = 'gabz_mrpd_reception_entrancedoor',
			x = 434.7444, 
			y = -983.0781, 
			z = 30.8153
		},
	},
	position = vector3(434.7548, -981.9033, 30.88926),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = true,},locked = false,distance = 1.45,size = 0.6, can = false, draw = true},


	[15] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 440.5201, 
			y = -986.2335, 
			z = 30.82319
		},
	},
	position = vector3(441.7201, -986.2335, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[16] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 440.5201, 
			y = -977.6011,
			z = 30.82319
		},
	},
	position = vector3(441.5201, -977.6011, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},	

	[17] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 445.4067, 
			y = -984.2014,
			z = 30.82319
		},
	},
	position = vector3(445.4067, -983.2014, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},		

	[18] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_01',
			x = 438.1971, 
			y = -993.9113,
			z = 30.82319
		},
		[2] = {
			object = 'gabz_mrpd_door_01',
			x = 438.1971, 
			y = -996.3167,
			z = 30.82319
		},
	},
	position = vector3(438.1971, -995.1113, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},
	
	[19] = { objects = {
		[1] = {
			object = 'gabz_mrpd_reception_entrancedoor',
			x = 440.7392,
			y = -998.7462,
			z = 30.8153
		},
		[2] = {
			object = 'gabz_mrpd_reception_entrancedoor',
			x = 443.0618,
			y = -998.7462,
			z = 30.8153
		},
	},
	position = vector3(441.9392, -998.7462, 30.8753),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[20] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 452.2663,
			y = -995.5254,
			z = 30.82319
		},
	},
	position = vector3(453.0863, -996.3454, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},	
	
	[21] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_02',
			x = 458.0894,
			y = -995.5247,
			z = 30.82319
		},
	},
	position = vector3(457.2894, -996.3247, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[22] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 458.6543,
			y = -990.6498,
			z = 30.82319
		},
	},
	position = vector3(458.6543, -989.5498, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[23] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 458.6543,
			y = -976.8864,
			z = 30.82319
		},
	},
	position = vector3(458.6543, -977.9864, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[24] = { objects = {
		[1] = {
			object = 'gabz_mrpd_reception_entrancedoor',
			x = 455.8862,
			y = -972.2543,
			z = 30.81531
		},
		[2] = {
			object = 'gabz_mrpd_reception_entrancedoor',
			x = 458.2087,
			y = -972.2543,
			z = 30.81531
		},
	},
	position = vector3(457.0562, -972.2543, 30.87531),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[25] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_01',
			x = 469.4406,
			y = -985.0313,
			z = 30.82319
		},
		[2] = {
			object = 'gabz_mrpd_door_01',
			x = 469.4406,
			y = -987.4377,
			z = 30.82319
		},
	},

	position = vector3(469.4406, -986.2477, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},

	[26] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_02',
			x = 472.9781,
			y = -984.3722,
			z = 30.82319
		},
		[2] = {
			object = 'gabz_mrpd_door_02',
			x = 475.3837,
			y = -984.3722,
			z = 30.82319
		},
	},
	position = vector3(474.1781, -984.3722, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,},locked = true,distance = 1.45,size = 0.6, can = false, draw = true},	
	
	[27] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 475.3837,
			y = -989.8247,
			z = 30.82319
		},
		[2] = {
			object = 'gabz_mrpd_door_05',
			x = 472.9777,
			y = -989.8247,
			z = 30.82319
		},
	},
	position = vector3(474.1877, -989.8247, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[28] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 476.7512,
			y = -999.6307,
			z = 30.82319
		},
	},
	position = vector3(476.7512, -998.5307, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},	
	
	[29] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_03',
			x = 479.7507,
			y = -999.629,
			z = 30.78917
		},
	},
	position = vector3(479.7507, -998.5307, 30.86917),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},	

	[30] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_03',
			x = 487.4378,
			y = -1000.189,
			z = 30.78697
		},
	},
	position = vector3(486.2378, -1000.189, 30.86697),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},	
	
	[31] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_03',
			x = 488.0184,
			y = -1002.902,
			z = 30.78697
		},
		[2] = {
			object = 'gabz_mrpd_door_03',
			x = 485.6133,
			y = -1002.902,
			z = 30.78697
		},
	},
	position = vector3(486.8133, -1002.902, 30.86697),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[32] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 479.7534,
			y = -986.2151,
			z = 30.82319
		},
		[2] = {
			object = 'gabz_mrpd_door_05',
			x = 479.7534,
			y = -988.6204,
			z = 30.82319
		},
	},
	position = vector3(479.7534, -987.4151, 30.88319),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[33] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_01',
			x = 469.9274,
			y = -1000.544,
			z = 26.40548
		},
		[2] = {
			object = 'gabz_mrpd_door_01',
			x = 467.5222,
			y = -1000.544,
			z = 26.40548
		},
	},
	position = vector3(468.7274, -1000.544, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[34] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_02',
			x = 471.3679,
			y = -1007.7930,
			z = 26.40548
		},
		[2] = {
			object = 'gabz_mrpd_door_02',
			x = 471.3758,
			y = -1010.198,
			z = 26.40548
		},
	},
	position = vector3(471.3679, -1008.9930, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[35] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 476.6157,
			y = -1008.875,
			z = 26.48005
		},
	},
	position = vector3(476.6157, -1007.6750, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[36] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_01',
			x = 475.9539, 
			y = -1006.938,
			z = 26.40639
		},
	},
	position = vector3(474.7539, -1006.938, 26.48639),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[37] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 475.9539,
			y = -1010.819,
			z = 26.40639
		},
	},
	position = vector3(474.7539, -1010.819, 26.48639),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[38] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 477.9126, 
			y = -1012.189,
			z = 26.48005
		},
	},
	position = vector3(476.7126, -1012.189, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[39] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 480.9128, 
			y = -1012.189,
			z = 26.48005
		},
	},
	position = vector3(479.7128, -1012.189, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[40] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 483.9127, 
			y = -1012.189,
			z = 26.48005
		},
	},
	position = vector3(482.7127, -1012.189, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[41] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 486.9131, 
			y = -1012.189,
			z = 26.48005
		},
	},
	position = vector3(485.7137, -1012.189, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[42] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 484.1764, 
			y = -1007.734,
			z = 26.48005
		},
	},
	position = vector3(485.3764, -1007.734, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[43] = { objects = {
		[1] = {
			object = 'gabz_mrpd_cells_door',
			x = 481.0084,
			y = -1004.118,
			z = 26.48005
		},
	},
	position = vector3(482.2084, -1004.118, 26.56005),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[44] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_01',
			x = 479.0600, 
			y = -1003.173,
			z = 26.4065
		},
	},
	position = vector3(479.0600, -1001.973, 26.48650),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[45] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_02',
			x = 479.6638,
			y = -997.91,
			z = 26.4065,
		},
		[2] = {
			object = 'gabz_mrpd_door_02',
			x = 482.0686,
			y = -997.91,
			z = 26.4065,
		}
	},
	position = vector3(480.8638, -997.91, 26.4865),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[46] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 482.6703,
			y = -995.7285,
			z = 26.40548
		},
	},
	position = vector3(482.6703, -996.9285, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[47] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 482.6699,
			y = -992.2991,
			z = 26.40548 
		},
	},
	position = vector3(482.6703, -993.4991, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[48] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 482.6701, 
			y = -987.5792,
			z = 26.40548
		},
	},
	position = vector3(482.6701, -988.7792, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[49] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 482.6701, 
			y = -983.9868,
			z = 26.40548
		},
	},
	position = vector3(482.6701, -985.1868, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[50] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_02',
			x = 479.0624, 
			y = -985.0323,
			z = 26.40548
		},
		[2] = {
			object = 'gabz_mrpd_door_02',
			x = 479.0624, 
			y = -987.4376,
			z = 26.40548
		},
	},
	position = vector3(479.0624, -986.2376, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
	
	[51] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_03',
			x = 475.8323,
			y = -990.4839,
			z = 26.40548
		},
	},
	position = vector3(475.0323, -989.6839, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},	

	[52] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_02',
			x = 478.2892,
			y = -997.9101,
			z = 26.40548
		},
	},
	position = vector3(477.0892, -997.9101, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[53] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 471.3753,
			y = -987.4374,
			z = 26.40548
		},
		[2] = {
			object = 'gabz_mrpd_door_04',
			x = 471.3753,
			y = -985.0319,
			z = 26.40548 
		},
	},
	position = vector3(471.3753, -986.2319, 26.48548),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[54] = { objects = {
		[1] = {
			object = 'gabz_mrpd_room13_parkingdoor',
			x = 464.1566,
			y = -997.5093,
			z = 26.3707
		},
	},
	position = vector3(464.1566, -996.3093, 26.4507),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[55] = { objects = {
		[1] = {
			object = 'gabz_mrpd_room13_parkingdoor',
			x = 464.1591,
			y = -974.6656,
			z = 26.3707 
		},
	},
	position = vector3(464.1591, -975.8656, 26.4507),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[56] = { objects = {
		[1] = {
			object = 854291622,
			x = 313.5,  
			y = -595.45,
			z = 43.44
		},
	},
	position = vector3(312.9, -596.8, 43.3),jobs = { ['ambulance'] = true,}, locked = true, distance = 2.50, size = 3.6, can = true, draw = true},
	
	[57] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_03',
			x = 469.7743,
			y = -1014.406,
			z = 26.48382
		},
		[2] = {
			object = 'gabz_mrpd_door_03',
			x = 467.3686,
			y = -1014.406,
			z = 26.48382
		}
	},
	position = vector3(468.5743, -1014.406, 26.56382),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[58] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 459.9454,
			y = -990.7053,
			z = 35.10398
		},
	},
	position = vector3(458.7454, -990.7053, 35.18398),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[59] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 459.9454,
			y = -981.0742,
			z = 35.10398
		},
	},
	position = vector3(458.7454, -981.0742, 35.18398),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[60] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_04',
			x = 448.9868,
			y = -990.2007,
			z = 35.18376
		},
	},
	position = vector3(449.7868, -989.4007, 35.18376),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[61] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 448.9868,
			y = -981.5785,
			z = 35.10376
		},
	},
	position = vector3(449.7868, -982.3785, 35.18376),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[62] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_05',
			x = 448.9846,
			y = -995.5264,
			z = 35.10376
		},
	},
	position = vector3(449.7846, -996.3264, 35.18376),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},

	[63] = { objects = {
		[1] = {
			object = 'gabz_mrpd_door_03',
			x = 464.3086,
			y = -984.5284,
			z = 43.77124
		},
	},
	position = vector3(464.3086, -983.3284, 43.85124),jobs = { ['sheriff'] = true, ['offsheriff'] = true, ['police'] = true, ['offpolice'] = true, ['offpolice'] = false,}, locked = true, distance = 1.45,size = 0.6, can = false, draw = true},
		
	[64] = { objects = {
		[1] = {
			object = 'gabz_pillbox_doubledoor_l',
			x = -692.51,  
			y = 332.99,
			z = 83.12
		},
		[2] = {
			object = 'gabz_pillbox_doubledoor_r',
			x = -692.51,  
			y = 332.99,
			z = 83.12
		},
	},
	position = vector3(-692.51, 332.99, 83.12),jobs = { ['ambulance'] = true,}, locked = true, distance = 1.50,size = 0.6, can = false, draw = true},

	[65] = { objects = {
		[1] = {
			object = 'gabz_pillbox_doubledoor_l',
			x = -691.96, 
			y = 338.84,
			z = 83.12
		},
		[2] = {
			object = 'gabz_pillbox_doubledoor_r',
			x = -691.96, 
			y = 338.84,
			z = 83.12
		},
	},
	position = vector3(-691.96, 338.84, 83.12),jobs = { ['ambulance'] = true,}, locked = true, distance = 1.50,size = 0.6, can = false, draw = true},


	[66] = { objects = {
		[1] = {
			object = 'gabz_pillbox_singledoor',
			x = -690.87,  
			y = 352.04,
			z = 83.12
		},
	},
	position = vector3(-690.89, 351.82, 84.12-0.90),jobs = { ['ambulance'] = true,}, locked = true, distance = 1.50,size = 0.6, can = false, draw = true},
	
	[67] = { objects = {
		[1] = {
			object = 'gabz_pillbox_singledoor',
			x = -690.48,  
			y = 356.73,
			z = 83.12
		},
	},		
	position = vector3(-690.48, 356.73, 84.12-0.90),jobs = { ['ambulance'] = true,}, locked = true, distance = 1.50,size = 0.6, can = false, draw = true},

	[68] = { objects = {
		[1] = {
			object = 'gabz_pillbox_singledoor',
			x = -689.93,  
			y = 363.20,
			z = 84.12
		},
	},		
	position = vector3(-689.93, 363.20, 84.12-0.90),jobs = { ['ambulance'] = true,}, locked = true, distance = 1.50,size = 0.6, can = false, draw = true},
	
	[69] = { objects = {
		[1] = {
			object = 'v_ilev_cor_doorglassa',
			x = 1826.2,  
			y = 3681.7,
			z = 34.2
		},
		[2] = {
			object = 'v_ilev_cor_doorglassb',
			x = 1825.6,
			y = 3681.6,
			z = 34.2
		},
	},			
	position = vector3(1826.1, 3681.4, 34.7),jobs = { ['ambulance'] = true,}, locked = true, distance = 1.50,size = 0.6, can = false, draw = true},

	[70] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -453.05,
			y = -305.36,
			z = 34.91
		},
	},
	position  = vector3(-453.05,-305.36, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[71] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -455.19,
			y = -299.82,
			z = 34.91
		},
	},
	position  = vector3(-455.19,-299.82, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[72] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -457.43,
			y = -294.56,
			z = 34.91
		},
	},
	position  = vector3(-457.43,-294.56, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[73] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -443.02,
			y = -316.44,
			z = 34.91
		},
	},
	position  = vector3(-443.02,-316.44, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[74] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -447.01,
			y = -306.18,
			z = 34.91
		},
	},
	position  = vector3(-447.01,-306.18, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[75] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -449.36,
			y = -300.51,
			z = 34.91
		},
	},
	position  = vector3(-449.36,-300.51, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[76] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -452.87,
			y = -292.28,
			z = 34.91
		},
	},
	position  = vector3(-452.87,-292.28, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	
	[77] = { objects = {
		[1] = {
			object = 'gus_hos_door',
			x = -440.57,
			y = -322.28,
			z = 34.91
		},
	},
	position  = vector3(-440.57,-322.28, 34.91),jobs = { ['ambulance'] = true, ['offambulance'] = true,},locked = true, distance = 1.5,size = 0.6, can = false, draw = true},
	



	
}









TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

RegisterServerEvent('esx_doorlock:updateState')
AddEventHandler('esx_doorlock:updateState', function(id, state)
	local xPlayer = ESX.GetPlayerFromId(source)
	doors[id].locked = state 
	TriggerClientEvent('esx_doorlock:update', -1, id, state)
end)

ESX.RegisterServerCallback('esx_door:get', function(source, cb)
	cb(doors)
end)

function IsAuthorized(jobName, doorID)
	for i=1, #doorID.authorizedJobs, 1 do
		if doorID.authorizedJobs[i] == jobName then
			return true
		end
	end
	return false
end