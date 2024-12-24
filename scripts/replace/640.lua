for _, part in pairs(script.Parent:GetDescendants()) do
	if part:IsA("BasePart") then
		workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Grass)
	end
end