local Lighting=game:GetService'Lighting'
Lighting.Ambient=Color3.fromRGB(100,88,78)
local c=script:GetChildren()
for i=1,#c do
	c[i].Parent=Lighting
end
