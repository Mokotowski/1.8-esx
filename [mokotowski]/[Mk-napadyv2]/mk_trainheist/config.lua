Config = {}

Config['TrainHeist'] = {
    ['requiredPoliceCount'] = 3, -- required police count for start heist
    ['nextRob'] = 3600, -- seconds for next heist
    ['requiredItems'] = { -- add to database or shared
        'cutter',
        'bag'
    },
    ['reward'] = {
        itemName = 'gold', -- gold item name
        grabCount = 25, -- gold grab count
        sellPrice = 150 -- buyer sell price
    },
    ['startHeist'] ={ -- heist start coords
        pos = vector3(84.82, 190.07, 105.9445),
        peds = {
            {pos = vector3(84.15, 191.29, 105.27), heading = 187.22, ped = 's_m_m_highsec_01'},
            {pos = vector3(83.85, 189.93, 105.26), heading = 272.78, ped = 's_m_m_highsec_02'},
            {pos = vector3(86.09, 190.66, 105.27), heading = 83.42, ped = 's_m_m_fiboffice_02'}
        }
    },
    ['guardPeds'] = { -- guard ped list (you can add new)
            { coords = vector3(2850.67, 4535.49, 45.3924), heading = 270.87, model = 's_m_y_blackops_01'},
            { coords = vector3(2856.28, 4544.12, 45.3354), heading = 177.93, model = 's_m_y_blackops_01'},
            { coords = vector3(2869.90, 4530.26, 47.7877), heading = 354.93, model = 's_m_y_blackops_01'},
            { coords = vector3(2859.08, 4519.85, 47.9145), heading = 177.88, model = 's_m_y_blackops_01'},
            { coords = vector3(2843.78, 4521.66, 47.4138), heading = 268.28, model = 's_m_y_blackops_01'},
            { coords = vector3(2856.90, 4526.85, 48.6552), heading = 268.3, model = 's_m_y_blackops_01'},
            { coords = vector3(2878.67, 4556.77, 48.4119), heading = 359.44, model = 's_m_y_blackops_01'},
            { coords = vector3(2886.69, 4556.21, 48.4262), heading = 265.05, model = 's_m_y_blackops_01'},
    },
    ['finishHeist'] = { -- finish heist coords
        buyerPos = vector3(-1690.6, -916.19, 6.78323)
    },
    ['setupTrain'] = { -- train and containers coords
        pos = vector3(2872.028, 4544.253, 47.758),
        part = vector3(2883.305, 4557.646, 47.758),
        heading = 140.0,
        ['containers'] = {
            {
                pos = vector3(2885.97, 4560.83, 48.0551), 
                heading = 320.0, 
                lock = {pos = vector3(2884.76, 4559.38, 49.22561), taken = false},
                table = vector3(2886.55, 4561.53, 48.23),
                golds = {
                    {pos = vector3(2886.05, 4561.93, 49.14), taken = false},
                    {pos = vector3(2887.05, 4561.13, 49.14), taken = false},
                } 
            },
            {
                pos = vector3(2880.97, 4554.83, 48.0551), 
                heading = 140.0, 
                lock = {pos = vector3(2882.15, 4556.26, 49.22561), taken = false},
                table = vector3(2880.45, 4554.23, 48.23),
                golds = {
                    {pos = vector3(2881.05, 4553.93, 49.14), taken = false},
                    {pos = vector3(2880.25, 4554.63, 49.14), taken = false},
                } 
            }
        }
    }
}

Strings = {
    ['start_heist'] = 'Naciśnij ~INPUT_CONTEXT~ by zacząć napad na pociąg.',
    ['cutting'] = 'Naciśnij ~INPUT_CONTEXT~ aby ciąć',
    ['grab'] = 'Naciśnij ~INPUT_CONTEXT~ by zbierać',
    ['start_heist'] = 'Naciśnij ~INPUT_CONTEXT~ by zacząć napad na pociąg',
    ['goto_ambush'] = 'Udaj się do punktu przeładunkowego w GPS. Zabij strażników, przeszukaj kontenery Merryweather i ukradnij złoto..',
    ['wait_nextrob'] = 'Musisz poczekać na kolejny napad',
    ['minute'] = 'Minuty.',
    ['ambush_blip'] = 'Punk przeładunkowy',
    ['need_this'] = 'Potrzebujesz: ',
    ['deliver_to_buyer'] = 'Dostarcz do kupca łup, sprawdź gps',
    ['buyer_blip'] = 'Kupiec',
    ['need_police'] = 'Za mało policji',
    ['total_money'] = 'Otrzymałeś: ',
    ['police_alert'] = 'Napad na pociąg! Sprawdź gps.',
}

--Dont change. Main and required things.
TrainAnimation = {
    ['objects'] = {
        'tr_prop_tr_grinder_01a',
        'ch_p_m_bag_var02_arm_s'
    },
    ['animations'] = {
        {'action', 'action_container', 'action_lock', 'action_angle_grinder', 'action_bag'}
    },
    ['scenes'] = {},
    ['sceneObjects'] = {}
}

GrabGold = {
    ['objects'] = {
        'hei_p_m_bag_var22_arm_s'
    },
    ['animations'] = {
        {'enter', 'enter_bag'},
        {'grab', 'grab_bag', 'grab_gold'},
        {'grab_idle', 'grab_idle_bag'},
        {'exit', 'exit_bag'},
    },
    ['scenes'] = {},
    ['scenesObjects'] = {}
}