local Terrain=workspace.Terrain
Terrain.WaterWaveSize=0.05
Terrain.WaterWaveSpeed=5
Terrain.WaterTransparency=0.6
Terrain.WaterReflectance=1

local function AddTerrain(Part,MaterialSelected)
	if Part and Part:IsA('Part') then
		if Part.Shape == Enum.PartType.Block then
			Terrain:FillBlock(Part.CFrame, Part.Size, MaterialSelected)
		elseif Part.Shape == Enum.PartType.Ball then
			Terrain:FillBall(Part.Position, Part.Size.X/2, MaterialSelected)
		end
	end
end

local TerrainParts = script.Parent.TerrainParts

local water = TerrainParts.Water:GetChildren()
local water_material = Enum.Material.Water
for i = 1,#water do
	AddTerrain(water[i],water_material)
end
