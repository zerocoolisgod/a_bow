-------------------------------------------------------------------------------
-- Play Game
local state={}


function state:init()
  local wx,wy,wz = BGE.gameData:getWorldPosition()
  self.worldPos = {
    x = wx,
    y = wy,
    z = wz
  }

  self.room = BGE.overWorld:getRoom(self.worldPos.x, self.worldPos.y, self.worldPos.z)
  self.room:activateRoom()

  local ps = BGE.gameData:getData("playerSpawn")
  local face = BGE.gameData:getData("playerFace")
  local p = BGE.resourceManager:getNewEntity("player", ps.x, ps.y)
  p:setDirection(face) 
  BGE.entitySystem:addEntity(p)

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

function state:checkMapChange()
  local wx,wy,wz = BGE.gameData:getNextWoldPosition()
  --local nwx,nwy,nwz = BGE.gameData:getNextWoldPosition()
  if self.worldPos ~= {wx,wy,wz} then
    BGE.gameStateManager:setState("mapChange")
  end
end

return state