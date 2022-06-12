resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'
lua54 'yes'
description 'ESX Identity'
fx_version 'adamant'
games { 'gta5' }

version '1.1.0'

server_scripts {
	'@mysql-async/lib/MySQL.lua',
	'@es_extended/locale.lua',
	'server.lua',
}

client_scripts {
	'@es_extended/locale.lua',
	'client.lua',
}

dependency 'es_extended'
