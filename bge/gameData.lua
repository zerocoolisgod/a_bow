-------------------------------------------------------------------------------
-- Game Data Object
---------------------------------------
-- The majority of Game spacific Global Variables.
-- The only table needed to be saved and loaded for save/load functionality.
-----------------------------


local g = {}
g.userData = {}

---------------------------------------
-- USER DATA storage and retrieval
function g:setData(id, value)
  self.userData[id] = value
end

function g:getData(id)
  -- if not self.userData[id] then 
  --   love.errhand(id.." does not exist")
  --   love.event.quit()
  -- end

  return self.userData[id] 
end


return g