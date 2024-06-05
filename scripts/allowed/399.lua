local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
Lighting.Ambient = Color3.fromRGB(109, 103, 97)
Lighting.ColorShift_Top = Color3.fromRGB(202, 178, 121)
Lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
Lighting.EnvironmentDiffuseScale = 0.1
Lighting.EnvironmentSpecularScale = 0.2
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
