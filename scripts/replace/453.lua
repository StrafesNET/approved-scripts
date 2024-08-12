-- This script makes a light in the map flicker on and off randomly

local onColor = Color3.fromRGB(134, 134, 100)
local offColor = Color3.fromRGB(116, 115, 113)
local lights = {}
for _, inst in script.Parent:GetChildren() do
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

local waitTimer = 0
local flickerTimer = 0
local isFlickering = false
local waitLength = getWaitLength()
local flickerLength = getFlickerLength()

local function onStep(dt)
	if isFlickering then
		flickerTimer = flickerTimer + dt
		if flickerTimer > flickerLength then
			-- Turn light back on and reset timers
			isFlickering = false
			script.Parent.Color = onColor
			for _, light in lights do
				light.Enabled = true
			end
			flickerTimer = 0
			waitTimer = 0
			waitLength = getWaitLength()
			flickerLength = getFlickerLength()
		end
	else
		waitTimer = waitTimer + dt
		if waitTimer > waitLength then
			-- Turn light off
			isFlickering = true
			script.Parent.Color = offColor
			for _, light in lights do
				light.Enabled = false
			end
		end
	end
end

game:GetService("RunService").RenderStepped:Connect(onStep)