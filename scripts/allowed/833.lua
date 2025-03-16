local rainbowParts = {}
local rainbowSurfaceLights = {}

local function AddRainbowPart(rainbow)
	if rainbow:IsA("SurfaceLight") then
		table.insert(rainbowSurfaceLights,rainbow)
	else
		table.insert(rainbowParts,rainbow)
	end
end

local CollectionService = game:GetService("CollectionService")
local rainbowTagged = CollectionService:GetTagged("Rainbow")
for _,rainbow in rainbowTagged do
	AddRainbowPart(rainbow)
end
CollectionService:GetInstanceAddedSignal("Rainbow"):Connect(AddRainbowPart)

local tick=tick
local HSV=Color3.fromHSV
local speed=1/(256*6)*30

game:GetService'RunService'.Heartbeat:Connect(function()
	local color=HSV(speed*tick()%1,1,1)
	for _,rainbow in rainbowSurfaceLights do
		rainbow.Color=color
	end
	for _,rainbow in rainbowParts do
		rainbow.Color3=color
	end
end)