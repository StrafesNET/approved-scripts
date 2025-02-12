local l = game:GetService("Lighting")
l.Ambient = Color3.fromRGB(100, 100, 100)
l.Brightness = 2
l.EnvironmentDiffuseScale = 1
l.EnvironmentSpecularScale = 1

script.SkyBox.Parent = l
