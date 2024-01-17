local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(90,90,90)
game.Lighting.ColorShift_Top = Color3.fromRGB(136,155,172)
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end