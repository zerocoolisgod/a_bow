
entity = {}
function entity:new(x, y, w, h)
  local e = BGE.objects.entity:new(x, y, w, h)
  e.id = "pit"
  e.group = "npc"
  e:addCollision(true)
  
  
  function e:onAction()
    local tq ={
      "You cannot fly."
    }
    
    if BGE.gameData:getData("hasWings") then
      tq = {
        "You may fly over this pit."
      }
      self.remove = true
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