--sky generator by tommy ooo la la

local Lighting = game:GetService('Lighting')
local Sky = Instance.new('Sky',Lighting)

Sky.CelestialBodiesShown=true
Sky.MoonAngularSize=11
Sky.SkyboxBk='rbxassetid://13884821297'
Sky.SkyboxDn='rbxassetid://13884821704'
Sky.SkyboxFt='rbxassetid://13884822814'
Sky.SkyboxLf='rbxassetid://13884823580'
Sky.SkyboxRt='rbxassetid://13884828374'
Sky.SkyboxUp='rbxassetid://13884829007'
Sky.MoonTextureId='rbxasset://sky/moon.jpg'
Sky.SkyboxBk='rbxassetid://13884821297'
Sky.SkyboxDn='rbxassetid://13884821704'
Sky.SkyboxFt='rbxassetid://13884822814'
Sky.SkyboxLf='rbxassetid://13884823580'
Sky.SkyboxRt='rbxassetid://13884828374'
Sky.SkyboxUp='rbxassetid://13884829007'
Sky.StarCount=3000
Sky.SunAngularSize=21
Sky.SunTextureId='rbxasset://sky/sun.jpg'

Lighting.Ambient=Color3.fromRGB(100,100,100)
Lighting.Brightness=2
Lighting.ClockTime=14.48333
Lighting.ColorShift_Bottom=Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top=Color3.fromRGB(151,181,251)
Lighting.EnvironmentDiffuseScale=0.2
Lighting.EnvironmentSpecularScale=0.2
Lighting.ExposureCompensation=0.2
Lighting.FogColor=Color3.fromRGB(191,191,191)
Lighting.FogEnd=100000
Lighting.FogStart=0
Lighting.GeographicLatitude=29
Lighting.GlobalShadows=true
Lighting.OutdoorAmbient=Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness=0.5
Lighting.TimeOfDay='14:29:00'

script:Destroy()