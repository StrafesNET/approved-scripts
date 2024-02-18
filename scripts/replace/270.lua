isBedLightOn = 1
bulb = script.Parent
brick = script.Parent

function bedlight(lantern)
	if isBedLightOn == 0 then
		bulb.PointLight.Enabled = true
		brick.Material = "Neon"
		brick.Transparency = 0.5
		isBedLightOn = 1
	else
		bulb.PointLight.Enabled = false
		brick.Material = "Metal"
		brick.Transparency = 0
		isBedLightOn = 0
	end
end

brick.ClickDetector.MouseClick:connect(bedlight)