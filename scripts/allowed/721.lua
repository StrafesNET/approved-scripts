local frames = {
	"rbxassetid://11181690067", -- 00
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
	"rbxassetid://11181705914", -- 15
}


local tick=tick
local floor=math.floor

local totalFrames=#frames

local fps=30

local Texture=script.Parent

local t0=tick()
game:GetService'RunService'.Stepped:connect(function()
	local t=tick()-t0
	local currentFrame=floor(t*fps%totalFrames)
	Texture.Texture=frames[currentFrame+1]
end)
