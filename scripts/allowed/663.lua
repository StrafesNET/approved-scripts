local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(100, 109, 139)
Lighting.OutdoorAmbient = Color3.fromRGB(113, 120, 131)
Lighting.ColorShift_Top = Color3.fromRGB(134, 118, 118)
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.Brightness = 2
Lighting.EnvironmentSpecularScale = 1
Lighting.EnvironmentDiffuseScale = 1 
Lighting.ClockTime = 17.610
Lighting.GeographicLatitude = 64
Lighting.TimeOfDay = 17.37
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end