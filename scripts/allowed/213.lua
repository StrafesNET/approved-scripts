--sky generator by tommy ooo la la

local Lighting = game:GetService('Lighting')
local Sky = Instance.new('Sky',Lighting)

Sky.CelestialBodiesShown=true
Sky.MoonAngularSize=11
Sky.SkyboxBk='rbxassetid://13949754602'
Sky.SkyboxDn='rbxassetid://13949754731'
Sky.SkyboxFt='rbxassetid://13949754894'
Sky.SkyboxLf='rbxassetid://13949755139'
Sky.SkyboxRt='rbxassetid://13949755378'
Sky.SkyboxUp='rbxassetid://13949755664'
Sky.MoonTextureId='rbxasset://sky/moon.jpg'
Sky.SkyboxBk='rbxassetid://13949754602'
Sky.SkyboxDn='rbxassetid://13949754731'
Sky.SkyboxFt='rbxassetid://13949754894'
Sky.SkyboxLf='rbxassetid://13949755139'
Sky.SkyboxRt='rbxassetid://13949755378'
Sky.SkyboxUp='rbxassetid://13949755664'
Sky.StarCount=3000
Sky.SunAngularSize=21
Sky.SunTextureId='rbxasset://sky/sun.jpg'

Lighting.Ambient=Color3.fromRGB(100,100,100)
Lighting.Brightness=2
Lighting.ClockTime=12.96667
Lighting.ColorShift_Bottom=Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top=Color3.fromRGB(253,226,170)
Lighting.EnvironmentDiffuseScale=0.2
Lighting.EnvironmentSpecularScale=0.2
Lighting.ExposureCompensation=0.8
Lighting.FogColor=Color3.fromRGB(191,191,191)
Lighting.FogEnd=100000
Lighting.FogStart=0
Lighting.GeographicLatitude=70
Lighting.GlobalShadows=true
Lighting.OutdoorAmbient=Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness=0.5
Lighting.TimeOfDay='12:58:00'

script:Destroy()