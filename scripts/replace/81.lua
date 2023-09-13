for _, part in pairs(script.Parent:GetDescendants()) do
	if part.name == "Water" then
		workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Water)
	end
end