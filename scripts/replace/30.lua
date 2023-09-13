MapPart = script.Parent
x = MapPart.Position.x
y = MapPart.Position.y
z = MapPart.Position.z
sizeX = MapPart.Size.x / 2
sizeY = MapPart.Size.y / 2
sizeZ = MapPart.Size.z / 2

for _, part in pairs(script:GetChildren()) do
	if part:FindFirstChildOfClass("Beam") then
		part:FindFirstChildOfClass("Beam").Transparency = NumberSequence.new(0)
		if MapPart.Name == "MapFinish" then
			part:FindFirstChildOfClass("Beam").Color = ColorSequence.new(Color3.fromRGB(255, 0, 4))
		end
	end
	n = part.Name
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

if script.Parent:FindFirstChildOfClass("SelectionBox") then
	script.Parent:FindFirstChildOfClass("SelectionBox").Visible = false
end