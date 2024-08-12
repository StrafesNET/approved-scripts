local Lighting = game:GetService("Lighting")
local MaterialService = game:GetService("MaterialService")

local Lighting_Config = script.Lighting_Config
local LightingAssets = script.LightingAssets

local Materials = script.Materials

Lighting:ClearAllChildren()
MaterialService:ClearAllChildren()

for i, v in pairs(Lighting_Config:GetChildren()) do
	Lighting[v.Name] = v.Value
end

for i, v in pairs(LightingAssets:GetChildren()) do
	v:Clone().Parent = Lighting
end


for i, v in pairs(Materials:GetChildren()) do
	local new = v:Clone()
	new.Parent = MaterialService
end