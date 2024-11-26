local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(97, 102, 117)
Lighting.ColorShift_Top = Color3.fromRGB(142, 176, 255)
Lighting.OutdoorAmbient = Color3.fromRGB(96, 101, 118)
Lighting.Brightness = 2
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.ShadowSoftness = 0.2
Lighting.ClockTime = -14.081
Lighting.GeographicLatitude = 80.992
Lighting.TimeOfDay = 14.04
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
