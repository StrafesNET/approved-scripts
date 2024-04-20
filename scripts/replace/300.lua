--// Credit: awesomegeorsome56

flicker1 = script.Parent.Flicker1
flicker2 = script.Parent.Flicker2

local sounds = {flicker1, flicker2}
light = script.Parent.LightAttachment.PointLight
randomsoundpick = 0
flicker_time = math.random(60,140) -- how long till the light flickers again in seconds



while true do 
	wait(flicker_time)
	
	sounds[math.random(1, #sounds)]:Play()
	light.Enabled = false
	script.Parent.LightPart.Material = Enum.Material.Plastic
	wait(0.1)
	light.Enabled = true
	script.Parent.LightPart.Material = Enum.Material.Neon
end