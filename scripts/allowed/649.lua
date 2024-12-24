local wait = task.wait

local part = script.Parent
local light = part:WaitForChild'PointLight'
local model = part.Parent
local flickerFreq = model:GetAttribute("FlickerFrequency")

local brightness = light.Brightness

while true do
	light.Brightness = 0
	part.Transparency = 1
	light.Enabled = false
	wait(.02)
	light.Brightness = brightness
	part.Transparency = 0
	light.Enabled = true
	wait(.15)
	light.Brightness = 0
	part.Transparency = 1
	light.Enabled = false
	wait(.02)
	light.Brightness = brightness
	part.Transparency = 0
	light.Enabled = true

	local rand = math.random(0, flickerFreq)
	wait(rand)
end
