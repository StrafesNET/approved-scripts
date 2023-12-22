local Lighting=game:GetService'Lighting'
local MaterialService=game:GetService'MaterialService'

for _, v in script:GetChildren() do
	if v:IsA("MaterialVariant") then
		v.Parent = MaterialService
	else
		v.Parent = Lighting
	end
end

Lighting.Ambient = Color3.fromRGB(0,0,0)
Lighting.Brightness = 0
Lighting.GlobalShadows = false
Lighting.OutdoorAmbient = Color3.fromRGB(120,120,120)
Lighting.ClockTime = 0
Lighting.FogEnd = 1500
Lighting.FogColor = Color3.fromRGB(0,0,0)