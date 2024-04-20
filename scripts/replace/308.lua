local palettesList = script.Parent.Palettes:GetChildren()
local paletteUsed = palettesList[math.random(1,#palettesList)]
local treeSet = {}

script.Parent.Parent:SetAttribute("PaletteUsed", paletteUsed.Name)

local rotations = {0,45,90,135,180,-135,-90,-45}

for x,v in pairs(paletteUsed:GetDescendants()) do	
	if v:IsA("BasePart") then
		table.insert(treeSet, v)
	end
end

for _,i in pairs(script.Parent.Markers:GetDescendants()) do
	if i.Name == "TreeMarker" then
		
		local clone = treeSet[math.random(1,#treeSet)]:Clone()

		clone.Parent = script.Parent.Palettes[paletteUsed.Name]
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
