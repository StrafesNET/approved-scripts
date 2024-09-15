for _, part in pairs(script.Parent:GetChildren()) do
	if part:IsA("Part") then
		part.Transparency = 1
	end
end