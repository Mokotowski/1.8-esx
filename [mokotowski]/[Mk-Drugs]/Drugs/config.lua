Config = {}


Config.ESXLibrary = 'esx:getSharedObject' 
Config.FolderNameMythicProgbar = 'mythic_progbar'  
Config.UseNewESX = false
Config.EnablePoliceNotify = true 
Config.PoliceNotifyBlipSpirit = 161
Config.PoliceNotifyBlipScale = 1.0
Config.PoliceNotifyBlipColor = 1


--__--__--__--__-- BLIPS --__--__--__--__--

Config.EnableWeedBlip = false
Config.WeedBlipName = "Weed Labaratory"

Config.EnableCokeBlip = false
Config.CokeBlipName = "Cocaine Labaratory"

Config.EnableAmfetamingBlip = false
Config.AmfetaminBlipName = "Amfetamin Labaratory"


--COORDINATES
Config.Teleports = {
    --Teleport IN & OUT
    TeleportCoords = {
        --WEED
        TeleportForWeedIN = {
            vector3(-428.64, -1728.36, 19.8)
        },
        TeleportForWeedOUT = {
            vector3(1066.28, -3183.56, -39.16)
        },
        --COKE
        TeleportForCokeIN = {
            vector3(-1321.88, -247.52, 42.48)
        },
        TeleportForCokeOUT = {
            vector3(1088.68, -3187.52, -39.0)
        },     
        --Amfetamin
        TeleportForAmfetaminIN = {
            vector3(-1310.088, -247.52, 42.48)
        },
        TeleportForAmfetaminOUT = {
            vector3(997.15, -3200.65, -36.4)
        },      
    }
}

--Coordinates for Weed
Config.Weed = {
    Loc = {
        WeedGatheringIndica = {
            vector3(1053.08, -3197.54, -38.66),
            vector3(1049.92, -3194.5, -38.66),
            vector3(1056.16, -3197.54, -38.66),
            vector3(1057.48, -3200.32, -38.66),
            vector3(1057.24, -3202.26, -38.66),
            vector3(1056.0, -3200.42, -38.66)
        },
        WeedGatheringSativa = {
            vector3(1053.03, -3195.92, -38.66),
            vector3(1051.16, -3194.58, -38.66),
            vector3(1058.84, -3197.98, -38.66),
            vector3(1058.76, -3201.9, -38.66),
            vector3(1055.96, -3198.9, -38.66)
        },
        WeedGatheringPurpleHaze = {
            vector3(1052.94, -3194.46, -38.66),
            vector3(1057.44, -3198.42, -38.66),
            vector3(1058.72, -3199.86, -38.66),
            vector3(1055.88, -3201.86, -38.66)
        },
        WeedProcessing = {
            vector3(1043.44, -3200.12, -37.96)
        },
        WeedPacking = {
            vector3(1037.6, -3205.36, -38.16)
        }
    }
}

--Coordinates For Coke
Config.Coke = {
    Loc = {
        RawCoke = {
            vector3(1090.2, -3196.2, -39.0),
            vector3(1095.32, -3195.32, -39.0)
        },
        MixingCoke = {
            vector3(1099.12, -3194.08, -39.0),
            vector3(1101.96, -3193.08, -39.0)
        },
        PackingCoke = {
            vector3(1100.36, -3198.8, -39.0)
        }
    }
}

--Coordinates For Amfetamin
Config.Amfetamin = {
    Loc = {
        DrawText1 = {
			vector3(1002.89, -3199.91, -38.82)
		},
		DrawText2 = {
			vector3(1005.85, -3201.31, -38.52)
		},
		DrawText3 = {
			vector3(1014.72, -3198.04, -38.66)
		},
		DrawText4 = {
			vector3(1010.48, -3196.94, -38.99)
		},
		Meth1st = {
			vector3(1002.89, -3199.91, -38.4)
		},
		Meth2nd = {
			vector3(1005.85, -3200.31, -38.56)
		},
		Meth3rd = {
			vector3(1012.01, -3194.89, -38.99)
		},
		Meth4th = {
			vector3(1016.55, -3194.87, -38.99)
		},
        CoolingDrawText = {
            vector3(1007.28, -3201.01, -38.5) -- od czasu
        }
    }
}


