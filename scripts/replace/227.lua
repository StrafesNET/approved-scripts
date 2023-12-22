for i,v in pairs(workspace:GetDescendants()) do
	if v.Name == "TerrainWater" then
		game.Workspace.Terrain:FillBlock(v.CFrame, v.Size, Enum.Material.Water)
		v:destroy()
	end
end

local Walter = workspace.Terrain
Walter.WaterWaveSize = 0.5
Walter.WaterReflectance = 0.75
Walter.WaterColor = Color3.fromRGB(12,84,91)
Walter.WaterTransparency = 1
Walter.WaterWaveSpeed = 30
