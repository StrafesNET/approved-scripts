local Lighting=game:GetService'Lighting'

Lighting.Ambient = Color3.fromRGB(70,70,70)
Lighting.OutdoorAmbient = Color3.fromRGB(70,70,70)
Lighting.Brightness = 3
Lighting.ClockTime = 14.5
Lighting.EnvironmentDiffuseScale = 1
Lighting.EnvironmentSpecularScale = 1
Lighting.FogColor = Color3.fromRGB(192,192,192)

script:WaitForChild("SunRays").Parent = Lighting

script:WaitForChild("Skybox").Parent = Lighting