Config.Translate = {
    [1] = "~w~[~r~E~w~] ~s~Wyjdź",
    [2] = "~w~[~r~E~w~] ~s~Otwórz Drzwi",
    [3] = "|Sadzonka ~c~słaba~s~|",
    [4] = "|Jakość: ~b~Dobra¦~s~|",
    [5] = "|Jakość: ~y~Bardzo Dobra¦~s~|",
    [6] = "|Sadzonka ~c~średnia~s~|",
    [8] = "|Jakość: ~g~Najlepsza¦~s~|",
    [7] = "|Sadzonka ~c~mocna~s~|",
    [9] = "~w~[~r~E~w~] ~s~Zbieranie",
    [34] = "Nie masz więcej miejsca",
    [35] = "~g~Cudownie~s~! Właśnie przyciąłeś roślinę.",
    [55] = "~w~[~r~E~w~] ~s~Suszenie marichuany",
    [56] = "Czas schnięcia: ~y~",
    [64] = "~w~[~r~E~w~] ~s~Spakowana marichuana",
    [65] = "Suszona słaba: ~y~",
    [75] = "Suszona średnia: ~y~",
    [76] = "Suszona mocna: ~y~",
    [66] = "| Procesz suszenia - Jaką roślinę chcesz wysłuszyć?|",
    [111] = "Nie posiadasz dość słabej.",
    [112] = "Nie posiadasz dość średniej.",
    [113] = "Nie posiadasz dość mocnej.",
    [432] = "Proces suszenia się zakończył.",
    [333] = "Nie masz wystarczająco dużo wysuszonej rośliny, aby ją przyciąć i wyczyścić.",
    [356] = "Oczyściłeś i spakowałeś marichuane, masz swój produkt końcowy:~y~ ",
    [442] = "Przycinanie słabej sadzonki. . .",
    [443] = "Przycinanie średniej sadzonki. . .",
    [444] = "Przycinanie mocnej sadzonki. . .",
    [888] = " plant",
    [385] = "Czyszczenie >> Przycinanie >> Pakowanie słabej. . .",
    [387] = "Czyszczenie >> Przycinanie >> Pakowanie średniej. . .",
    [388] = "Czyszczenie >> Przycinanie >> Pakowanie mocnej. . .",
    [433] = "Jaki rodzaj zioła chcesz spakować",
    --COKE
    [599] = "~w~[~r~E~w~] ~s~Surowa kokaina",
    [600] = "Surowa kokaina: ~y~",
    [601] = "Klasyfikacja. . .",
    [602] = "Mieszanie kokainy. . .",
    [603] = "Nie posiadasz wystarczająco ~r~Surowej kokainy~s~ aby ją zmiksować.",
    [604] = "Mieszanie Kokainy: ~y~",
    [605] = "~w~[~r~E~w~] ~s~Mieszanie kokainy",
    [606] = "Potrzebujesz ~y~mąki~s~ do wymieszania z kokainą.",
    [607] = "~w~[~r~E~w~] ~s~Paczka kokainy",
    [608] = "Nie masz wystarczającej ilości ~r~Mieszanej kokainy~s~ aby ją zapakować! Potrzebujesz co najmniej ~y~10g~s~.",
    [618] = "PAKOWANIE KOKAINY. . .",
    [609] = "Pomyślnie zapakowałeś ~g~10g~s~ ~y~Kokainy.~s~",
    [610] = "Mieszanie Kokainy: ~y~",
    --POLICE NOTIFY
    [355] = "Nieznana osoba",
    [358] = "Nielegalne działania",
    [357] = "Przetwarzanie narkotyków w toku.",
    --AMFETAMIN
    [120] = "Amfetamin-węglowodory: ~r~",
    [121] = " ~w~l",
    [122] = "lodówka: ~r~",
    [123] = "Ciecz chłodzona: ~r~",
    [124] = "Przetworzone rzeczy: ~r~",
    [125] = "[~r~E~w~] ~w~Płyn A/D",
    [126] = "[~r~E~w~] ~w~Chłodzenie",
    [127] = "[~r~E~w~] ~w~Mieszanie",
    [128] = "[~r~E~w~] ~w~Produkt końcowy",
    [129] = "Nie masz wystarczająco płynu do ~b~chłodzenia go ~s~! Potrzebujesz co najmniej 5L.",
    [130] = "Nie masz wystarczająco  ~b~Płynu chłodzoncego ~s~ aby go wymieszać.",
    [131] = "Nie masz wystarczającej ilości płynów mieszanych.",
    [132] = "Pobieranie płynu",
    [133] = "Amfetaminyulfat + 0,25l",
    [134] = "Upuszczanie płynu do chłodzenia. . .",
    [135] = "Płyn chłodzący jest gotowy.",
    [136] = "Czas chłodzenia: ~b~",
    [137] = " ~w~sec",
    [138] = "Mieszanie chłodzącego płynu z Amiohydroksydyną. . .",
    [139] = "Pordukt końcowy. . .",
    [140] = "Świetnie! Wyprodukowałeś 10g Amfetamin.",
    [141] = "Własnie zmieszałeś 5l ~y~Płyn~s~ z ~r~Aminohidroxidem~s~."
}