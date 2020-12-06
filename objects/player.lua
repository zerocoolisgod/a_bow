
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
      local maxSpeed = 50
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
    end
  )
  
  function p:setDirection(d)
    self:setAnimation(d)
  end

  return p
end

return entity