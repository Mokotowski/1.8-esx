Config = {}

Config['Kidnapping'] = {
    ['nextNapping'] = 1800, -- seconds
    ['start'] = { -- start boss ped
        ped = {model = 'a_m_m_soucent_02', pos = vector3(176.65, -1857.16, 24.19), heading = 322.53}
    },
    ['randomSpawnCoords'] = { -- kidnapped ped spawn
        {pos = vector3(-833.02, -350.74, 38.6802), heading = 243.42},
        {pos = vector3(-197.90, -864.60, 29.3243), heading = 246.03},
        {pos = vector3(-20.242, -1721.1, 29.2882), heading = 22.81}
    },
    ['query'] = {
        scenePos = vector3(568.450, -3123.8, 18.7686),
        sceneRot = vector3(0.0, 0.0, -90.0),
        laptopScenePos = vector3(565.9, -3123.0, 18.7686),
        laptopSceneRot = vector3(0.0, 0.0, 0.0),
        tripodPos = vector3(570.572, -3123.8, 17.7086),
        cameraPos = vector3(570.572, -3123.755, 19.2986),
        cameraHeading = -90.0
    },
    videoRecordItem = 'videorecord', -- add database item
    pedToKidnapped = 'a_m_m_prolhost_01',
    rewardCash = 3000, -- reward cash to video record
    randomRewardItems = { -- reward random item for sell video record
        'bread',
        'water'
    },
    ['objects_1'] = {
        'prop_cs_wrench'
    },
    ['animations_1'] = {
        {'wrench_idle_player', 'wrench_idle_victim', 'wrench_idle_chair', 'wrench_idle_wrench'},
        {'wrench_attack_left_player', 'wrench_attack_left_victim', 'wrench_attack_left_chair', 'wrench_attack_left_wrench'},
        {'wrench_attack_mid_player', 'wrench_attack_mid_victim', 'wrench_attack_mid_chair', 'wrench_attack_mid_wrench'},
        {'wrench_attack_right_player', 'wrench_attack_right_victim', 'wrench_attack_right_chair', 'wrench_attack_right_wrench'},
    },
    ['objects_2'] = {
        'w_am_jerrycan',
        'p_loose_rag_01_s'
    },
    ['animations_2'] = {
        {'waterboard_idle_player', 'waterboard_idle_victim', 'waterboard_idle_chair', 'waterboard_idle_jerrycan', 'waterboard_idle_rag'},
        {'waterboard_kick_player', 'waterboard_kick_victim', 'waterboard_kick_chair', 'waterboard_kick_jerrycan', 'waterboard_kick_rag'},
        {'waterboard_loop_player', 'waterboard_loop_victim', 'waterboard_loop_chair', 'waterboard_loop_jerrycan', 'waterboard_loop_rag'},
        {'waterboard_outro_player', 'waterboard_outro_victim', 'waterboard_outro_chair', 'waterboard_outro_jerrycan', 'waterboard_outro_rag'}
    },
    ['objects_3'] = {
        'prop_pliers_01'
    },
    ['animations_3'] = {
        {'pull_tooth_intro_player', 'pull_tooth_intro_victim', 'pull_tooth_intro_pliers'},
        {'pull_tooth_idle_player', 'pull_tooth_idle_victim', 'pull_tooth_idle_pliers'},
        {'pull_tooth_loop_player', 'pull_tooth_loop_victim', 'pull_tooth_loop_pliers'},
        {'pull_tooth_outro_b_player', 'pull_tooth_outro_b_victim', 'pull_tooth_outro_b_pliers'},
    }
}

Strings = {
    ['attack_left'] = 'Naciśnij ~INPUT_CONTEXT~ by zaatakować od lewej',
    ['attack_mid'] = 'Naciśnij ~INPUT_CONTEXT~ by zaatakować od środka',
    ['attack_right'] = 'Naciśnij ~INPUT_CONTEXT~ by zaatakować od prawej',
    ['switch_jerrycan'] = 'Naciśnij ~INPUT_CONTEXT~ by zmienić na kanister',
    ['switch_pliers'] = 'Naciśnij ~INPUT_CONTEXT~ by zmienić na szczypce',
    ['tooth_pull'] = 'Naciśnij ~INPUT_CONTEXT~ by wyrwać ząb',
    ['tooth_rip'] = 'Naciśnij ~INPUT_CONTEXT~ by wyrwać język',
    ['blindfold'] = 'Naciśnij ~INPUT_CONTEXT~ by użyć worek na głowe',
    ['cant_blindfold'] = 'Jesteś za daleko',
    ['police_alert'] = 'Porwanie! Sprawdź gps.',
    ['query_room_busy'] = 'Pokój zapytań jest zajęty, poczekaj trochę.',
    ['wait_nextnapping'] = 'Musisz czekać tak długo, żeby znowu znowu przyjąć zlecenie',
    ['minute'] = 'Minuty.',
    ['get_job'] = 'Naciśnij ~INPUT_CONTEXT~ by przyjąć zlecenie',
    ['finish_job'] = 'Naciśnij ~INPUT_CONTEXT~ by zakończyć zlecenie',
    ['get_videorecord'] = 'Naciśnij ~INPUT_CONTEXT~  by zabrać nagranie',
    ['check_videorecord'] = 'Naciśnij ~INPUT_CONTEXT~  by sprawdzić nagranie',
    ['go_laptop'] = 'Podejdź do laptopa, aby sprawdzić nagranie',
    ['mission_failed'] = 'Misja nie powiodła się. Porwana osoba nie żyje.',
    ['mission_failed2'] = 'Misja nie powiodła się. Oddaliłeś się od porwanej osoby.',
    ['kidnap_blip'] = 'Osoba do porwania',
    ['boss_blip'] = 'Sprzedaj nagranie',
    ['info_1'] = 'Chcę, żebyś kogoś znalazł. Sprawdź gps. Jest kilka rzeczy, o które powinieneś zapytać tego człowieka.',
    ['info_2'] = 'Możesz go uwolnić po uzyskaniu odpowiedzi, których chcesz. Musisz mieć te odpowiedzi.',
    ['info_3'] = 'Nie zapomnij o nagraniu',
    ['go_query'] = 'Udaj się do pokoju przesłuchani',
    ['start_query'] = 'Naciśnij ~INPUT_CONTEXT~ by zacząć przesłuchanie',
    ['leave_vehicle'] = 'Naciśnij ~INPUT_CONTEXT~ by wyjąć osobe z auta',
    ['drop_chair'] = 'Naciśnij ~INPUT_CONTEXT~ by przewrócić krzesło',
    ['pour_gasoline'] = 'Naciśnij ~INPUT_CONTEXT~ by lać benzynę',
    ['up_chair'] = 'Naciśnij ~INPUT_CONTEXT~ by podnieść krzesło'
}