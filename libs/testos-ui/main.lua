local createText = function (text,x,y)
    term.setCursorPos(x,y)
    term.write(text)
end

return createText