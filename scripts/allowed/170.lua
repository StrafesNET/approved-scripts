for _, part in script.Parent:GetChildren() do
	if part:IsA("BasePart") then
		part.Velocity = Vector3.new(80,0,0)
	end
end