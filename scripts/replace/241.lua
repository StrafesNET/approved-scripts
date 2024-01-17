local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(70,70,70)
game.Lighting.ColorShift_Top = Color3.fromRGB(0,0,0)
game.Lighting.OutdoorAmbient = Color3.fromRGB(100,100,100)
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
