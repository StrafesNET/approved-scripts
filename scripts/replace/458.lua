local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(130, 108, 106)
game.Lighting.OutdoorAmbient = Color3.fromRGB(127, 124, 120)
game.Lighting.ColorShift_Top = Color3.fromRGB(202, 202, 200)
game.Lighting.EnvironmentDiffuseScale = 1
game.Lighting.GlobalShadows = false
game.Lighting.ClockTime = 17.162
game.Lighting.GeographicLatitude = -61.318
game.Lighting.TimeOfDay = 17.09
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end