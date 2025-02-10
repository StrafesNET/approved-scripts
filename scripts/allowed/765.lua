local Lighting = game:GetService("Lighting")
Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end