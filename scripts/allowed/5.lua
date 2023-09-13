local parts=script.Parent:GetChildren()
for i=1,#parts do
	local part=parts[i]
	if part:IsA("BasePart") then
		part.Transparency=1
	end
end