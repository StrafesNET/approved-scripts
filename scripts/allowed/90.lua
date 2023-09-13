local parent = script.Parent
for _, child in parent:GetDescendants() do
	if child:IsA'BasePart' and child.Name == "Light" then	
		-- Make textures transparent
		for _, c in child:GetChildren() do
			if c.ClassName == "Texture" then
				c.Transparency = 1
			end
		end
		
		child.CanCollide = false
	end
end