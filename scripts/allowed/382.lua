local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(131, 126, 165)
Lighting.OutdoorAmbient = Color3.fromRGB(142, 143, 200)
Lighting.ColorShift_Top = Color3.fromRGB(255, 88, 32)
Lighting.Outlines = false
Lighting.GlobalShadows = true
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1
Lighting.ClockTime = -16.90
Lighting.GeographicLatitude = 37.041
Lighting.TimeOfDay = 16.52
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end