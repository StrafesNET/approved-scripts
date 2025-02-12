local l = game:GetService("Lighting")

script.SkyBox.Parent = l
l.Ambient = Color3.fromRGB(100, 100, 100)
l.Brightness = 2
l.EnvironmentDiffuseScale = 1
l.EnvironmentSpecularScale = 1