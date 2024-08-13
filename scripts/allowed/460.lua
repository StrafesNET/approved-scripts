local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
Lighting.Ambient = Color3.fromRGB(161, 144, 129)
Lighting.ColorShift_Top = Color3.fromRGB(113, 113, 185)
Lighting.OutdoorAmbient = Color3.fromRGB(125, 130, 154)
Lighting.EnvironmentDiffuseScale = 0.1
Lighting.EnvironmentSpecularScale = 0.2
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
