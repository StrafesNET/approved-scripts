local lighting = game:GetService("Lighting")

lighting.TimeOfDay = 10
lighting.Ambient = Color3.fromRGB(127, 127, 127)
lighting.OutdoorAmbient = Color3.fromRGB(127, 127, 127)
lighting.Brightness = 0.125
lighting.ColorShift_Bottom = Color3.fromRGB(75, 65, 127)
lighting.ColorShift_Top = Color3.fromRGB(127, 120, 94)
lighting.FogColor = Color3.fromRGB(179, 178, 162)
lighting.FogEnd = 500
lighting.FogStart = 0
lighting.GeographicLatitude = 0
lighting.EnvironmentDiffuseScale = 0
lighting.EnvironmentSpecularScale = 0

script.Sky.Parent = lighting
script.ColorCorrection.Parent = lighting
script.SunRays.Parent = lighting
