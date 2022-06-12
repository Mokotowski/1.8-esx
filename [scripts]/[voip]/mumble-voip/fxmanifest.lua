fx_version "adamant"
game "gta5"

name "mumble-voip"
description "mumble-voip"

version "1.3"

ui_page "ui/index.html"

files {
	"ui/index.html",
	"ui/mic_click_on.ogg",
	"ui/mic_click_off.ogg",
}

shared_scripts {
	"config.lua",
}

client_scripts {
    "client.lua",
}

server_scripts {
    "server.lua",
}

provide "tokovoip_script"