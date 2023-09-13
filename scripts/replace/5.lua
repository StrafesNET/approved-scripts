local parts = script.Parent:GetChildren()
for _, i in ipairs(parts) do
	if i:IsA("BasePart") then
		i.Transparency = 1
	end
end