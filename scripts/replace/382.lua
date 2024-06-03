local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(131, 126, 165)
game.Lighting.OutdoorAmbient = Color3.fromRGB(142, 143, 200)
game.Lighting.ColorShift_Top = Color3.fromRGB(255, 88, 32)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
game.Lighting.EnvironmentDiffuseScale = 1
game.Lighting.EnvironmentSpecularScale = 1
game.Lighting.ClockTime = -16.90
game.Lighting.GeographicLatitude = 37.041
game.Lighting.TimeOfDay = 16.52
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end