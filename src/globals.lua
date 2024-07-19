-- Game settings
-- This is the default game windows size
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 608

-- On focus Variable
IN_FOCUS = false

-- Camera
local camera = require("vendors.camera")

function SCREEN_TO_GAME_CAMERA(cam)
	if not IN_FOCUS then
		return nil, nil
	end
	local x, y = love.mouse.getPosition()
	return cam:worldCoords(x, y, 0, 0, WINDOW_WIDTH, WINDOW_HEIGHT)
end

function ATTACH_GAME_CAMERA(cam)
	cam:attach(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, true)
end

function DETACH_GAME_CAMERA(cam)
	cam:detach()
end

function NEW_CAMERA()
	return camera.new(WINDOW_WIDTH, WINDOW_HEIGHT)
end
