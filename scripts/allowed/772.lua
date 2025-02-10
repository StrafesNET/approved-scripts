local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = true
Lighting.Ambient = Color3.fromRGB(0, 26, 98)
Lighting.EnvironmentSpecularScale = .25
Lighting.EnvironmentDiffuseScale = .1
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end