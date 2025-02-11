local Players = game:GetService("Players")
local RunService = game:GetService("RunService")

local model = script.Parent
local regionsFolder = model:WaitForChild("Regions")
for i = 1,18 do
	regionsFolder:WaitForChild("Region"..i)
end


local player = Players.LocalPlayer
local camera = workspace.CurrentCamera

local regionData = {}
local lastRegion = nil
local lastRegionEntryTime = 0

local function createRegion3FromPart(part)
	local size = part.Size
	local cframe = part.CFrame
	local halfSize = size / 2

	local min = cframe * Vector3.new(-halfSize.X, -halfSize.Y, -halfSize.Z)
	local max = cframe * Vector3.new(halfSize.X, halfSize.Y, halfSize.Z)

	return Region3.new(min, max)
end

-- populate regionData w/ scripts and regionParts
for _, regionModel in ipairs(regionsFolder:GetChildren()) do
	if regionModel:IsA("Model") then
		
		-- add animator script to every region
		local animator = script.Animator:Clone()
		animator.Parent = regionModel
		
		local regionPart = regionModel:WaitForChild("RegionPart", 10)
		if regionPart and regionPart:IsA("BasePart") then
			local scripts = {}
			local displays = {}
			for _, descendant in ipairs(regionModel:GetDescendants()) do
				if descendant:IsA("Script") or descendant:IsA("LocalScript") then
					table.insert(scripts, descendant)
				end
			end
			regionData[regionModel] = {
				regionPart = regionPart,
				scripts = scripts,
				displays = displays,
				region3 = createRegion3FromPart(regionPart)
			}
		else
			warn("Region model '" .. regionModel.Name .. "' is missing a valid RegionPart.")
		end
	end
end

-- enable scripts in a region
local function enableScripts(regionModel)
	if regionData[regionModel] then
		for _, script in ipairs(regionData[regionModel].scripts) do
			script.Enabled = true
		end
	end
end

-- disable scripts in a region
local function disableScripts(regionModel)
	if regionData[regionModel] then
		for _, script in ipairs(regionData[regionModel].scripts) do
			script.Enabled = false
		end
	end
end

-- disable scripts in all regions except the specified one
local function disableAllExcept(currentRegion)
	for regionModel, data in pairs(regionData) do
		if regionModel ~= currentRegion then
			disableScripts(regionModel)
		end
	end
end

-- find if camera is inside a region
function PointInPart(point, part)
	point = part.CFrame:pointToObjectSpace(point)
	return math.abs(point.X) <= part.Size.X / 2
		and math.abs(point.Y) <= part.Size.Y / 2
		and math.abs(point.Z) <= part.Size.Z / 2
end


-- check what region player is in and enable/disable scripts
RunService.Heartbeat:Connect(function()
	if player and camera then
		local cameraCFrame = camera.CFrame
		local cameraPosition = cameraCFrame.Position

		local currentRegion = nil

		-- find current region camera is in
		for regionModel, data in pairs(regionData) do
			local regionPart = data.regionPart
			local cameraInPart = PointInPart(workspace.CurrentCamera.CoordinateFrame.p, regionPart)
			if cameraInPart then
				currentRegion = regionModel
				break
			end
		end

		-- handle region change
		local currentTime = tick()
		if currentRegion ~= lastRegion then
			if lastRegion then
				disableScripts(lastRegion)
			end

			if currentRegion then
				enableScripts(currentRegion) 
				print("Entered region: " .. currentRegion.Name)
			else
				print("Exited all regions")
			end

			lastRegion = currentRegion
			lastRegionEntryTime = currentTime
		elseif currentRegion == nil and lastRegion ~= nil then
			disableScripts(lastRegion)
			print("Exited all regions")
			lastRegion = nil
			lastRegionEntryTime = currentTime
		else 
			--same region as before
		end
	end
end)