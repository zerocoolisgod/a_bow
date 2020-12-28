-------------------------------------------------------------------------------
-- winGame
local state={}


function state:init()
  self.tmr = 10
  BGE.camera:unsetFocus()
  BGE.camera:resetPos()
end


function state:update(dt)
  self.tmr = self.tmr - dt
  if self.tmr < 0 then
    BGE.gameStateSystem:setState("loadGame")
  end
end


function state:draw()
  love.graphics.print(1,1,1,1)
  love.graphics.print("The game has been won !! "..self.tmr)
end

function state:keypressed(key, isrepeat)
end


function state:textinput(t)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end

return state