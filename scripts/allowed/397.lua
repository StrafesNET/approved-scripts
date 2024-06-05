local l = game:GetService("Lighting")

l.Ambient = Color3.fromRGB(100, 100, 100)
l.Brightness = 0.5
--l.GlobalShadows = false
l.FogColor =  Color3.fromRGB(192, 171, 128)
l.FogEnd = 2000

script.Sky.Parent = l