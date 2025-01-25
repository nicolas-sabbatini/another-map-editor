local modules = (...):gsub("%.[^%.]+$", "") .. "."
local utils = require(modules .. "utils")

---@class DrawOptions
---@field corner_radius number
---@field background_color number[] | nil rgba
---@field border_color number[] | nil rgba

---@class Box
---@field type "box" | "text"
---@field private id string
---@field x number
---@field y number
---@field width number
---@field height number
---@field draw_options DrawOptions
---@field childrens Box[]
---@field parent Box | nil
local Box = {}

---Create a new Box instance
---@param x number
---@param y number
---@param width number
---@param height number
---@param draw_options DrawOptions | nil
---@return Box
function Box.new(x, y, width, height, draw_options)
	local draw_options = draw_options or { corner_radius = 0 }
	local new_box = setmetatable({
		type = "box",
		id = utils.uuid4(),
		x = x,
		y = y,
		width = width,
		height = height,
		draw_options = draw_options,
		childrens = {},
		parent = nil,
	}, { __index = Box })
	return new_box
end

---@param new_children Box
---@return Box returns self
function Box:add_children(new_children)
	new_children.parent = self
	local found = false
	for _, c in pairs(self.childrens) do
		if new_children.id == c.id then
			found = true
			break
		end
	end
	if not found then
		table.insert(self.childrens, new_children)
	end
	return self
end

function Box:draw()
	love.graphics.push("all")
	local cr = self.draw_options.corner_radius
	love.graphics.setColor(self.draw_options.background_color or { 1, 1, 1, 1 })
	love.graphics.rectangle("fill", self.x, self.y, self.width, self.height, cr, cr)
	love.graphics.setColor(self.draw_options.border_color or { 0, 0, 0, 1 })
	love.graphics.rectangle("line", self.x, self.y, self.width, self.height, cr, cr)
	for _, c in pairs(self.childrens) do
		c:draw()
	end
	love.graphics.pop()
end

return Box
