for _, part in script.Parent:GetDescendants() do
	if part:IsA("BasePart") then
		part.Transparency = 1;
		part.Name = "Trigger1";
	end
end

script:Destroy();
