for _, child in script.Parent:GetChildren() do
	if child:IsA("Part") then
		workspace.Terrain:FillBlock(child.CFrame, child.Size, Enum.Material.Water)
	end
end
