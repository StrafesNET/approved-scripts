local Settings = {
	PluginEnabled = false,
	MaterialSelected = 21
}

local Services = {
	ChangeHistory = game:GetService('ChangeHistoryService'),
	Marketplace = game:GetService('MarketplaceService'),
	Localization = game:GetService('LocalizationService')
	}
local Materials = {'Asphalt','Basalt','Brick','Cobblestone','Concrete','CrackedLava','Glacier','Grass','Ground','Ice','LeafyGrass','Limestone','Mud','Pavement','Rock','Salt','Sand','Sandstone','Slate','Snow','Water','WoodPlanks'}

function AddTerrain(Part)
	if Part then
		if Part:IsA('Part') then
			if Part.Shape == Enum.PartType.Block then
				workspace.Terrain:FillBlock(Part.CFrame, Part.Size, Enum.Material[Materials[Settings.MaterialSelected]])
				--Services.ChangeHistory:SetWaypoint('Part to Terrain')
				Part:Remove()
			elseif Part.Shape == Enum.PartType.Ball then			
				workspace.Terrain:FillBall(Part.Position, Part.Size.X/2, Enum.Material[Materials[Settings.MaterialSelected]])
				--Services.ChangeHistory:SetWaypoint('Part to Terrain')
				Part:Remove()
			end
		end
	end
end


stuff = script.Parent.TerrainParts:GetChildren()
for i = 1,#stuff do
	AddTerrain(stuff[i])
end
t = game.Workspace.Terrain
t.WaterWaveSpeed = 20
t.WaterReflectance = 1
t.WaterTransparency = 1
t.WaterColor = Color3.fromRGB(18, 75, 124)