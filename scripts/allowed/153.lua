for _, part in script.Parent:GetChildren() do
	if part:IsA("BasePart") then
		part.Velocity = Vector3.new(51,0,0)
	end	
end