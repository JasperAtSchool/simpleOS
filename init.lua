if (fs.exists("./installer") == false) then
    fs.makeDir("./installer")
end
if (fs.exists("./installer/init.lua")) then
    fs.delete('./installer/init.lua')
end
shell.run("wget","https://raw.githubusercontent.com/DJj123dj/testSystem/main/init.lua","./installer/init.lua")
shell.run("./installer/init.lua")