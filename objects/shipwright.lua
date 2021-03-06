
entity = {}
function entity:new(x,y)
  local e = BGE.objects.entity:new(x,y,16,16)
  e.id = "shipwright"
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
      "I am the Shipwight!",
      "Now You DIE!!",
      "lol, j/k, bring me a broken\nand I will fix it."
    }
    if BGE.gameData:getData("hasBrokenBoat") then
      tq = {
        "Let me fix that for you."
      }
      BGE.gameData:setData("hasFixedBoat", true)
    end

    if BGE.gameData:getData("hasFixedBoat") then
      tq = {
        "Launch your boat from the Pier,\nand sail to the Hydra's Island."
      }
    end
    
    self:addTextbox(tq)
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