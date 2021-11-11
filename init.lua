local fs = require("fs")
fs.makeDir("./installer")
if (fs.exists("./installer/installer.lua")) then
    fs.delete('./installer/installer.lua')
end
shell.run("wget","https://raw.githubusercontent.com/DJj123dj/testSystem/main/installer.lua","./installer/installer.lua")
--hello