local MaterialSelected = Enum.Material.Water

function AddTerrain(Part)
	if Part and Part:IsA('Part') then
		if Part.Shape == Enum.PartType.Block then
			workspace.Terrain:FillBlock(Part.CFrame, Part.Size, MaterialSelected)
		elseif Part.Shape == Enum.PartType.Ball then			
			workspace.Terrain:FillBall(Part.Position, Part.Size.X/2, MaterialSelected)
		end
	end
end

workspace.Terrain.WaterColor=Color3.new(0,0,0)
workspace.Terrain.WaterWaveSize=0.05
workspace.Terrain.WaterWaveSpeed=5
workspace.Terrain.WaterTransparency=0.6
workspace.Terrain.WaterReflectance=1

local water = script.Parent.TerrainParts.Water:GetChildren()
for i = 1,#water do
	AddTerrain(water[i])
end