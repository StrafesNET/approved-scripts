local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(145, 126, 117)
game.Lighting.OutdoorAmbient = Color3.fromRGB(194,135,112)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
game.Lighting.ShadowSoftness = 1
game.Lighting.ClockTime = -10.967
game.Lighting.GeographicLatitude = -21.134
game.Lighting.TimeOfDay = -10.58
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end