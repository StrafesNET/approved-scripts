-- This script makes a light in the map flicker on and off randomly

local Parent = script.Parent
local onColor = Color3.fromRGB(134, 134, 100)
local offColor = Color3.fromRGB(116, 115, 113)
local lights = {}
for _, inst in Parent:GetChildren() do
	if inst:IsA("SurfaceLight") then
		table.insert(lights, inst)
	end
end

local function getFlickerLength()
	return math.random(20, 40) / 100
end

local function getWaitLength()
	return math.random(100, 500) / 100
end

local function SetLightsOn(On)
	for _, light in lights do
		light.Enabled = On
	end
end

while true do
	--wait
	task.wait(getWaitLength())
	-- Turn light off
	Parent.Color = offColor
	SetLightsOn(false)
	--wait
	task.wait(getFlickerLength())
	-- Turn light back on
	Parent.Color = onColor
	SetLightsOn(true)
end
