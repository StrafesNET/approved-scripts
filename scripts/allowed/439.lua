local Lighting = game:GetService("Lighting")
local MaterialService = game:GetService("MaterialService")

local Lighting_Config = script.Lighting_Config
local LightingAssets = script.LightingAssets

local Materials = script.Materials

for _, v in Lighting_Config:GetChildren() do
	Lighting[v.Name] = v.Value
end

for _, v in LightingAssets:GetChildren() do
	v.Parent = Lighting
end

for _, v in Materials:GetChildren() do
	v.Parent = MaterialService
end
