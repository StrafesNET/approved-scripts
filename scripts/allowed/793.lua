local RunService = game:GetService("RunService")

local camera = workspace.CurrentCamera

local regionData = {}

-- region class
local RegionClass = {}
RegionClass.__index = RegionClass

function RegionClass.new(contents)
	assert(contents.scripts~=nil,"Region contents missing scripts")
	local self = setmetatable(contents, RegionClass)
	return self
end

-- enable/disable scripts in a region
function RegionClass:SetScriptsEnabled(Enabled)
	for _, script in self.scripts do
		script.Enabled = Enabled
	end
end

-- populate regionData w/ scripts and regionParts
local model = script.Parent
local animatorTemplate = script:WaitForChild("Animator")
local regionsFolder = model:WaitForChild("Regions")
local regionPartsFolder = model:WaitForChild("RegionParts")
for i = 1,18 do
	local regionModel = regionsFolder:WaitForChild(`Region{i}`)
	local regionPart = regionPartsFolder:WaitForChild(`RegionPart{i}`)

	-- add animator script to every region
	local animator = animatorTemplate:Clone()
	animator.Parent = regionModel

	local scripts = {}
	for _, descendant in regionModel:GetDescendants() do
		if descendant:IsA("Script") then
			table.insert(scripts, descendant)
		end
	end
	regionData[regionPart] = RegionClass.new{
		scripts = scripts,
	}
end

local params = OverlapParams.new()
params.FilterType = Enum.RaycastFilterType.Include
params.FilterDescendantsInstances = {regionPartsFolder}

local lastRegion = nil
-- check what region player is in and enable/disable scripts
RunService.Heartbeat:Connect(function()
	-- find current region camera is in
	local parts = workspace:GetPartBoundsInRadius(camera.CFrame.Position, 1, params)

	local currentRegionPart = nil
	for _, part in parts do
		currentRegionPart = part
		break
	end
	local currentRegion = regionData[currentRegionPart]

	-- handle region change
	if currentRegion ~= lastRegion then
		if lastRegion then
			lastRegion:SetScriptsEnabled(false)
		end

		if currentRegion then
			currentRegion:SetScriptsEnabled(true)
		-- 	print("Entered region: " .. currentRegion.Name)
		-- else
		-- 	print("Exited all regions")
		end

		lastRegion = currentRegion
	end
end)
