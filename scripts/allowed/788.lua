local lighting = game:GetService("Lighting")

lighting.Ambient = Color3.fromRGB (104, 81, 71)
lighting.OutdoorAmbient = Color3.fromRGB(104, 81, 71)
lighting.Brightness = 0.3
lighting.EnvironmentDiffuseScale = 0
lighting.EnvironmentSpecularScale = 0
lighting.ColorShift_Top = Color3.fromRGB(255, 112, 41)
lighting.ShadowSoftness = 1
lighting.ClockTime = 13.6
lighting.GeographicLatitude = 225

script.Sky.Parent = lighting
