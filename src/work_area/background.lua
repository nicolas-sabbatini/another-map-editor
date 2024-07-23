---@class background.properties
---@field private size number
---@field private canvas? love.Canvas
---@field private transform table<love.Transform>
local background = {
	size = 0,
	canvas = nil,
	transform = {},
}

--- TODO replace with a shader
---@param self background.properties
---@param new_tile_amount number
---@param tile_size number
function background:create_canvas(new_tile_amount, tile_size)
	local size = new_tile_amount * tile_size
	local canvas = love.graphics.newCanvas(size, size)
	love.graphics.setCanvas(canvas)
	love.graphics.setColor(0, 0, 0, 1)
	local dark = true
	for x = 0, size, tile_size do
		for y = 0, size, tile_size do
			if dark then
				love.graphics.setColor(PALETTE.VERDE_3)
			else
				love.graphics.setColor(PALETTE.VERDE_4)
			end
			love.graphics.rectangle("fill", x, y, tile_size, tile_size)
			dark = not dark
		end
	end
	love.graphics.setColor(1, 1, 1, 1)
	love.graphics.setCanvas()

	self.size = size
	self.canvas = canvas
end

---@param top_left_x number
---@param top_left_y number
---@param top_right_x number
---@param bottom_left_y number
function background:tile_rectangle(top_left_x, top_left_y, top_right_x, bottom_left_y)
	self.transform = {}
	for x = math.floor(top_left_x / self.size), math.floor(top_right_x / self.size), 1 do
		for y = math.floor(top_left_y / self.size), math.floor(bottom_left_y / self.size), 1 do
			table.insert(self.transform, love.math.newTransform(x * self.size, y * self.size))
		end
	end
end

function background:draw()
	for _, transform in pairs(self.transform) do
		love.graphics.draw(self.canvas, transform)
	end
end

---@return boolean
function background:can_draw()
	return not not self.canvas
end

return background
