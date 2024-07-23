require("globals")

local work_area = require("work_area/work_area")
local side_bar = require("side_bar")

-- Callback on actions
function love.mousepressed(x, y, button) end
function love.mousemoved(x, y, dx, dy) end
function love.mousereleased(x, y, button) end
function love.textinput(text) end
function love.keypressed(k, scancode, isrepeat) end
function love.wheelmoved(x, y)
	print(x, y)
end
function love.resize(new_width, new_height)
	WINDOW_WIDTH = new_width
	WINDOW_HEIGHT = new_height
	work_area:build_transform()
end
function love.focus(f)
	IN_FOCUS = f
end
--

function love.load()
	love.graphics.setDefaultFilter("nearest", "nearest")
	side_bar:load()
	work_area:init(3.0, 16, 32)
end

function love.update(dt)
	work_area:update(dt)
end

function love.draw()
	love.graphics.clear(1, 1, 1)
	work_area:draw()
end
