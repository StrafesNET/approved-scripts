local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(135, 129, 179)
Lighting.OutdoorAmbient = Color3.fromRGB(181, 182, 255)
Lighting.ColorShift_Top = Color3.fromRGB(47, 70, 199)
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.ClockTime = 8.7
Lighting.GeographicLatitude = -54.8
Lighting.TimeOfDay = 8.40
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end