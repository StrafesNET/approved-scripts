local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(97, 102, 117)
game.Lighting.ColorShift_Top = Color3.fromRGB(142, 176, 255)
game.Lighting.OutdoorAmbient = Color3.fromRGB(96, 101, 118)
game.Lighting.Brightness = 2
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
game.Lighting.ShadowSoftness = 0.2
game.Lighting.ClockTime = -14.081
game.Lighting.GeographicLatitude = 80.992
game.Lighting.TimeOfDay = 14.04
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end