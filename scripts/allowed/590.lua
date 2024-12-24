local l = game:GetService("Lighting")

l.Ambient = Color3.fromRGB(138, 138, 138)

l.Brightness = 2.75
--l.GlobalShadows = false

l.FogColor =  Color3.fromRGB(154, 214, 231)
l.FogEnd = 400
l.EnvironmentDiffuseScale = 0.6

script.Skybox.Parent = l
