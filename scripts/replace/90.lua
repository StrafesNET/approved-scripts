local parent = script.Parent
for _, child in pairs(parent:GetDescendants()) do
	if child.ClassName == "Part" then		
		-- Configure lights
		if child.Name == "Light" then	
			-- Make textures transparent
			for _, c in pairs(child:GetChildren()) do
				if c.ClassName == "Texture" then
					c.Transparency = 1
				end
			end
			
			child.CanCollide = false
		end
	end
end