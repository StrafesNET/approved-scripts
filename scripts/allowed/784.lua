local Lighting = game:GetService("Lighting")
Lighting.EnvironmentSpecularScale = .25
Lighting.EnvironmentDiffuseScale = .1
Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end