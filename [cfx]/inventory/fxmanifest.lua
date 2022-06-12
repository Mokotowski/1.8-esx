fx_version "cerulean"
game "gta5"

version "3.6"
author "Adam1337#1901"
description "Adam1337#1901 to szef"

ui_page './web/dist/index.html'

files {
    './web/dist/index.html',
    './web/dist/app.js',
    './web/styles/*.css',
    './web/assets/icons/*.*',
    './web/assets/sounds/*.*',
    './web/assets/*.*'
}

shared_script 'config.lua'

client_scripts {
    "client/main.lua",
    "client/functions.lua",
    "client/plugins/*.lua",
    "locales.lua"
}

server_scripts {
    "@mysql-async/lib/MySQL.lua",
    "server/main.lua",
    "server/functions.lua",
    "server/plugins/*.lua"
}