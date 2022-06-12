fx_version 'adamant'
game 'gta5'



files {
	'events.meta'
}

client_script 'client.lua'
server_scripts {
	'@mysql-async/lib/MySQL.lua'
}

exports {
	'GetPedData',
        'seatBeltStatus'
}
