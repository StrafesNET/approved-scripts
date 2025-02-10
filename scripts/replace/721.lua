local IDs = 
	{	"rbxassetid://11181690067", -- 00
		"rbxassetid://11181691746", -- 01
		"rbxassetid://11181692923", -- 02
		"rbxassetid://11181694057", -- 03
		"rbxassetid://11181694939", -- 04
		"rbxassetid://11181696150", -- 05
		"rbxassetid://11181697193", -- 06
		"rbxassetid://11181698052", -- 07
		"rbxassetid://11181699092", -- 08
		"rbxassetid://11181700146", -- 09
		"rbxassetid://11181701308", -- 10
		"rbxassetid://11181702280", -- 11
		"rbxassetid://11181703373", -- 12
		"rbxassetid://11181704257", -- 13
		"rbxassetid://11181705069", -- 14
		"rbxassetid://11181705914",} -- 15

while true do
	for i,v in ipairs(IDs) do
		script.Parent.Texture = v
		task.wait(0.0325)
	end
end