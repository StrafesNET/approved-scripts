local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(96, 111, 118)
game.Lighting.ColorShift_Top = Color3.fromRGB(144, 150, 111)
game.Lighting.OutdoorAmbient = Color3.fromRGB(129, 125, 92)
game.Lighting.FogColor = Color3.fromRGB(155, 160, 192)
game.Lighting.FogEnd = 2000
game.Lighting.FogStart = 350
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end