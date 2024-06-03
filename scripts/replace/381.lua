local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(91, 92, 118)
game.Lighting.OutdoorAmbient = Color3.fromRGB(125, 130, 154)
game.Lighting.ColorShift_Top = Color3.fromRGB(137, 140, 162)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
game.Lighting.ClockTime = -15.055
game.Lighting.GeographicLatitude = 47.35
game.Lighting.TimeOfDay = 15.03
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end