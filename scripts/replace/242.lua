local Settings = {
	PluginEnabled = false,
	--MaterialSelected = 21
}

local Services = {
	--ChangeHistory = game:GetService('ChangeHistoryService'),
	--Marketplace = game:GetService('MarketplaceService'),
	--Localization = game:GetService('LocalizationService')
	}
local Materials = {'Asphalt','Basalt','Brick','Cobblestone','Concrete','CrackedLava','Glacier','Grass','Ground','Ice','LeafyGrass','Limestone','Mud','Pavement','Rock','Salt','Sand','Sandstone','Slate','Snow','Water','WoodPlanks'}

function AddTerrain(Part)
	if Part then
		if Part:IsA('Part') then
			if Part.Shape == Enum.PartType.Block then
				workspace.Terrain:FillBlock(Part.CFrame, Part.Size, Enum.Material[Materials[Settings.MaterialSelected]])
				--Services.ChangeHistory:SetWaypoint('Part to Terrain')
				--Part:Remove()
				--Part.Transparency = 1
			elseif Part.Shape == Enum.PartType.Ball then			
				workspace.Terrain:FillBall(Part.Position, Part.Size.X/2, Enum.Material[Materials[Settings.MaterialSelected]])
				--Services.ChangeHistory:SetWaypoint('Part to Terrain')
				--Part:Remove()
				--Part.Transparency = 1
			end
		end
	end
end

workspace.Terrain.WaterColor=Color3.new(0,0,0)
workspace.Terrain.WaterWaveSize=0.05
workspace.Terrain.WaterWaveSpeed=5
workspace.Terrain.WaterTransparency=0.6
workspace.Terrain.WaterReflectance=1

water = script.Parent.TerrainParts.Water:GetChildren()
for i = 1,#water do
	Settings.MaterialSelected = 21
	AddTerrain(water[i])
end