-------------------------------------------------------------------------------
-- Shooter Ship
-------------------------------------------------------------------------------

entity = {}
function entity:new(x,y)
  local p = BGE.objects.entity:new(x,y,8,8)
  p.id = "player"
  p:addCollision(true)
  p:addMovement()
  
  local sprSheet = BGE.resourceManager:getImage("playerSheet")
  p:addSprite(sprSheet, 16, 16, 1, 1, 2)
  local dly = 0.3
  p:addAnimation("right", {5, 6}, dly)
  p:setAnimation("right")
  
  
  p:addOnUpdate(
    function(self, dt)
      local moveSpeedX, moveSpeedY = 0,0
      local maxSpeed = 80
      local AccelerationX, AccelerationY = 1,1
      
      if BGE.inputManager:isDown("left") then moveSpeedX = -maxSpeed end
      if BGE.inputManager:isDown("right") then moveSpeedX = maxSpeed end
      if BGE.inputManager:isDown("up") then moveSpeedY = -maxSpeed end
      if BGE.inputManager:isDown("down") then moveSpeedY = maxSpeed end
      
      self:move(moveSpeedX, moveSpeedY, AccelerationX, AccelerationY, dt)
      if BGE.inputManager:isPressed("btnA") then self:action() end
      
      self:checkPos()
    end
  )
  
  
  function p:action()
    local b = BGE.resourceManager:getNewEntity("bullet", 0, 0, "right")
    b.pos.x = self.pos.x + 10
    b.pos.y = self.pos.y + 2
    b.group = "playerBullet"
    
    BGE.entitySystem:addEntity(b)
  end
  
  
  function p:checkPos()
    local vs = BGE.camera:getViewSize() 
    if self.pos.x < 0 then self.pos.x = 0 end
    if self.pos.x > (vs.w - self.size.w) then self.pos.x = vs.w - self.size.w end
    if self.pos.y < 0 then self.pos.y = 0 end
    if self.pos.y > (vs.h - self.size.h) then self.pos.y = (vs.h - self.size.h) end
  end
  
  return p
end

return entity