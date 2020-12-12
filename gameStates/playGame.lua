-------------------------------------------------------------------------------
-- Play Game
local state={}


function state:init()
  self.map = BGE.gameData:getData("nextMap")

  self.room = BGE.mapTable:getRoom(self.map)
  self.room:initiate()

  local ps = BGE.gameData:getData("playerSpawn")
  local face = BGE.gameData:getData("playerFace")
  local p = BGE.resourceManager:getNewEntity("player", ps.x, ps.y)
  p:setDirection(face)
  BGE.camera:setFocus(p)
  BGE.entitySystem:addEntity(p)
end


function state:update(dt)
  if self.textBox then
    self:updateTextbox()
    if self.cTextPos > #self.textQueue then 
      self.textBox = nil
      BGE.gameData:setData("textBoxData",nil)
    end
  else 
    self.room:update(dt)
    self:checkForTextbox()
  end
end


function state:draw()
  self.room:draw()
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


--=====================================
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

return state