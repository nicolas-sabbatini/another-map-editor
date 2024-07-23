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

-- Color palette
---@enum PALETTE
PALETTE = {
	--- #080c10
	NEGRO = { 0x08 / 255, 0x0c / 255, 0x10 / 255, 1.0 },
	--- #0e242d
	AZUL_1 = { 0x0e / 255, 0x24 / 255, 0x2d / 255, 1.0 },
	--- #243b4d
	AZUL_2 = { 0x24 / 255, 0x3b / 255, 0x4d / 255, 1.0 },
	--- #246288
	AZUL_3 = { 0x24 / 255, 0x62 / 255, 0x88 / 255, 1.0 },
	--- #6c77c1
	CELESTE = { 0x6c / 255, 0x77 / 255, 0xc1 / 255, 1.0 },
	--- #ac87c1
	UVA = { 0xac / 255, 0x87 / 255, 0xc1 / 255, 1.0 },
	--- #c2c2da
	GRIS = { 0xc2 / 255, 0xc2 / 255, 0xda / 255, 1.0 },
	--- #6fb1aa
	VERDE_7 = { 0x6f / 255, 0xb1 / 255, 0xaa / 255, 1.0 },
	--- #009d9d
	VERDE_6 = { 0x00 / 255, 0x9d / 255, 0x9d / 255, 1.0 },
	--- #4a6e6e
	VERDE_5 = { 0x4a / 255, 0x6e / 255, 0x6e / 255, 1.0 },
	--- #607782
	VERDE_4 = { 0x60 / 255, 0x77 / 255, 0x82 / 255, 1.0 },
	--- #475a6d
	VERDE_3 = { 0x47 / 255, 0x5a / 255, 0x6d / 255, 1.0 },
	--- #38494e
	VERDE_2 = { 0x38 / 255, 0x49 / 255, 0x4e / 255, 1.0 },
	--- #1c3c41
	VERDE_1 = { 0x1c / 255, 0x3c / 255, 0x41 / 255, 1.0 },
	--- #edcc8d
	ARENA = { 0xed / 255, 0xcc / 255, 0x8d / 255, 1.0 },
	--- #ce9c85
	CREMA = { 0xce / 255, 0x9c / 255, 0x85 / 255, 1.0 },
	--- #b14d2b
	NARANJA_1 = { 0xb1 / 255, 0x4d / 255, 0x2b / 255, 1.0 },
	--- #babd2f
	BICHO_2 = { 0xba / 255, 0xbd / 255, 0x2f / 255, 1.0 },
	--- #c58941
	NARANJA_2 = { 0xc5 / 255, 0x89 / 255, 0x41 / 255, 1.0 },
	--- #846b29
	BICHO_1 = { 0x84 / 255, 0x6b / 255, 0x29 / 255, 1.0 },
}

-- Keyboard
KEYBOARD = require("vendors.simple_keyboard")
KEYBOARD:keyBind({
	"lctrl",
})
