local MapPart = script.Parent
local x = MapPart.Position.x
local y = MapPart.Position.y
local z = MapPart.Position.z
local sizeX = MapPart.Size.x / 2
local sizeY = MapPart.Size.y / 2
local sizeZ = MapPart.Size.z / 2

local parts=script:GetChildren()
for i=1,#parts do
	local part=parts[i]
	local Beam=part:FindFirstChildOfClass("Beam")
	if Beam then
		Beam.Transparency = NumberSequence.new(0)
		if MapPart.Name == "MapFinish" then
			Beam.Color = ColorSequence.new(Color3.fromRGB(255, 0, 4))
		end
	end
	local n = part.Name
	if n == "UpForwardLeft" then
		part.Position = Vector3.new(x + sizeX, y + sizeY, z - sizeZ)
	elseif n == "UpForwardRight" then
		part.Position = Vector3.new(x + sizeX, y + sizeY, z + sizeZ)
	elseif n == "UpBackLeft" then
		part.Position = Vector3.new(x - sizeX, y + sizeY, z - sizeZ)
	elseif n == "UpBackRight" then
		part.Position = Vector3.new(x - sizeX, y + sizeY, z + sizeZ)
	elseif n == "DownForwardRight" then
		part.Position = Vector3.new(x + sizeX, y - sizeY, z + sizeZ)
	elseif n == "DownForwardLeft" then
		part.Position = Vector3.new(x + sizeX, y - sizeY, z - sizeZ)
	elseif n == "DownBackLeft" then
		part.Position = Vector3.new(x - sizeX, y - sizeY, z - sizeZ)
	elseif n == "DownBackRight" then
		part.Position = Vector3.new(x - sizeX, y - sizeY, z + sizeZ)
	end
end

local SelectionBox=MapPart:FindFirstChildOfClass("SelectionBox")
if SelectionBox then
	SelectionBox.Visible = false
end