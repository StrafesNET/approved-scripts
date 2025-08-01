local Terrain = workspace.Terrain

Terrain.WaterColor=Color3.fromRGB(61, 89, 111)
Terrain.WaterWaveSize=0.5
Terrain.WaterWaveSpeed=30
Terrain.WaterTransparency=1
Terrain.WaterReflectance=0.75

local CylinderFixCFrame=CFrame.new(0,0,0, 0,-1,0, 1,0,0, 0,0,1)

local function FillTerrain(Part)
	if Part:IsA("WedgePart") then
		Terrain:FillWedge(Part.CFrame, Part.Size, Enum.Material.Water)
	else
		if Part.Shape == Enum.PartType.Block then
			Terrain:FillBlock(Part.CFrame, Part.Size, Enum.Material.Water)
		elseif Part.Shape == Enum.PartType.Ball then            
			Terrain:FillBall(Part.Position, Part.Size.X/2, Enum.Material.Water)
		elseif Part.Shape == Enum.PartType.Cylinder then            
			Terrain:FillCylinder(Part.CFrame*CylinderFixCFrame, Part.Size.X, math.min(Part.Size.Y,Part.Size.Z)/2, Enum.Material.Water)
		elseif Part.Shape == Enum.PartType.Wedge then
			Terrain:FillWedge(Part.CFrame, Part.Size, Enum.Material.Water)
		end
	end
	Part:Destroy()
end

for i,v in pairs(workspace:GetDescendants()) do
	if v:IsA("BasePart") and v.Name == "TerrainWater" then
		FillTerrain(v)
	end
end