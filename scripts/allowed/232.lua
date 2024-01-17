for i,v in script.Parent:GetDescendants() do
	if v.Name:find("V3Value") then
		v.Parent.Velocity = v.Value
	end
end