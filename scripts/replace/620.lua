-- Script by HungryBoy02

local Frames = 12 --Amount of frames in gif
local currentFrame = 1

local rows = 4
local columns = 3

local currentRow,CurrentColumn = 0,0

local linear = false

local fps = 10 -- Max 30
local full60fps = false

local size = script.Parent.Parent.Size -- The gif should be on the front of the part

script.Parent.StudsPerTileU = columns*size.X
script.Parent.StudsPerTileV = rows*size.Y

while true do
	if not full60fps then wait(1/fps) else game:GetService("RunService").Stepped:Wait() end
	if linear then
		script.Parent.OffsetStudsU = script.Parent.OffsetStudsU + size.X
		if script.Parent.OffsetStudsU > script.Parent.StudsPerTileU then
			script.Parent.OffsetStudsU = 0
		end
	else
		CurrentColumn = CurrentColumn + 1
		if CurrentColumn > columns then
			CurrentColumn = 1
			currentRow = currentRow + 1
		end
		if currentFrame > Frames then
			currentRow,CurrentColumn,currentFrame = 1,1,1
		end
		script.Parent.OffsetStudsU = size.X*(CurrentColumn-1)
		script.Parent.OffsetStudsV = size.Y*(currentRow-1)
		currentFrame = currentFrame+1
	end
end