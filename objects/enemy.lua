
entity = {}
function entity:new(x,y)
  local e = BGE.objects.entity:new(x,y,16,16)
  e.id = "enemy"
  e.group = "npc"
  e:addCollision(true)
  e:addMovement()

  local sprSheet = BGE.resourceManager:getImage("npcASheet")
  e:addSprite(sprSheet, 16, 16, 1, 1, 2)
  local dly = 0.8
  e:addAnimation("down",  {1, 2}, dly)
  e:addAnimation("up",    {3, 4}, dly)
  e:addAnimation("right", {5, 6}, dly)
  e:addAnimation("left",  {7, 8}, dly)
  e:setAnimation("down")
  

  e:addOnUpdate(
    function(self, dt)
  
    end
  )
  

  function e:onAction()
    local tq ={
      "You have no way to fight this foe!",
      "You run away!"
    }
    
    if BGE.gameData:getData("hasBow") then
      tq = {
        "I am an Enemy!!",
        "Now you DIE!!"
      }
      --self.remove = true
    end

    if BGE.gameData:getData("playerDeath") then
      BGE.gameStateSystem:setState("playerDeath")
    else
      self:addTextbox(tq)
      BGE.gameData:setData("playerDeath", true)
    end
    
  end


  function e:addTextbox(t)
    -- add textbox data to gameData
    BGE.gameData:setData("textBoxData",{
      x = 16,
      y = 16,
      h = 64,
      w = 300,
      t = t
    })
  end

  return e
end

return entity