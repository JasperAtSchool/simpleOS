if (fs.exists("./installer") == false) then
    fs.makeDir("./installer")
end
if (fs.exists("./installer/installer.lua")) then
    fs.delete('./installer/installer.lua')
end
shell.run("wget","https://raw.githubusercontent.com/DJj123dj/testSystem/main/installer.lua","./installer/installer.lua")
--hello
shell.run("./installer/installer.lua")