 local parent = script.Parent
for _, child in pairs(parent:GetDescendants()) do
	if child.ClassName == "Part" then		
		-- Configure lights
		if child.Name == "Light" then
			-- Create and configure pointlights
			plight = Instance.new("PointLight")
			plight.Parent = child
			plight.Range = 20
			plight.Brightness = 1
		
			-- Make textures transparent
			for _, c in pairs(child:GetChildren()) do
				if c.ClassName == "Texture" then
					c.Transparency = 1
				end
			end
			
			child.Transparency = 1
			child.CanCollide = false
		end
		
		-- Configure textured parts
		for _, c in pairs(child:GetChildren()) do
			if c.ClassName == "Texture" then
				if c.Name == "tool_playerclip" then
					c.Transparency = 1
					child.Transparency = 1
				end
				if c.Name == "tool_invisible" then
					c.Transparency = 1
					child.Transparency = 1
					child.CanCollide = false
				end
				if c.Name == "tool_trigger" then
					c.Transparency = 1
					child.Transparency = 1
					child.CanCollide = false
				end
			end
		end
	end
end