local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(130,108,106)
Lighting.OutdoorAmbient = Color3.fromRGB(165, 157, 155)
Lighting.EnvironmentDiffuseScale = .4
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end