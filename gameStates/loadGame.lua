-------------------------------------------------------------------------------
-- Load Game
local state={}


function state:init()
  -- Load all media
  BGE.resourceManager:loadImages("media/image/")
  BGE.resourceManager:loadSounds("media/sound/")
  BGE.resourceManager:loadEntities("objects/")
  
  -- Load maps into the mapTable
  --BGE.mapTable:setMapSize(8,8,3)
  BGE.mapTable:loadMaps("media/map/")
  
  BGE.gameData:setData("nextMap", "testMap")
  BGE.gameData:setData("playerSpawn", {x = 160, y = 96})
  BGE.gameData:setData("playerFace", "down")
  
  BGE.gameStateSystem:setState("playGame")
end


function state:update(dt)
end


function state:draw()
end

function state:keypressed(key, isrepeat)
end


function state:textinput(t)
end


function state:joystickpressed(joystick, button)
end


function state:joystickaxis(joystick, axis, value)
end


return state