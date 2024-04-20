local tick=tick
local floor=math.floor

local totalFrames=25

local fps=30

local Children=script.Parent:GetChildren()
local Textures={}
for i=1,#Children do
	local v=Children[i]
	if v:IsA("Texture") then
		table.insert(Textures,v)
	end
end

local t0=tick()
game:GetService("RunService").Stepped:connect(function()
	local t=tick()-t0
	local currentFrame=floor(t*fps%totalFrames)
	for i=1,#Textures do
		Textures[i].Texture = string.format("rbxasset://textures/water/normal_%02d.dds",currentFrame)
	end
end)