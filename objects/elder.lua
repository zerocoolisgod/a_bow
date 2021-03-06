
entity = {}
function entity:new(x,y)
  local e = BGE.objects.entity:new(x,y,16,16)
  e.id = "elder"
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
    local tq = {
      "I am the Village Elder.",
      "Go to the Temple of Artemis and\nask for her gift.",
      "The Temple is located on top of\nMt. Ida."
    }

    if BGE.gameData:getData("hasBow") then
      tq = {
        "You must find the wings of\nIcarus so you can fly into the\nLabrynth."
      }
    end

    if BGE.gameData:getData("hasWings") then
      tq = {
        "You must enter the Labrynth and\nget the boat of Theseus."
      }
    end

    if BGE.gameData:getData("hasBrokenBoat") then
      tq = {
        "The Shipwright can fix Theseus' boat."
      }
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