local group = script.Parent


for _, child in ipairs(group:GetChildren()) do
	if child:IsA("Model") or child:IsA("Part") then
		workspace.Terrain:FillBlock(child.CFrame, child.Size, Enum.Material.Water)
	end
end
