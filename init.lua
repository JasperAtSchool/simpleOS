term.clear()
local x,y = term.getSize()
local text = "installer"
print(string.len("textlenght: "..text))
term.setCursorPos(((x / 2) - string.len(text)),(y / 2))
print(text)
