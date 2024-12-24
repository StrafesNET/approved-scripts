for _,v in script.Parent.Collisions:GetDescendants() do
	if v:IsA("BasePart") then
		v.Transparency=1
	end
end
