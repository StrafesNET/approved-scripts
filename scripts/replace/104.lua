local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(124, 126, 128)
game.Lighting.ColorShift_Top = Color3.fromRGB(180, 155, 131)
game.Lighting.OutdoorAmbient = Color3.fromRGB(118, 108, 95)
game.Lighting.Brightness = 2
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end