for _, part in script.Parent:GetDescendants() do
	if part:IsA("BasePart") then
		workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Rock)
	end
end
