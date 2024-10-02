local virtual_env = os.getenv("VIRTUAL_ENV")

local function is_neovim_installed()
	local handle = io.popen("pip list | grep neovim")
	local result = handle:read("*a") -- read the output
	handle:close()
	return result ~= ""
end

if virtual_env then
	local neovim_installed = is_neovim_installed()
	if not neovim_installed then
		os.execute("pip install neovim")
	end
end
