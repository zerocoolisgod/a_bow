-------------------------------------------------------------------------------
-- Map Table 
-- Holds rooms in a Key, Value table
-- An entire directory can be loadded with loadMaps(path)


local Room = require("bge.room")


local e = { }

e.map = {}


function e:loadMaps(path)
  -- takes every map in $path and adds it to
  -- self.map[id] = map
  local dir = love.filesystem.getDirectoryItems(path)
  local id,res

  for i,v in ipairs(dir) do
    if string.sub(dir[i],-4) == '.lua' then
      id = string.sub(dir[i],1,-5)
      fullPath = path.."."..id
      self:newRoom(fullPath, id)
    end
  end
end


function e:newRoom(fullPath, id)
  local mapFile = require(fullPath)
  -- if map has an "id" propery, use that
  -- else its the filename
  local id = mapFile.properties["id"] or id
  local r = Room:new(id)
  
  r:loadLayersFromMap(mapFile)
  self:addRoom(r, id)
end


function e:addRoom (room, id)
  self.map[id] = room
end


function e:getRoom (id)
  return self.map[id]
end

return e
