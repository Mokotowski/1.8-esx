Config = {}
Config.Locale = 'pl'

Config.Accounts = {
	bank = _U('account_bank'),
	black_money = _U('account_black_money'),
	money = _U('account_money')
}

Config.StartingAccountMoney 	= {bank = 10000000}

Config.EnableSocietyPayouts 	= false -- pay from the society account that the player is employed at? Requirement: esx_society
Config.EnableHud            	= false -- enable the default hud? Display current job and accounts (black, bank & cash)
Config.MaxWeight            	= 10000000000   -- the max inventory weight without backpack
Config.PaycheckInterval         = 6 * 60000 -- how often to recieve pay checks in milliseconds
Config.EnableDebug              = false -- Use Debug options?
Config.EnableDefaultInventory   = true -- Display the default Inventory ( F2 )
Config.EnableWantedLevel    	= false -- Use Normal GTA wanted Level?
Config.EnablePVP                = true -- Allow Player to player combat
Config.NativeNotify             = true -- true = old esx notification
Config.DisableHealthRegen       = true

Config.Multichar                = true -- Enable support for esx_multicharacter
Config.Identity                 = true -- Select a characters identity data before they have loaded in (this happens by default with multichar)
Config.DistanceGive 			= 4.0 -- Max distance when giving items, weapons etc.
Config.OnDuty                   = true -- Default state of the on duty system