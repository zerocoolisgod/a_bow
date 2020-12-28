-------------------------------------------------------------------------------
-- Shooter State
-------------------------------------------------------------------------------

local state={}


function state:init()
  local p = BGE.resourceManager:getNewEntity("ship", 32, 100)
  local e = BGE.resourceManager:getNewEntity("enemyShip", 300, 100)
  
  BGE.entitySystem:addEntity(p)
  BGE.entitySystem:addEntity(e)
  self.eTimer = 5
end


function state:update(dt)
  if self.textBox then
    self:updateTextbox()
    if self.cTextPos > #self.textQueue then 
      self.textBox = nil
      BGE.gameData:setData("textBoxData",nil)
    end
  else 
    BGE.entitySystem:updateEnts(dt)
    self:checkForTextbox()
  end
  self:updateSpawner(dt)
end

 
function state:draw()
  BGE.entitySystem:drawEnts()
  if self.textBox then
    self:drawTextbox()
  end
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
  if self.map ~= BGE.gameData:getData("nextMap") then
    BGE.gameStateManager:setState("mapChange")
  end
end


---------------------------------------
-- Hot girl shit
function state:checkForTextbox()
  local tbd = BGE.gameData:getData("textBoxData")
  if tbd then
    self.textQueue = tbd.t
    self.cTextPos = 1
    local text = self.textQueue[self.cTextPos]
    
    local vs = BGE.camera:getViewSize()
    local vp = BGE.camera:getPos()
    local tbx = vp.x + 16
    local tby = vp.y + ((vs.h - tbd.h) - 8)
    local tbw = vs.w - 32
    local tbh = tbd.h

    self.textBox = BGE.objects.textBox:new(tbx, tby, tbw, tbh, text)
    self.textBox:setWrapLimit(tbd.w)
    self.textBox:setBackgroundColor()
    self.textBox:setBorderColor({0.5,0.5,0.5,1})
    self.textBox:setBorderSize(2)
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

function state:updateSpawner(dt)
  self.eTimer = self.eTimer - dt
  if self.eTimer < 0 then
    local vs = BGE.camera:getViewSize()
    local posX = vs.w
    local posY = math.random(vs.h)
    local e = BGE.resourceManager:getNewEntity("enemyShip", posX, posY)
    BGE.entitySystem:addEntity(e)
    self.eTimer = 4 * math.random()
  end 
  print(self.eTimer)
end


return state