local palettesList = script.Parent.TreeSpawner.Palettes:GetChildren()
local paletteUsed = palettesList[math.random(1,#palettesList)]
local treeSet = {}

for _,v in paletteUsed:GetDescendants() do	
	if v:IsA("BasePart") then
		table.insert(treeSet, v)
	end
end

for _,i in script.Parent.TreeSpawner.Markers:GetDescendants() do
	if i.Name == "TreeMarker" then
		local clone = treeSet[math.random(1,#treeSet)]:Clone()

		clone.Parent = paletteUsed
		if i:HasTag("BigTree") then
			clone.Size *= 2

		elseif i:HasTag("SmallTree") then
			clone.Size *= 0.75
		end

		clone.CFrame = (
			clone.CFrame - clone.Position
			+(i.Position + Vector3.new(0, (clone.Size.Y - i.Size.Y)/2, 0))
		) * CFrame.fromEulerAnglesXYZ(0,math.random(1,8)*math.pi/8,0)
		clone.CanCollide = false
		clone.Transparency = 0

		i:Destroy()
	end
end

local colours = {}

for _,v in script.Parent.PaletteParts[paletteUsed.Name]:GetChildren() do
	table.insert(colours, v.Color)
end

-- sets a colour per model (building) so building have some sense of design. be careful - creating a model inside a model will change its colour
for _,i in script.Parent.PaletteDeco:GetDescendants() do
	-- this is messy i would like it to not be but i do not know how
	if i:IsA("Model") then
		local colourUsed = colours[math.random(1,#colours)]
		for _,b in i:GetDescendants() do
			if b:HasTag("PalettePart") then
				b.Color = colourUsed
			end
		end
	end
end