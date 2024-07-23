local selected_tile = {
	x = 0,
	y = 0,
	tile_size = 16,
}

---@param new_tile_size number
function selected_tile:set_tile_size(new_tile_size)
	self.tile_size = new_tile_size
end

---@param x number
---@param y number
function selected_tile:update_selection(x, y)
	self.x = math.floor(x / self.tile_size)
	self.y = math.floor(y / self.tile_size)
end

function selected_tile:draw()
	love.graphics.rectangle("line", self.x * self.tile_size, self.y * self.tile_size, self.tile_size, self.tile_size)
end

return selected_tile
