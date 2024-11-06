local Lighting = game:GetService("Lighting")
game.Lighting.Ambient = Color3.fromRGB(108,108,147)
game.Lighting.OutdoorAmbient = Color3.fromRGB(107,119,149)
game.Lighting.ColorShift_Top = Color3.fromRGB(183,218,255)
game.Lighting.EnvironmentDiffuseScale = 1
game.Lighting.EnvironmentSpecularScale = 1
game.Lighting.Outlines = false
game.Lighting.GlobalShadows = true
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end