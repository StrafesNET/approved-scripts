local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.new(1,1,1)
Lighting.GlobalShadows = false
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end