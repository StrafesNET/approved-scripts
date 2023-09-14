for _,part in script.Parent:GetDescendants() do
	if part:IsA("BasePart") then
		part.Transparency = 1
	end
end