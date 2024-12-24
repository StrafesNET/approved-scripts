for _, part in pairs(script.Parent:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Transparency = 1;
		part.Name = "Trigger1";

		--[[
		if part.Name == "water_1" then			
			workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Water);
			workspace.Terrain:SetMaterialColor(Enum.Material.Water, Color3.fromRGB(22, 90, 132));
		end
		]]
	end
end

script:Destroy();