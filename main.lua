-- Basic Game Engine

-- Imports
BGE = require("bge.basicGameEngine")


-- Localized love
local lgRect = love.graphics.rectangle
local lgDraw = love.graphics.draw
local lgSetColor = love.graphics.setColor
local lgPop = love.graphics.pop
local lgPush = love.graphics.push
local lgScale = love.graphics.scale


-- Localized Vars
local why = "wtf"




-------------------------------------------------------------------------------
-- Load Function
-------------------------------------------------------------------------------
function love.load(arg)
  BGE:load()
  BGE.gameStateSystem:addState("loadGame", require("gamestates.loadGame"))
  BGE.gameStateSystem:addState("mapChange", require("gamestates.mapChange"))
  BGE.gameStateSystem:addState("playGame", require("gamestates.playGame"))

  BGE:setUseGameStates(true)
  BGE.gameStateSystem:setState("loadGame")  
end


-------------------------------------------------------------------------------
-- Main Loop
-------------------------------------------------------------------------------
function love.update(dt)
  BGE:update(dt)
end


-------------------------------------------------------------------------------
-- Drawing Loop
-------------------------------------------------------------------------------
function love.draw()
  BGE:draw()
end


-------------------------------------------------------------------------------
-- Other Callbacks
-------------------------------------------------------------------------------
function love.focus(f)
end


function love.keypressed(key, isrepeat)
  if key == 'escape' then love.event.quit() end
  if key == "f11" then BGE.camera:toggleFullscreen() end
end


function love.joystickpressed(joystick, button)
end


function love.joystickaxis(joystick, axis, value)
end



