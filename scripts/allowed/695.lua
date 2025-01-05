local Lighting = game:GetService("Lighting")
Lighting.Ambient = Color3.fromRGB(210,210,210)
Lighting.OutdoorAmbient = Color3.fromRGB(128,128,128)
Lighting.GlobalShadows = true

SunFlare = Instance.new("SunRaysEffect", Lighting)
SunFlare.Intensity = 0.105
SunFlare.Spread = 1

script:WaitForChild("Sky").Parent = Lighting
