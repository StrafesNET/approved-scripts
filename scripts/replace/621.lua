for _, part in pairs(script.Parent:GetChildren()) do
	for _, descendant in pairs(part:GetDescendants()) do
		if descendant:IsA("PointLight") then
			descendant.Brightness = 1.5;
		end
		
		--temporary
		if descendant:IsA("BasePart") and descendant.Name == "Platform" then
			descendant.Name = "NotAPlatform"
		end
	end
end

script:Destroy();