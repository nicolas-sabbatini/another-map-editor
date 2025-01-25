local utils = {}

---Generate a random UUID4
---@return string
function utils.uuid4()
	local uuid4, _ = string.gsub("xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx", "[xy]", function(c)
		local v = (c == "x") and love.math.random(0, 0xf) or love.math.random(8, 0xb)
		return string.format("%x", v)
	end)
	return uuid4
end

return utils
