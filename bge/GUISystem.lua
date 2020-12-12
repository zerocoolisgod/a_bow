------------------------------------------------------------------------------
-- GUI System
-- identicle to entitySystem except it draws outside the camera
------------------------------------------------------------------------------
local GUISys = {}

GUISys.objs = {}

-------------------------------------------------------------------------------
-- Object Table Managment
-------------------------------------------------------------------------------
function GUISys:clearObjects()
	self.objs = {}
end

function GUISys:registerObjectTable(entTable)
	self.objs = entTable
end

function GUISys:getObjects()
	return self.objs
end


function GUISys:addObject(e)
	table.insert(self.objs, e)
end


-------------------------------------------------------------------------------
-- Callbacks
-------------------------------------------------------------------------------
function GUISys:updateObjects(dt)
	for i = #self.objs, 1, -1 do
		if self.objs[i].remove then 
			table.remove(self.objs, i)
		end
	end
	
	for i = 1, #self.objs do
		self.objs[i]:update(dt)
	end
end


function GUISys:drawObjects()
	for i = 1, #self.objs do
		self.objs[i]:draw()
	end
end


return GUISys