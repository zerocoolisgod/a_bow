-------------------------------------------------------------------------------
-- Bullets
-------------------------------------------------------------------------------

entity = {}
function entity:new(x, y, d)
  local p = BGE.objects.entity:new(x,y,4,4)
  local dir = d or "right"
  p.id = "bullet"
  p.group = "bullet"
  p:addCollision(true)
  p:addMovement()
  p:addRectangle()
  
  p.counter = 0

  p:addOnUpdate(
    function(self, dt)
      self:checkPos()
      local moveSpeed = 180
      local acceleration = 1
      if self.dir == "left" then moveSpeed = -80 end
      
      self:move(moveSpeed, 0, acceleration, acceleration, dt)
      self.counter =  self.counter + dt
    end
  )
  

  function p:action()
    
  end
  
  function p:checkPos()
    local vs = BGE.camera:getViewSize() 
    
    if self.pos.x < 0 or self.pos.x > vs.w then
      self.remove = true
    end
    
  end
  
  
  function p:onBump(o)
    self.remove = true
  end

  return p
end

return entity