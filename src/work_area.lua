---@class WorkArea
---@field canvas_size number Size of the canvas expressed on tiles
local work_area = {
	camera = NEW_CAMERA(),
	tile_canvas = nil,
	tile_size = 16,
	canvas_size = 32,
	draw_transform = {},
}

local DARK_COLOR = { 0x47 / 255, 0x5a / 255, 0x6d / 255, 1 }
local LIGHT_COLOR = { 0x60 / 255, 0x77 / 255, 0x82 / 255, 1 }

---@param size number size of the canvas on tiles
---@param tile_size number size of a tile on px
---@return love.Canvas
local function create_canvas(size, tile_size)
	local canvas = love.graphics.newCanvas(size * tile_size, size * tile_size)
	love.graphics.setCanvas(canvas)
	love.graphics.setColor(0, 0, 0, 1)
	local dark = true
	for x = 0, size * tile_size, tile_size do
		for y = 0, size * tile_size, tile_size do
			if dark then
				love.graphics.setColor(DARK_COLOR)
			else
				love.graphics.setColor(LIGHT_COLOR)
			end
			love.graphics.rectangle("fill", x, y, tile_size, tile_size)
			dark = not dark
		end
	end
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setCanvas()
	return canvas
end

---@param self self
function work_area.init(self)
	self.camera:lookAt(100, 80)
	self.camera:zoomTo(3.0)
	self.tile_canvas = create_canvas(self.canvas_size, self.tile_size)
	self:build_transform()
end

---@param self self
function work_area.build_transform(self)
	local top_left_x, top_left_y = self.camera:worldCoords(0, 0)
	local top_right_x, _ = self.camera:worldCoords(WINDOW_WIDTH, 0)
	local _, bottom_left_y = self.camera:worldCoords(0, WINDOW_HEIGHT)
	local true_canvas_size = self.canvas_size * self.tile_size
	self.draw_transform = {}
	for x = math.floor(top_left_x / true_canvas_size), math.floor(top_right_x / true_canvas_size), 1 do
		for y = math.floor(top_left_y / true_canvas_size), math.floor(bottom_left_y / true_canvas_size), 1 do
			table.insert(self.draw_transform, love.math.newTransform(x * true_canvas_size, y * true_canvas_size))
		end
	end
end

---@param self self
---@param dt number
function work_area.update(self, dt) end

---@param self self
function work_area.draw(self)
	if not self.tile_canvas then
		return
	end
	-- Attach
	self.camera:attach()
	-- Draw tile background
	for _, transform in pairs(self.draw_transform) do
		love.graphics.draw(self.tile_canvas, transform)
	end
	-- Draw 0, 0 cordinates
	love.graphics.setColor(0, 0, 0, 1)
	love.graphics.line(-10000000, 0, 10000000, 0)
	love.graphics.line(0, -10000000, 0, 10000000)
	love.graphics.setColor(1, 1, 1, 1)
	-- Detach
	self.camera:detach()
end

return work_area
