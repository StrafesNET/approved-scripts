local function AddTerrain(Part,MaterialSelected)
	if Part and Part:IsA('Part') then
		if Part.Shape == Enum.PartType.Block then
			workspace.Terrain:FillBlock(Part.CFrame, Part.Size, MaterialSelected)
		elseif Part.Shape == Enum.PartType.Ball then
			workspace.Terrain:FillBall(Part.Position, Part.Size.X/2, MaterialSelected)
		end
	end
end

local TerrainParts = script.Parent.TerrainParts

local stone = TerrainParts.Stone:GetChildren()
local stone_material = Enum.Material.Rock
for i = 1,#stone do
	AddTerrain(stone[i],stone_material)
end

local dirt = TerrainParts.Dirt:GetChildren()
local dirt_material = Enum.Material.Ground
for i = 1,#dirt do
	AddTerrain(dirt[i],dirt_material)
end

local snow = TerrainParts.Snow:GetChildren()
local snow_material = Enum.Material.Ice
for i = 1,#snow do
	AddTerrain(snow[i],snow_material)
end
