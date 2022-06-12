resource_manifest_version "05cfa83c-a124-4cfa-a768-c24a5811d8f9"

client_scripts {
    '@es_extended/locale.lua',
    "config/shared.lua",
    "client/*.lua",
}

server_scripts {
    '@es_extended/locale.lua',
	'@mysql-async/lib/MySQL.lua',
    "config/shared.lua",
    "server/server.lua",
}