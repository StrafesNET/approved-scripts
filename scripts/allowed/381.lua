local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(91, 92, 118)
Lighting.OutdoorAmbient = Color3.fromRGB(125, 130, 154)
Lighting.ColorShift_Top = Color3.fromRGB(137, 140, 162)
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.ClockTime = -15.055
Lighting.GeographicLatitude = 47.35
Lighting.TimeOfDay = 15.03
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end