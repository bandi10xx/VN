local textBoxModule = require("textBox") -- I MADE THIS MODULE MYSELF AND I'M DAMN PROUD


function love.load()

    -- Initalizing some window settings.
    love.graphics.setBackgroundColor(0.5,0.4,0.7)
    love.graphics.setFont(love.graphics.newFont(40))
    love.window.setMode(1000, 800)
    love.window.setTitle("Visual Novel: Test")

end

function love.draw()
    textBoxModule.drawTextBox("Virex enjoys licking panty teck shanty teck.", 200)
end

function love.update(dt)
    
end