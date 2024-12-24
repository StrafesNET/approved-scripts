local lighting = game:GetService("Lighting")
lighting.Ambient = Color3.fromRGB(120, 120, 120)
lighting.Brightness = 1
lighting.EnvironmentDiffuseScale = 1
lighting.EnvironmentSpecularScale = 0
lighting.OutdoorAmbient = Color3.fromRGB(100, 100, 100)

script.Sky.Parent = lighting
