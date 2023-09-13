for _, part in script.Parent:GetDescendants() do
	if part.Name == "Water" then
		workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Water)
	end
end