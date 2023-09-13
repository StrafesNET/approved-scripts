local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(149, 163, 172)
game.Lighting.OutdoorAmbient = Color3.fromRGB(97, 102, 128)
game.Lighting.ColorShift_Top = Color3.fromRGB(106, 106, 136)
game.Lighting.Brightness = 2.5
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end