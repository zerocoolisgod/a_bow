-------------------------------------------------------------------------------
-- Enemy Ship
-------------------------------------------------------------------------------

entity = {}
function entity:new(x, y)
  local e = BGE.objects.entity:new(x,y,16,16)
  e.id = "enemyShip"
  e.group = "enemy"
  e:addCollision(true)
  e:addMovement()
  
  local sprSheet = BGE.resourceManager:getImage("npcASheet")
  e:addSprite(sprSheet, 16, 16, 1, 1, 2)
  
  local dly = 0.8
  e:addAnimation("right", {5, 6}, dly)
  e:setAnimation("right")
  
  e.counter = 0

  e:addOnUpdate(
    function(self, dt)
      self:checkPos()
      local moveSpeed = -18
      local acceleration = 1
      -- if self.dir == "left" then moveSpeed = -80 end
      
      self:move(moveSpeed, 0, acceleration, acceleration, dt)
      -- self.counter =  self.counter + dt
    end
  )
  

  function e:action()
    
  end
  
  function e:checkPos()
    if self.pos.x < 0 then
      self.remove = true
    end
  end
  
  
  function e:onBump(o)
    if o.group == "playerBullet" then
      self.remove = true
    end
  end

  return e
end

return entity