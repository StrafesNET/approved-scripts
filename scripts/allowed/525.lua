local t = workspace.Terrain
t.WaterWaveSpeed = 20
t.WaterReflectance = 1
t.WaterTransparency = 1
t.WaterColor = Color3.fromRGB(18, 75, 124)

for _, Part in script.Parent.TerrainParts:GetChildren() do
	if Part:IsA('Part') then
		if Part.Shape == Enum.PartType.Block then
			workspace.Terrain:FillBlock(Part.CFrame, Part.Size, Enum.Material.Water)
			Part:Destroy()
		elseif Part.Shape == Enum.PartType.Ball then
			workspace.Terrain:FillBall(Part.Position, Part.Size.X/2, Enum.Material.Water)
			Part:Destroy()
		end
	end
end
