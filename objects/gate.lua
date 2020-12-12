---------------------------------------
-- Gate for switching maps
entity = {}
function entity:new(x, y, w, h, prop)
  local e = BGE.objects.entity:new(x,y,w,h)
  e.id = "gate"
  
  e.mapDestination = prop.mapDestination
  
  e.playerSpawn = {
    x = prop.playerDestX,
    y = prop.playerDestY
  }

  e.playerFace = prop.playerFace

  e:addCollision(false)
  function e:onBump(o)
    BGE.gameData:setData("nextMap", self.mapDestination)
    BGE.gameData:setData("playerSpawn", self.playerSpawn)
    BGE.gameData:setData("playerFace", self.playerFace)
    BGE.gameStateSystem:setState("mapChange")
  end

  return e
end

return entity