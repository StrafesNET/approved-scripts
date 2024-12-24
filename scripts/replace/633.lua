for i,v in pairs(script.Parent.Collisions:GetDescendants()) do
	if v:IsA("BasePart") then
		v.Transparency=1
	end
end