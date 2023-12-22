wait()

for _, v in pairs(script:GetChildren()) do
	if v:IsA("MaterialVariant") then
		v.Parent = game.MaterialService
	else
		v.Parent = game.Lighting
	end
end

game.Lighting.Ambient = Color3.fromRGB(0,0,0)
game.Lighting.Brightness = 0
game.Lighting.GlobalShadows = false
game.Lighting.OutdoorAmbient = Color3.fromRGB(120,120,120)
game.Lighting.ClockTime = 0
game.Lighting.FogEnd = 1500
game.Lighting.FogColor = Color3.fromRGB(0,0,0)