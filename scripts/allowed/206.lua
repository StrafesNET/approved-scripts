--sky generator by tommy ooo la la

local Lighting = game:GetService('Lighting')
local Sky = Instance.new('Sky',Lighting)

Sky.CelestialBodiesShown=true
Sky.MoonAngularSize=11
Sky.SkyboxBk='rbxasset://textures/sky/sky512_bk.tex'
Sky.SkyboxDn='rbxasset://textures/sky/sky512_dn.tex'
Sky.SkyboxFt='rbxasset://textures/sky/sky512_ft.tex'
Sky.SkyboxLf='rbxasset://textures/sky/sky512_lf.tex'
Sky.SkyboxRt='rbxasset://textures/sky/sky512_rt.tex'
Sky.SkyboxUp='rbxasset://textures/sky/sky512_up.tex'
Sky.MoonTextureId='rbxasset://sky/moon.jpg'
Sky.SkyboxBk='rbxasset://textures/sky/sky512_bk.tex'
Sky.SkyboxDn='rbxasset://textures/sky/sky512_dn.tex'
Sky.SkyboxFt='rbxasset://textures/sky/sky512_ft.tex'
Sky.SkyboxLf='rbxasset://textures/sky/sky512_lf.tex'
Sky.SkyboxRt='rbxasset://textures/sky/sky512_rt.tex'
Sky.SkyboxUp='rbxasset://textures/sky/sky512_up.tex'
Sky.StarCount=3000
Sky.SunAngularSize=21
Sky.SunTextureId='rbxasset://sky/sun.jpg'

Lighting.Ambient=Color3.fromRGB(100,100,100)
Lighting.Brightness=2
Lighting.ClockTime=14
Lighting.ColorShift_Bottom=Color3.fromRGB(0,0,0)
Lighting.ColorShift_Top=Color3.fromRGB(0,0,0)
Lighting.EnvironmentDiffuseScale=0.2
Lighting.EnvironmentSpecularScale=0.2
Lighting.ExposureCompensation=0
Lighting.FogColor=Color3.fromRGB(191,191,191)
Lighting.FogEnd=100000
Lighting.FogStart=0
Lighting.GeographicLatitude=41.7333
Lighting.GlobalShadows=true
Lighting.OutdoorAmbient=Color3.fromRGB(0,0,0)
Lighting.ShadowSoftness=0.5
Lighting.TimeOfDay='14:00:00'

script:Destroy()