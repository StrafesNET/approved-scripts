for _, child in script.Parent:GetDescendants() do
	if child.ClassName == "Part" then		
		-- Configure lights
		if child.Name == "Light" then
			-- Create and configure pointlights
			local plight = Instance.new("PointLight")
			plight.Parent = child
			plight.Range = 20
			plight.Brightness = 1
		
			-- Make textures transparent
			for _, c in child:GetChildren() do
				if c.ClassName == "Texture" then
					c.Transparency = 1
				end
			end
			
			child.Transparency = 1
			child.CanCollide = false
		end
		
		-- Configure textured parts
		for _, c in child:GetChildren() do
			if c.ClassName == "Texture" then
				if c.Name == "tool_playerclip" then
					c:Destroy()
					child.Transparency = 1
				elseif c.Name == "tool_invisible" then
					c:Destroy()
					child.Transparency = 1
					child.CanCollide = false
				elseif c.Name == "tool_trigger" then
					c:Destroy()
					child.Transparency = 1
					child.CanCollide = false
				end
			end
		end
	end
end