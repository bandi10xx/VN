textBox = {

    drawTextBox = function(text, maxWidth, color)

        local screenHeight, screenWidth = love.graphics.getHeight(), love.graphics.getWidth() -- screen dimensions
        local textHeight, textWidth = love.graphics.getFont():getHeight(text), love.graphics.getFont():getWidth(text)
        local boxHeight = textHeight + 20

        if type(maxWidth) == "table" then color = maxWidth end

        if type(color) ~= "table" or #color ~= 3 or (type(color[1]) ~= "number" or type(color[2]) ~= "number" or type(color[3]) ~= "number") or (color[1] > 1 or color[2] > 1 or color[3] > 1) then 
            -- I KNOW THIS MAKES YOUR BRAIN WANT TO GO KABOOM BUT BANDI YOU GOT THIS, I REALLY DON'T WANT TO EXPLAIN ALL THESE COMPLICATED CONDITIONS, 
            --BUT IF SLEEPY 14 YEAR OLD YOU CAN UNDERSTAND THIS THEN >14 YEAR OLD YOU CAN DEFINITELY UNDERSTAND IT TOO!!
            color = {1,1,1}
        end

        if type(maxWidth) ~= "number" or maxWidth >= screenWidth * 0.95 or maxWidth <= 500 then
            maxWidth = math.ceil(textWidth / 2)
            maxWidth = math.min(maxWidth, screenWidth - 100) 
        end -- error handling maxwidth


        if textWidth > maxWidth then 
            boxHeight = textHeight * (textWidth/maxWidth + 0.4) + 40 
        end -- if the text is wider than the box then multiply by a factor of textwidth/maxwidth

        local rect1 = {
            x = (screenWidth - maxWidth) / 2,
            y = screenHeight - (boxHeight + 80),
            width = maxWidth,
            height = boxHeight,
        }
        local text1 = {
            x = ((screenWidth - maxWidth) / 2) * 1.05,
            y = (screenHeight - (boxHeight + 70)),
            width = maxWidth - 30,
        }

        love.graphics.setColor(0,0,0)
        love.graphics.rectangle("fill", rect1.x, rect1.y, rect1.width, rect1.height) -- cba to explain just read the code you stupid bum
        love.graphics.setColor(color[1], color[2], color[3])
        love.graphics.printf(text, text1.x, text1.y, text1.width, "center") -- same here bozo
        love.graphics.setColor(1,1,1) -- reset to white
    end,

}

return textBox