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
  self.room:initiate()

  local ps = BGE.gameData:getData("playerSpawn")
  local face = BGE.gameData:getData("playerFace")
  local p = BGE.resourceManager:getNewEntity("player", ps.x, ps.y)
  p:setDirection(face) 
  BGE.entitySystem:addEntity(p)
end


function state:update(dt)
  if self.textBox then
    self:updateTextbox()
  else 
    self.room:update(dt)
  end

  if self.cTextPos > #self.textQueue then 
    self.textBox = nil
  end
end


function state:draw()
  self.room:draw()
  if self.textBox then
    self:drawTextbox()
  else 
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


--=====================================
-- Hot girl shit
function state:checkForTextbox()
  local tbd = BGE.gameData:getData("textBoxData")
  if tbd then
    self.textQueue = tbd.t
    self.cTextPos = 1
    local text = self.textQueue[self.cTextPos]
    self.textBox = BGE.objects.textBox:new(tbd.x,tbd.y,tbd.w,tbd.h,text)
  end
end

function state:updateTextbox()
  if BGE.inputManager:isPressed("btnA") then
    self.cTextPos = self.cTextPos + 1
  end
  
  if self.cTextPos <= #self.textQueue then 
    self.textBox:setText(self.textQueue[self.cTextPos])
  end
end


function state:drawTextbox()
  self.textBox:draw()
end

return state