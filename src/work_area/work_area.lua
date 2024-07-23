---@class WorkArea
---@field private background background.properties
---@field private current_tile love.Transform
local work_area = {
	camera = NEW_CAMERA(),
	background = require("work_area.background"),
	selected_tile = require("work_area.selecte_tile"),
}

---@param zoom number | love.Scancode
---@param tile_size number
---@param tile_amount number
function work_area:init(zoom, tile_size, tile_amount)
	self.camera:lookAt(100, 80)
	self.camera:zoomTo(zoom)
	self.selected_tile:set_tile_size(tile_size)
	self.background:create_canvas(tile_amount, tile_size)
	self:build_transform()
end

function work_area:build_transform()
	local top_left_x, top_left_y = self.camera:worldCoords(0, 0)
	local top_right_x, _ = self.camera:worldCoords(WINDOW_WIDTH, 0)
	local _, bottom_left_y = self.camera:worldCoords(0, WINDOW_HEIGHT)
	self.background:tile_rectangle(top_left_x, top_left_y, top_right_x, bottom_left_y)
end

---@param x_scrol 0 | 1 | -1
---@param y_scrol 0 | 1 | -1
function work_area:handle_scrool(x_scrol, y_scrol)
	if KEYBOARD:isDown("lctrl") then
		local new_zoom = math.max(self.camera.scale + (y_scrol * 0.1), 0.1)
		self.camera:zoomTo(new_zoom)
	else
		self.camera:move(2 * x_scrol, 2 * -y_scrol)
	end
	work_area:build_transform()
end

---@param x number
---@param y number
function work_area:handle_mouse_movement(x, y)
	local cx, cy = self.camera:worldCoords(x, y)
	self.selected_tile:update_selection(cx, cy)
end

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
	-- Draw selected tile
	self.selected_tile:draw()
	-- Detach
	self.camera:detach()
end

return work_area
