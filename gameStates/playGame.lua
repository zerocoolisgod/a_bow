-------------------------------------------------------------------------------
-- Play Game
local state={}


function state:init()
  self.room = BGE.overWorld:getRoom(1,1,1)
  self.room:activateRoom()
end


function state:update(dt)
  self.room:update(dt)
end


function state:draw()
  self.room:draw()
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