local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
Lighting.EnvironmentSpecularScale = .25
Lighting.Ambient = Color3.fromRGB(127, 127, 127)
Lighting.OutdoorAmbient = Color3.fromRGB(154, 147, 147)
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end