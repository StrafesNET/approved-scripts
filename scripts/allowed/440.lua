--sky generator by tommy ooo la la

local Lighting = game:GetService('Lighting')
local Sky = Instance.new('Sky',Lighting)

Sky.CelestialBodiesShown=false
Sky.SkyboxBk='rbxassetid://17800417456'
Sky.SkyboxDn='rbxassetid://17800417456'
Sky.SkyboxFt='rbxassetid://17800417456'
Sky.SkyboxLf='rbxassetid://17800417456'
Sky.SkyboxRt='rbxassetid://17800417456'
Sky.SkyboxUp='rbxassetid://17800417456'

Lighting.Ambient=Color3.fromRGB(65, 65, 65)
Lighting.Brightness=0
Lighting.EnvironmentDiffuseScale=0
Lighting.EnvironmentSpecularScale=0
Lighting.ExposureCompensation=0.35
Lighting.FogColor=Color3.fromRGB(191,191,191)
Lighting.FogEnd=100000
Lighting.FogStart=0
Lighting.GlobalShadows=false
Lighting.OutdoorAmbient=Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness=0.5

script:Destroy()