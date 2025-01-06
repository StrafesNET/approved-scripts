for _, part in script.Parent:GetChildren() do
	for _, descendant in part:GetDescendants() do
		if descendant:IsA("PointLight") then
			descendant.Brightness = 1.5;
		end
	end
end

script:Destroy();
