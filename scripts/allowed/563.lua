local lighting = game:GetService("Lighting")

lighting.ClockTime = 4
lighting.GeographicLatitude = 0
lighting.Ambient = Color3.fromRGB(100, 90, 70)
lighting.Brightness = 0.2
lighting.EnvironmentDiffuseScale = 1
lighting.EnvironmentSpecularScale = 1
lighting.ShadowSoftness = 1

script.Atmosphere.Parent = lighting
script.Sky.Parent = lighting
script.Bloom.Parent = lighting