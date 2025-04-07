textBoxModule = require("textBox") -- module
Dialogue = require("Dialogue") -- module
TableNumber = 1

click = {

    ClickDebounce = false,
    CLICKDEBOUNCETIME = 0.3, 
    RemainingTime = 0.3 --change this along with the CLICKDEBOUNCETIME constant (they should always be the same on initialization)

}



function love.load()

    -- Initalizing some window settings.
    love.graphics.setBackgroundColor(0.5,0.4,0.7)
    love.graphics.setFont(love.graphics.newFont(40))
    love.window.setMode(1000, 800)
    love.window.setTitle("Visual Novel: Test")

end

function love.draw()
    textBoxModule.drawTextBox(Dialogue.Dialogue[TableNumber]) -- draw the text box with the current dialogue
end

function love.update(dt)
    if click.ClickDebounce then
        click.RemainingTime = click.RemainingTime - dt -- decrease the remaining time by the delta time
        if click.RemainingTime <= 0 then -- if the remaining time is less than or equal to 0 then reset the click debounce
            click.ClickDebounce = false 
            click.RemainingTime = click.CLICKDEBOUNCETIME -- reset the remaining time to the debounce time
        end
    end
end


function love.mousepressed(x, y, button)
    if button == 1 then -- left mouse button
        if not click.ClickDebounce then 
            click.ClickDebounce = true 
            if TableNumber < #Dialogue.Dialogue then
                TableNumber = TableNumber + 1
            else
                Dialogue.Dialogue[TableNumber] = "The game has ended!" -- add more endings later with more logic and stuff
            end
        end
    end
end
