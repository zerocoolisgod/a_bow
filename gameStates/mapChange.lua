-------------------------------------------------------------------------------
-- Map Change
local state={}


function state:init()
  self.tmr = 0.3
end


function state:update(dt)
  self.tmr = self.tmr - dt
  if self.tmr < 0 then
    BGE.gameStateSystem:setState("playGame")
  end
end


function state:draw()
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