local lighting = game:GetService("Lighting")

lighting.Ambient = Color3.fromRGB(30,50,30)
lighting.Brightness = 2
lighting.EnvironmentDiffuseScale = 0.5
lighting.EnvironmentSpecularScale = 1
lighting.OutdoorAmbient = Color3.fromRGB(70,70,70)
lighting.ShadowSoftness = 1
lighting.ClockTime = 11.6
lighting.GeographicLatitude = 18.5

script.Sky.Parent = lighting
script.Bloom.Parent = lighting

script.Wood.Parent = game:GetService("MaterialService")
