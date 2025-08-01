local terrain = workspace.Terrain

terrain:SetMaterialColor(Enum.Material.Grass, Color3.fromRGB(39, 70, 45))
terrain.WaterColor = Color3.new(0.3, 0.5, 1)
terrain.WaterWaveSize = 0.5
terrain.WaterWaveSpeed = 30
terrain.WaterTransparency = 1
terrain.WaterReflectance = 0.75

local CylinderFixCFrame = CFrame.new(0,0,0, 0,-1,0, 1,0,0, 0,0,1)
local function FillTerrain(Part : BasePart, Material : Enum.Material)
	if not Part:IsA("BasePart") then return end
	-- have to do 2 checks because of wedgepart isnt that lovely
	if Part:IsA("WedgePart") then
		terrain:FillWedge(Part.CFrame, Part.Size, Material)
		return
	end
	if not Part:IsA("Part") then return end

	if Part.Shape == Enum.PartType.Ball then
		terrain:FillBall(Part.Position, Part.Size.X / 2, Material)
	elseif Part.Shape == Enum.PartType.Cylinder then
		terrain:FillCylinder(Part.CFrame * CylinderFixCFrame, Part.Size.X, math.min(Part.Size.Y, Part.Size.Z) / 2, Material)
	elseif Part.Shape == Enum.PartType.Wedge then
		terrain:FillWedge(Part.CFrame, Part.Size, Material)
	else
		terrain:FillBlock(Part.CFrame, Part.Size, Material)
	end
	Part.Transparency = 1
end

-- i am assuming the folders are children of the script. change if otherwise
for _, folder in script:GetChildren() do
	-- make sure to name the folders the terrain: e.g. "Water" and "Grass"
	local material = Enum.Material[folder.Name]
	for _, part in folder:GetDescendants() do
		FillTerrain(part, material)
	end
end

local collectionService = game:GetService("CollectionService")
local newTerrain = collectionService:GetTagged("Terrain")

for _, part in newTerrain do
	-- make sure to name the folders the terrain: e.g. "Water" and "Grass"
	FillTerrain(part, Enum.Material[part:FindFirstAncestorOfClass("Folder").Name])
end

collectionService:GetInstanceAddedSignal("Terrain"):Connect(function(part)
	FillTerrain(part, Enum.Material[part:FindFirstAncestorOfClass("Folder").Name])
end)
