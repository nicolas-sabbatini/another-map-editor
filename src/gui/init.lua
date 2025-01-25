local box = require("vendors.boxi.box")

---@class gui
---@field root Box | nil
local gui = {
	root = nil,
}

function gui:init()
	self.root = box.new(0, 0, WINDOW_WIDTH, WINDOW_HEIGHT, {
		corner_radius = 0,
		border_color = { 1, 1, 0, 1 },
		background_color = { 1, 1, 1, 0 },
	})
end

function gui:draw()
	self.root:draw()
end

return gui
