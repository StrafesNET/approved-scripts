local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(145, 126, 117)
Lighting.OutdoorAmbient = Color3.fromRGB(194,135,112)
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.ShadowSoftness = 1
Lighting.ClockTime = -10.967
Lighting.GeographicLatitude = -21.134
Lighting.TimeOfDay = -10.58
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end