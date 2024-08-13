local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
Lighting.EnvironmentSpecularScale = .25
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
