
-- local logicComponents   = BGE.logicComponents
-- local renderComponents  = BGE.renderComponents

entity = {}
function entity:new(x,y)
  local p = BGE.objects.entity:new(x,y,16,16)
  p:addRectangle({0.2, 0.2, 1, 1})
  p:addCollision(true)
  p:addMovement()
  

  p:addOnUpdate(
    function(self, dt)
      local moveSpeedX, moveSpeedY = 0,0
      local AccelerationX, AccelerationY = 1,1
      
      if BGE.inputManager:isDown("up") then moveSpeedY = -80 end
      if BGE.inputManager:isDown("down") then moveSpeedY = 80 end
      if BGE.inputManager:isDown("left") then moveSpeedX = -80 end
      if BGE.inputManager:isDown("right") then moveSpeedX = 80 end
      
      self:move(moveSpeedX, moveSpeedY, AccelerationX, AccelerationY, dt)
    end
  )
  
  return p
end

return entity