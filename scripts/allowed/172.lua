for _, part in script.Parent:GetChildren() do
	if part:IsA("BasePart") then
		part.Velocity = Vector3.new(0,0,155)
	end
end