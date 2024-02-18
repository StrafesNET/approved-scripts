local Lighting = game:GetService("Lighting")
Lighting.OutdoorAmbient = Color3.fromRGB(140,140,140)
Lighting.Brightness = 10
Lighting.Ambient = Color3.fromRGB(70,70,70)
Lighting.ClockTime = 0.5
Lighting.GeographicLatitude = 0
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end