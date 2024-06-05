local Lighting = game:GetService("Lighting")
game.Lighting.GlobalShadows = false
game.Lighting.Ambient = Color3.fromRGB(109, 103, 97)
game.Lighting.ColorShift_Top = Color3.fromRGB(202, 178, 121)
game.Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
game.Lighting.EnvironmentDiffuseScale = 0.1
game.Lighting.EnvironmentSpecularScale = 0.2
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
