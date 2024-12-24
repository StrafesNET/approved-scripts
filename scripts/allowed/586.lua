local parts = script.Parent:GetDescendants()
for _, part in parts do
	if part:IsA("BasePart") then
		part.Transparency = 1
	end
end
