local isBedLightOn = true
local bulb = script.Parent
local brick = script.Parent

function bedlight(lantern)
	isBedLightOn=not isBedLightOn
	bulb.PointLight.Enabled = isBedLightOn
	if isBedLightOn then
		brick.Material = "Neon"
		brick.Transparency = 0.5
	else
		brick.Material = "Metal"
		brick.Transparency = 0
	end
end

brick.ClickDetector.MouseClick:connect(bedlight)