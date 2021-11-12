local pressNext = true
local scrollPos = 0
local scrollTextLength = 0
while pressNext do

    term.setBackgroundColor(colors.cyan)
    term.clear()

    x,y = term.getSize()

    term.setCursorPos((x/2 - 8 ),2) 
    term.write("simpleOS license")

    term.setBackgroundColor(colors.gray)
    term.setCursorPos((6),(y-2))
    term.write("< back")

    term.setCursorPos((x-11),(y-2))
    term.write("next >")

    term.setCursorPos(1,1)


    local abc = window.create(term.current(),6,4,(x-11),(y-11))


    abc.setBackgroundColor(colors.black) 
    cctext = require("cc.strings")

    local text = 'MIT License\n\nCopyright (c) 2021 DJdj Development\n\nPermission is hereby granted, free of charge, to any person obtaining a copy\nof this software and associated documentation files (the "Software"), to deal\nin the Software without restriction, including without limitation the rights\nto use, copy, modify, merge, publish, distribute, sublicense, and/or sell\ncopies of the Software, and to permit persons to whom the Software is\nfurnished to do so, subject to the following conditions:\n\nThe above copyright notice and this permission notice shall be included in all\ncopies or substantial portions of the Software.\n\nTHE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR\nIMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,\nFITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE\nAUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER\nLIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,\nOUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE\nSOFTWARE.\n\nClick on "next" to agree.'
    local lines = cctext.wrap(text,(x-11))
    
    for i = 1, #lines do
        scrollTextLength = #lines
        
        abc.setCursorPos(1,i)
        abc.write(lines[i])
        i = i+1
    end
        abc.scroll(scrollPos)






    local eventData = {os.pullEvent()}
    local event = eventData[1]

    if (event == "mouse_scroll") then

        local dir = eventData[2]
        local lx = eventData[3]
        local ly = eventData[4]

        if lx>5 and lx<(x-4) and ly>3 and ly<(y-5) then

            if (scrollPos < 1 and dir == -1) then
                --none
            elseif (scrollPos < 1 and dir == 1) then
                scrollPos = scrollPos + dir
            elseif (scrollPos > scrollTextLength and dir == 1) then
                --none
            elseif (scrollPos > scrollTextLength and dir == -1) then
                scrollPos = scrollPos + dir
            else
                scrollPos = scrollPos + dir
            end
        end
    end

    if (event == "mouse_click") then

        local button = eventData[2]
        local lx = eventData[3]
        local ly = eventData[4]

        if lx<12 and lx>5 and ly == (y-2) then
            print("back")
            pressNext = false
            shell.run("installer/start.lua")
        end
        
        if lx>(x-12) and lx<(x-5) and ly == (y-2) then
        print("next") 
        pressNext = false
        shell.run("installer/beforedownload.lua")
        end
    end

end

