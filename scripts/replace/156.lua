for _, part in pairs(script.Parent:GetChildren()) do
	if part:IsA("BasePart") then
		part.Velocity = Vector3.new(-51,0,0)
	end
	
end