--@__tommyy - perhaps not my greatest work but it works good enough
local REGION_NAME_PATTERN = "^Region(%d+)$"

local LIGHTING_PROPERTIES = {
	"Ambient",
	"Brightness",
	"ClockTime",
	"ColorShift_Bottom",
	"ColorShift_Top",
	"EnvironmentDiffuseScale",
	"EnvironmentSpecularScale",
	"ExposureCompensation",
	"FogColor",
	"FogEnd",
	"FogStart",
	"GeographicLatitude",
	"GlobalShadows",
	"OutdoorAmbient",
	"ShadowSoftness",
	"TimeOfDay"
}

local workspace = workspace

local ReplicatedFirst = game:GetService("ReplicatedFirst")
local RunService = game:GetService("RunService")
local Lighting = game:GetService("Lighting")

local MapModel = script.Parent.Parent
local CurrentCamera = workspace.CurrentCamera
local RegionsContainer = script.Parent:WaitForChild("Regions")

local Params = OverlapParams.new()
Params.FilterDescendantsInstances = {RegionsContainer}
Params.FilterType = Enum.RaycastFilterType.Include

local Regions = {}
local RegionSettings = {}

local CurrentRegionId

local DefaultLightingSettings = {}

for _, Property in LIGHTING_PROPERTIES do
	DefaultLightingSettings[Property] = Lighting[Property]
end

local function ClearLighting()
	Lighting:ClearAllChildren()
	for Property, DefaultValue in DefaultLightingSettings do
		Lighting[Property] = DefaultValue
	end
end

local function SetLighting(RegionId: number)
	local RegionSetting = RegionSettings[RegionId]

	if not RegionSetting then return end

	local Attributes = RegionSetting:GetAttributes()
	for Attribute, Value in Attributes do
		local Success, Result = pcall(function()
			Lighting[Attribute] = Value
		end)
		if not Success then
			print(`Error setting lighting property Lighting["{Attribute}"] = {Value} because: {Result}`)
		end
	end
	for _, Object in RegionSetting:GetChildren() do
		Object:Clone().Parent = Lighting
	end
end

local function AddRegionPart(RegionPart)
	local RegionId = string.match(RegionPart.Name, REGION_NAME_PATTERN)
	if RegionPart:IsA("BasePart") and RegionId then
		if not Regions[RegionId] then
			Regions[RegionId] = {}
		end
		table.insert(Regions[RegionId], RegionPart)
		RegionPart.Transparency = 1
	end
end
local RegionPartAdded = RegionsContainer.ChildAdded:Connect(AddRegionPart)
for _, RegionPart in RegionsContainer:GetChildren() do
	AddRegionPart(RegionPart)
end

local function AddRegionSetting(RegionSetting)
	local RegionId = string.match(RegionSetting.Name, REGION_NAME_PATTERN)
	if RegionSetting:IsA("Folder") and RegionId and not RegionSettings[RegionId] then
		RegionSettings[RegionId] = RegionSetting
	end
end
local RegionSettingAdded = script.ChildAdded:Connect(AddRegionSetting)
for _, RegionSetting in script:GetChildren() do
	AddRegionSetting(RegionSetting)
end

local Connection = RunService.Heartbeat:Connect(function()
	local CurrentCFrame = CurrentCamera.CFrame
	local PartsInBounds = workspace:GetPartBoundsInBox(CurrentCFrame, Vector3.one * 2, Params)

	local RegionSetting, NewRegionId
	for _, Part in PartsInBounds do
		local RegionId = string.match(Part.Name, REGION_NAME_PATTERN)
		if RegionId then
			RegionSetting = RegionSettings[RegionId]
			NewRegionId = RegionId
			break
		end
	end

	if not RegionSetting then
		if CurrentRegionId then
			CurrentRegionId = nil
			ClearLighting()
		end
		return
	end

	if CurrentRegionId == NewRegionId then return end

	ClearLighting()
	SetLighting(NewRegionId)
	CurrentRegionId = NewRegionId
end)

-- TODO: Make a built-in lighting system for bhop & surf

repeat
	script.Parent = ReplicatedFirst -- trick so that roblox actually lets me do stuff once the map is removed (it will destroy itself)
	RunService.Heartbeat:Wait()
until script.Parent == ReplicatedFirst
-- have to spam it until it works or wait (like MapManager) because roblox sucks

local RemovedConnection
RemovedConnection = MapModel:GetPropertyChangedSignal("Parent"):Connect(function()
	if MapModel.Parent == nil then
		Connection:Disconnect()
		RegionPartAdded:Disconnect()
		RemovedConnection:Disconnect()
		RegionSettingAdded:Disconnect()
		CurrentRegionId = nil
		ClearLighting()
		table.clear(Regions)
		table.clear(RegionSettings)
		table.clear(DefaultLightingSettings)
		script:Destroy()
	end
end)
