------------------------------------------------------------------------------
-- Game states
------------------------------------------------------------------------------
local gsm = {}
gsm.currentState = ""
gsm.nextState = ""
gsm.states = {}

local function lError(msg)
  love.errhand(msg)
  love.event.quit()
end


function gsm:updateState(dt)
	if self.currentState ~= self.nextState then 
		self.currentState = self.nextState
		
		if not self.states[self.currentState] then
			lError(self.currentState..' is not a valid game state.')
		end
		
		self.states[self.currentState]:init()
	end
	
	self.states[self.currentState]:update(dt)
end


function gsm:drawState()
	self.states[self.currentState]:draw()
end


function gsm:setState(state)
	self.nextState = state
end


function gsm:getState()
	return self.currentState
end


function gsm:addState(id, state)
	self.states[id] = state
end


function gsm:loadStates(path)
  -- takes every state in $path and adds it to
  -- BGE
  local dir = love.filesystem.getDirectoryItems(path)
  local id
  print(path)

  for i,v in ipairs(dir) do
    if string.sub(dir[i],-4) == '.lua' then
      id = string.sub(dir[i],1,-5)
      fullPath = path.."."..id
      BGE.gameStateSystem:addState(id,require(fullPath))
    end
  end
end


function gsm:keypressed(key, isrepeat)
	self.states[self.currentState]:keypressed(key, isrepeat)
end


function gsm:textinput(t)
	self.states[self.currentState]:textinput(t)
end


function gsm:joystickpressed(joystick, button)
	self.states[self.currentState]:joystickpressed(joystick, button)
end


function gsm:joystickaxis(joystick, axis, value)
	self.states[self.currentState]:joystickaxis(joystick, axis, value)
end

return gsm