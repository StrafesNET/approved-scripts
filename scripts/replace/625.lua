for _, part in pairs(script.Parent:GetDescendants()) do
	if part:IsA("BasePart") then
		part.Transparency = 1;


		if part.Name == "grass_1" then			
			workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Grass);
			workspace.Terrain:SetMaterialColor(Enum.Material.Grass, Color3.fromRGB(39, 70, 45));

			part.Name = "Trigger1";
		end
	end
end

script:Destroy();