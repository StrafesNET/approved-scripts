local parts = script.Parent:GetDescendants()
for _, i in ipairs(parts) do
	if i:IsA("BasePart") then
		i.Transparency = 1
	end
end