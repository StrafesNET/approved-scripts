local lighting = game:GetService("Lighting")

lighting.Ambient = Color3.fromRGB(86, 100, 85)
lighting.Brightness = 3
lighting.ColorShift_Bottom = Color3.fromRGB(28, 34, 31)
lighting.ColorShift_Top = Color3.fromRGB(41, 52, 42)
lighting.EnvironmentDiffuseScale = 1
lighting.EnvironmentSpecularScale = 1
lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)
lighting.ShadowSoftness = .4
lighting.ClockTime = 13.734
lighting.GeographicLatitude = 70


script["Sky"].Parent = lighting
script["Bloom"].Parent = lighting
script["SunRays"].Parent = lighting
script["ColorCorrection"].Parent = lighting
script["Atmosphere"].Parent = lighting
script["DepthOfField"].Parent = lighting
script["Blur"].Parent = lighting