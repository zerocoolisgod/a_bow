
entity = {}
function entity:new(x,y)
  local p = BGE.objects.entity:new(x,y,8,8)
  p.id = "player"
  p:addCollision(true)
  p:addMovement()

  local sprSheet = BGE.resourceManager:getImage("playerSheet")
  p:addSprite(sprSheet, 16, 16, 1, 1, 2)
  local dly = 0.8
  p:addAnimation("down",  {1, 2}, dly)
  p:addAnimation("up",    {3, 4}, dly)
  p:addAnimation("right", {5, 6}, dly)
  p:addAnimation("left",  {7, 8}, dly)
  p:setAnimation("down")
  


  p:addOnUpdate(
    function(self, dt)
      local moveSpeedX, moveSpeedY = 0,0
      local maxSpeed = 160
      local AccelerationX, AccelerationY = 1,1
      local cAnm = self:getAnimation()
      local nAnm = cAnm
      

      if BGE.inputManager:isDown("left") then
        nAnm = "left"
        moveSpeedX = -maxSpeed
      end
      
      if BGE.inputManager:isDown("right") then
        nAnm = "right"
        moveSpeedX = maxSpeed
      end

      if BGE.inputManager:isDown("up") then
        nAnm = "up"
        moveSpeedY = -maxSpeed
      end
      
      if BGE.inputManager:isDown("down") then
        nAnm = "down"
        moveSpeedY = maxSpeed
      end
      

      if cAnm ~= nAnm then self:setAnimation(nAnm) end
      self:move(moveSpeedX, moveSpeedY, AccelerationX, AccelerationY, dt)
      if BGE.inputManager:isPressed("btnA") then self:action() end
    end
  )


  function p:setDirection(d)
    self:setAnimation(d)
  end
  
  
  function p:getDirection()
    return self:getAnimation()
  end


  p:addOnDraw(
    function(self)
      if self.dbox then
        love.graphics.setColor(1,1,0)
        love.graphics.rectangle("fill", self.dbox.x, self.dbox.y, self.dbox.w, self.dbox.h)
        love.graphics.setColor(1,1,1)
      end
    end
  )
  
  function p:action()
    local rx = self.pos.x + (self.size.w / 2)
    local ry = self.pos.y + (self.size.h / 2)

    local dir = self:getDirection()
    local dist = 2
    if dir == "up" then ry = self.pos.y - dist end
    if dir == "down" then ry = (self.pos.y + self.size.h) + dist end
    if dir == "left" then rx = self.pos.x - dist end
    if dir == "right" then rx = (self.pos.x + self.size.w) + dist end
    -- self.dbox = {x=rx, y=ry, w=1, h=1}
    local o = BGE.collisionSystem:getEntityAtPoint(self,rx,ry)
    if o and o.group == "npc" then
      o:onAction()
    end

  end


  return p
end

return entity