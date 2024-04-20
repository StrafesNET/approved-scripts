--// Credit: awesomegeorsome56

local sounds = {script.Parent.Flicker1, script.Parent.Flicker2}
local NSounds = #sounds
local Light = script.Parent.LightAttachment.PointLight
local LightPart = script.Parent.LightPart

while true do
	-- how long till the light flickers again in seconds
	task.wait(math.random(60,140))
	
	sounds[math.random(NSounds)]:Play()
	Light.Enabled = false
	LightPart.Material = Enum.Material.Plastic
	task.wait(0.1)
	Light.Enabled = true
	LightPart.Material = Enum.Material.Neon
end