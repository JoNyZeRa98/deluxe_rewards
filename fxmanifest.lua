--[[
           ______________________________________
  ________|            Deluxe Rewards            |_______
  \       |      deluxedevelopment.tebex.io      |      /
   \      |                                      |     /
   /      |______________________________________|     \
  /__________)                                (_________\
  
    Discord Support: https://discord.gg/pFUT9TYNUZ
    Youtube Channel: https://www.youtube.com/@DeluxeDevelopmentFiveM/videos

    Free release by discord: jonyzeratv
]]--

fx_version 'cerulean'
game 'gta5'
lua54 'yes'

version '1.0'
update 'Released free version'
author 'DeluxeDevelopment'
description 'Simple player live playtime reward system by DeluxeDevelopment'
documentation 'https://deluxedevelopment.gitbook.io/api-docs/esx-scripts-free/deluxe-rewards'
store 'https://deluxedevelopment.tebex.io/'

shared_scripts { '@ox_lib/init.lua', 'config/config.lua' }
server_scripts { '@oxmysql/lib/MySQL.lua', 'server/*.lua', 'config/*.lua'}
client_scripts { 'client/*.lua' , 'config/config.lua'}

ui_page 'web/build/index.html'
files { 'web/build/index.html', 'web/build/assets/*', 'web/build/**/*', 'web/build/images/*', 'web/build/images/*.*', 'web/build/images/*.png'}