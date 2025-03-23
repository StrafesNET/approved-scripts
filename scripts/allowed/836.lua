local tick=tick
local floor=math.floor

local rows=4
local columns=5

local totalFrames=rows*columns

local fps=25

local texture=script.Parent
local size=texture.Parent.Size -- The gif should be on the front of the part

texture.StudsPerTileU=columns*size.X * 11
texture.StudsPerTileV=rows*size.Y

local t0=tick()
game:GetService("RunService").Heartbeat:connect(function()
	local t=tick()-t0
	local currentFrame=floor(t*fps%totalFrames)
	local currentColumn=currentFrame%columns
	local currentRow=floor(currentFrame/columns)
	texture.OffsetStudsU=currentColumn*size.X * 11
	texture.OffsetStudsV=currentRow*size.Y
end)
