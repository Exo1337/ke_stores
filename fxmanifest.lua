fx_version 'cerulean'
game 'gta5'

name 'ke_stores'
author '.exo1337, kevingbg'
version '1.0.0'

lua54 'yes'

shared_scripts {
    '@ox_lib/init.lua',
    'backend/shared/config.lua'
}

client_scripts {
    'backend/client/c_funcs.lua',
    'backend/client/c_main.lua'
}

server_scripts {
    'backend/server/sv_main.lua'
}

ui_page 'frontend/index.html'
-- ui_page 'http://localhost:5173'

files {
    'frontend/index.html',
    'frontend/assets/**',
}
