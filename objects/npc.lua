
entity = {}
function entity:new(x,y)
  local e = BGE.objects.entity:new(x,y,16,16)
  e.id = "npc"
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
    -- add textbox data to gameData
    BGE.gameData:addData("textBoxData",{
      x=16,
      y=16,
      h=
    )
  end
  

  return e
end

return entity