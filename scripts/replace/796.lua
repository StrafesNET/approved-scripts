for _,part in pairs(workspace.bhop_clarion:GetDescendants()) do
	if part:IsA("BasePart") then
		if part.Material ~= Enum.Material.Fabric then
			continue
		end
		if part.Transparency > 0.001 then
			continue
		end
		part.Material = Enum.Material.Concrete
	end
end