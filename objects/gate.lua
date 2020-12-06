---------------------------------------
-- Gate for switching maps
entity = {}
function entity:new(x, y, w, h, prop)
  local e = BGE.objects.entity:new(x,y,w,h)
  e.id = "gate"
  
  e.mapDestination = {
    x = prop.mapDestX,
    y = prop.mapDestY,
    z = prop.mapDestZ
  }
  
  e.playerSpawn = {
    x = prop.playerDestX,
    y = prop.playerDestY
  }

  e.playerFace = prop.playerFace

  e:addCollision(false)
  function e:onBump(o)
    print(self.mapDestination.x)
    BGE.gameData:setWorldPosition(self.mapDestination.x, self.mapDestination.y, self.mapDestination.z)
    BGE.gameData:setData("playerSpawn", self.playerSpawn)
    BGE.gameData:setData("playerFace", self.playerFace)
    BGE.gameStateSystem:setState("mapChange")
  end

  return e
end

return entity