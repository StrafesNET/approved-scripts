local Lighting = game:GetService("Lighting")
game.Lighting.ColorShift_Top = Color3.fromRGB(150, 142, 171)
game.Lighting.OutdoorAmbient = Color3.fromRGB(144, 144, 147)
game.Lighting.Brightness = 2
game.Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end