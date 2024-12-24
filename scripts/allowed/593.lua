--Parts inside this folder will be filled with terrain water.

local parts = script.Parent:GetDescendants()
for _, part in parts do
	if part:IsA("BasePart") then
		workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Water)
		part.Transparency = 1
	end
end
