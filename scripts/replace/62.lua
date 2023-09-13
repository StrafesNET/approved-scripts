local parent = script.Parent
for index, child in pairs(parent:GetChildren()) do
	if child.Name == "tool_trigger" then
		child.Transparency = 1
	end
end