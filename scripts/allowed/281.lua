script.Parent.Touched:connect(function(obj)
	local Humanoid=obj.Parent:FindFirstChild("Humanoid")
	if Humanoid then
		Humanoid.Sit = true
	end
end)