local Lighting = game:GetService("Lighting")
local MaterialService = game:GetService("MaterialService")

local Lighting_Config = script.Lighting_Config
local LightingAssets = script.LightingAssets

local MaterialFolder = script.Materials

MaterialService:ClearAllChildren()
Lighting:ClearAllChildren()

for i, v in pairs(Lighting_Config:GetChildren()) do
	Lighting[v.Name] = v.Value
end

for i, v in pairs(LightingAssets:GetChildren()) do
	v:Clone().Parent = Lighting
end

for i, v in pairs(MaterialFolder:GetChildren()) do
	if v:IsA("MaterialVariant") then
		local new = v:Clone()
		new.Parent = MaterialService
	end
end