local part = script.Parent
local light = part.PointLight
local model = part.Parent
local flickerFreq = model:GetAttribute("FlickerFrequency")

local brightness = light.Brightness

while true do		
	light.Brightness = 0
	part.Transparency = 1	
	wait(.02)
	light.Brightness = brightness
	part.Transparency = 0
	wait(.15)
	light.Brightness = 0
	part.Transparency = 1		
	wait(.02)
	light.Brightness = brightness	
	part.Transparency = 0
	
	local rand = math.random(0, flickerFreq)	
	wait(rand)
end
