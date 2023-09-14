local tick=tick
local floor=math.floor

local rows=2
local columns=2

local totalFrames=rows*columns

local fps=10

local texture=script.Parent
local size=texture.Parent.Size -- The gif should be on the front of the part

texture.StudsPerTileU=columns*size.X
texture.StudsPerTileV=rows*size.Y

local t0=tick()
game:GetService("RunService").Stepped:connect(function()
	local t=tick()-t0
	local currentFrame=floor(t*fps%totalFrames)
	local currentColumn=currentFrame%columns
	local currentRow=floor(currentFrame/columns)
	texture.OffsetStudsU=currentColumn*size.X
	texture.OffsetStudsV=currentRow*size.Y
end)