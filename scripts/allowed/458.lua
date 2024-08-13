local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(130, 108, 106)
Lighting.OutdoorAmbient = Color3.fromRGB(127, 124, 120)
Lighting.ColorShift_Top = Color3.fromRGB(202, 202, 200)
Lighting.EnvironmentDiffuseScale = 1
Lighting.GlobalShadows = false
Lighting.ClockTime = 17.162
Lighting.GeographicLatitude = -61.318
Lighting.TimeOfDay = 17.09
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
