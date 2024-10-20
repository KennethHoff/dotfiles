local M = {}

function is_nixos()
	local file = io.open("/etc/NIXOS", "r")
	if file ~= nil then
		io.close(file)
		return true
	else
		return false
	end
end

M.mason_enabled = not is_nixos()

return M
