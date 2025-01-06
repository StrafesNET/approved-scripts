for _, descendant in script.Parent:GetDescendants() do
	if descendant:IsA("PointLight") then
		descendant.Brightness = 1.5;
	end
end

script:Destroy();
