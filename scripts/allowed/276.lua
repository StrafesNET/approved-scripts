local Lighting = game:GetService("Lighting")
Lighting.OutdoorAmbient = Color3.fromRGB(165,153,153)
Lighting.Ambient = Color3.fromRGB(131,131,131)
Lighting.ClockTime = 17.6
Lighting.GeographicLatitude = 25.33
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end