-- Game settings
-- This is the default game windows size
WINDOW_WIDTH = 800
WINDOW_HEIGHT = 608

-- On focus Variable
IN_FOCUS = false

-- Camera
local camera = require("vendors.camera")

function NEW_CAMERA()
	return camera.new()
end

-- GUI
GUI = require("vendors.urutora"):new()

function UPDATE_GUI_STYLE()
	GUI:setStyle({
		outline = false,
		cornerRadius = 0.2,
	})
end
