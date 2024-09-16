local lighting = game:GetService("Lighting")
lighting.GeographicLatitude = 24
lighting.ClockTime = 12
lighting.FogColor = Color3.fromRGB(81, 177, 191)
lighting.FogEnd = 7400
lighting.Ambient = Color3.fromRGB(109, 122, 127)
lighting.OutdoorAmbient = Color3.fromRGB(25, 52, 77)
lighting.Brightness = 1
lighting.EnvironmentDiffuseScale = 0
lighting.EnvironmentSpecularScale = 0.5

script["Underwater Skybox 2"].Parent = lighting
script.ColorCorrection.Parent = lighting
