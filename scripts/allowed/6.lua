local parts = script.Parent:GetChildren()
for _, i in ipairs(parts) do
	if i:IsA("BasePart") then
		workspace.Terrain:FillBlock(i.CFrame, i.Size, Enum.Material.Water)
		i.Transparency = 1
	end
end