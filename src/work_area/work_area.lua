---@class WorkArea
---@field private background background.properties
---@field private current_tile love.Transform
local work_area = {
	camera = NEW_CAMERA(),
	tile_size = 16,
	background = require("work_area/background"),
}

---@param zoom number
---@param tile_size number
---@param tile_amount number
function work_area:init(zoom, tile_size, tile_amount)
	self.tile_size = tile_size
	self.camera:lookAt(100, 80)
	self.camera:zoomTo(zoom)
	self.background:create_canvas(tile_amount, self.tile_size)
	self:build_transform()
end

function work_area:build_transform()
	local top_left_x, top_left_y = self.camera:worldCoords(0, 0)
	local top_right_x, _ = self.camera:worldCoords(WINDOW_WIDTH, 0)
	local _, bottom_left_y = self.camera:worldCoords(0, WINDOW_HEIGHT)
	self.background:tile_rectangle(top_left_x, top_left_y, top_right_x, bottom_left_y)
end

---@param dt number
function work_area:update(dt) end

function work_area:draw()
	if not self.background:can_draw() then
		return
	end
	-- Attach
	self.camera:attach()
	-- Draw tile background
	self.background:draw()
	-- Draw 0, 0 cordinates
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.line(-10000000, 0, 10000000, 0)
	love.graphics.line(0, -10000000, 0, 10000000)
	love.graphics.setColor(1, 1, 1, 1)
	-- Detach
	self.camera:detach()
end

return work_area
