local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(135, 129, 179)
game.Lighting.OutdoorAmbient = Color3.fromRGB(181, 182, 255)
game.Lighting.ColorShift_Top = Color3.fromRGB(47, 70, 199)
game.Lighting.EnvironmentDiffuseScale = 1
game.Lighting.EnvironmentSpecularScale = 1
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
game.Lighting.ClockTime = 8.7
game.Lighting.GeographicLatitude = -54.8
game.Lighting.TimeOfDay = 8.40
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end