term.clear()
local x,y = term.getSize()
local text = "installer"
term.setCursorPos(math.round((x / 2) - (text:len() / 2)), math.round((y / 2)))
