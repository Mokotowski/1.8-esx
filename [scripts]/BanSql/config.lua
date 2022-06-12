Config                   = {}

--GENERAL
Config.Lang              = 'en'    --Set lang (fr-en)
Config.Permission        = "admin" --Permission need to use FiveM-BanSql commands (mod-admin-superadmin)
Config.ForceSteam        = true    --Set to false if you not use steam auth
Config.MultiServerSync   = false   --This will check if a ban is add in the sql all 30 second, use it only if you have more then 1 server (true-false)


--WEBHOOK
Config.EnableDiscordLink = false --Turn this true if you want link the log to a discord (true-false)
Config.webhookban        = "https://discordapp.com/api/webhooks//oJZBU9YLz9ksOCG_orlf-wpMZ2pkFedfpEsC34DN_iHO0CBBp6X06W3mMJ2RvMMK7vIO"
Config.webhookunban      = "https://discordapp.com/api/webhooks//oJZBU9YLz9ksOCG_orlf-wpMZ2pkFedfpEsC34DN_iHO0CBBp6X06W3mMJ2RvMMK7vIO"

--LANGUAGE
Config.TextEn = {
	start         = "BanList i BanListHistory załadowane pomyślnie.",
	starterror    = "ERROR: Ładowanie BanList i BanListHistory nie powiodło się, proszę spróbować ponownie.",
	banlistloaded = "BanList załadowana pomyślnie.",
	historyloaded = "BanListHistory załadowana pomyślnie.",
	loaderror     = "ERROR: Nie udało się załadować BanListy.",
	cmdban        = "/sqlban (ID) (Czas trwania w dniach) (Powód)",
	cmdbanoff     = "/sqlbanoffline (Permid) (Czas trwania w dniach) (Steam)",
	cmdhistory    = "/sqlbanhistory (Steam ) lub /sqlbanhistory 1,2,2,4......",
	forcontinu    = " dni. Aby kontynuować, wykonaj polecenie /sqlreason [powód]",
	noreason      = "Nie podano przyczyny.",
	during        = " trwanie: ",
	noresult      = "Nie znaleziono żadnych wyników.",
	isban         = " został zbanowany",
	isunban       = " został odbanowany",
	invalidsteam  = "Steam jest wymagane, aby dołączyć do tego serwera.",
	invalidid     = "Nie znaleziono ID gracza",
	invalidname   = "Podana nazwa jest nieprawidłowa",
	invalidtime   = "Nieprawidłowy czas trwania zakazu",
	alreadyban    = " został już zbanowany za : ",
	yourban       = "Zostałeś zbanowany za: ",
	yourpermban   = "Zostałeś trwale zbanowany za: ",
	youban        = "Zostajesz wykluczony z tego serwera za: ",
	forr          = " dni. Za: ",
	permban       = " trwale za: ",
	timeleft      = ". Pozostały czas: ",
	toomanyresult = "Zbyt wiele wyników, bądź bardziej szczegółowy, aby skrócić wyniki..",
	day           = " dni ",
	hour          = " godziny ",
	minute        = " minuty ",
	by            = "przez",
	ban           = "Zbanuj gracza",
	banoff        = "Zbanuj gracza offline",
	dayhelp       = "Okres obowiązywania zakazu (dni)",
	reason        = "Powód zakazu",
	history       = "Wyświetla wszystkie poprzednie zakazy dla danego gracza.",
	reload        = "Odświeża listę i historię zakazów.",
	unban         = "Odbanuj gracza.",
	steamname     = "Steam",
}
