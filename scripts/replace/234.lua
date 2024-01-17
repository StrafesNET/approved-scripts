local parent = game.Workspace
for _, child in pairs(parent:GetDescendants()) do
	
	if child.ClassName == "Part" or child.ClassName == "WedgePart" then		
		-- Configure lights
		if child.Name == "Light" or child.Name == "WallLight" then
			print("Found light")
			-- Create and configure pointlights
			plight = Instance.new("PointLight")
			plight.Parent = child
			if child.Name == "Light" then
				plight.Range = 27
				plight.Brightness = 0.3
				plight.Shadows = true
				plight.Color = Color3.fromRGB(255, 255, 242)
			elseif child.Name == "WallLight" then
				plight.Range = 20
				plight.Brightness = 1
				plight.Shadows = true
				plight.Color = Color3.fromRGB(255, 255, 242)
			end
		
			-- Make textures transparent
			for _, c in pairs(child:GetChildren()) do
				if c.ClassName == "Texture" then
					c:Destroy()
				end
			end
			
			child.Transparency = 1
			child.CanCollide = false
		end
		--[[if child.Name == "TerrainPiece" then
			-- Create and configure texture onto part
			faces = {"Top", "Left", "Right", "Front", "Back", "Bottom"}
			for _, i in pairs(faces) do
				texture = Instance.new("Texture")
				texture.Parent = child
				texture.Texture = "http://www.roblox.com/asset/?id=4030705099"
				texture.StudsPerTileU = 12
				texture.StudsPerTileV = 12
				--random offset to make it look more natural
				texture.OffsetStudsU = math.random() * 12
				texture.OffsetStudsV = math.random() * 12
				texture.Face = i
			end
		end	]]--	
		
		-- Configure textured parts
		for _, c in pairs(child:GetChildren()) do
			if c.ClassName == "Texture" then
				if c.Name == "tool_playerclip" then
					c:Destroy()
					child.Transparency = 1
				end
				if c.Name == "tool_invisible" then
					c:Destroy()
					child.Transparency = 1
					child.CanCollide = false
				end
				if c.Name == "tool_trigger" then
					c:Destroy()
					child.Transparency = 1
					child.CanCollide = false
				end
			end
		end
	end
end