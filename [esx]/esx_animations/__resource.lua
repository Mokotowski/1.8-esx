resource_manifest_version '44febabe-d386-4d18-afbe-5e627f4af937'

server_script "server.lua"
client_scripts {
	'config.lua',
	'client/main.lua'
}

exports {
	'openAnimations'
}

ui_page 'client/html/index.html'
files { 'client/html/index.html' }

dependency 'es_extended'