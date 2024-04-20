local palettesList = script.Parent.Palettes:GetChildren()
local paletteUsed = palettesList[math.random(1,#palettesList)]
local treeSet = {}

script.Parent.Parent:SetAttribute("PaletteUsed", paletteUsed.Name)

for x,v in paletteUsed:GetDescendants() do	
	if v:IsA("BasePart") then
		table.insert(treeSet, v)
	end
end

for _,i in script.Parent.Markers:GetDescendants() do
	if i.Name == "TreeMarker" then
		local clone = treeSet[math.random(1,#treeSet)]:Clone()

		clone.Parent = script.Parent.Palettes[paletteUsed.Name]
		if i:HasTag("BigTree") then
			clone.Size *= 2
		elseif i:HasTag("SmallTree") then
			clone.Size *= 0.75
		end
		
		clone.CFrame = (
			clone.CFrame
			-clone.Position
			+i.Position
			+Vector3.new(0, (clone.Size.Y - i.Size.Y)/2, 0)
		) * CFrame.fromEulerAnglesXYZ(0,math.random(1,8)*45,0)
		clone.CanCollide = false
		clone.Transparency = 0
	
		i:Destroy()
	end
end
