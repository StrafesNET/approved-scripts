local palettesList = script.Parent.TreeSpawner.Palettes:GetChildren()
local paletteUsed = palettesList[math.random(1,#palettesList)]
local treeSet = {}

script.Parent:SetAttribute("PaletteUsed", paletteUsed.Name)
local palette = script.Parent:GetAttribute("PaletteUsed") -- attribute set on Deco folder

local rotations = {0,45,90,135,180,-135,-90,-45}

for x,v in pairs(paletteUsed:GetDescendants()) do	
	if v:IsA("BasePart") then
		table.insert(treeSet, v)
	end
end

for _,i in pairs(script.Parent.TreeSpawner.Markers:GetDescendants()) do
	if i.Name == "TreeMarker" then

		local clone = treeSet[math.random(1,#treeSet)]:Clone()

		clone.Parent = script.Parent.TreeSpawner.Palettes[paletteUsed.Name]
		if i:HasTag("BigTree") then
			clone.Size *= 2

		elseif i:HasTag("SmallTree") then
			clone.Size *= 0.75
		end

		clone.Position = Vector3.new(i.Position.X, i.Position.Y + clone.Size.Y/2 - i.Size.Y/2, i.Position.Z)
		clone.Rotation = Vector3.new(clone.Rotation.X,rotations[math.random(1,#rotations)],clone.Rotation.Z)
		clone.CanCollide = false
		clone.Transparency = 0

		i:Destroy()

	end
end

local colours = {}

for x,v in pairs(script.Parent.PaletteParts[palette]:GetChildren()) do
	table.insert(colours, v.Color)
end

-- sets a colour per model (building) so building have some sense of design. be careful - creating a model inside a model will change its colour
for _,i in pairs(script.Parent.PaletteDeco:GetDescendants()) do

	local colourUsed = colours[math.random(1,#colours)]
	-- this is messy i would like it to not be but i do not know how
	if i:IsA("Model") then
		for a,b in pairs(i:GetDescendants()) do
			if b:HasTag("PalettePart") then
				b.Color = colourUsed
			end
		end
	end
end