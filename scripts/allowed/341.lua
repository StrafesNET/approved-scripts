for _,v in script.Parent:GetDescendants() do
	if v:IsA("BasePart") then
		v.CastShadow = false
	end  
end