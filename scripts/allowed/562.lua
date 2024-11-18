local l = game:GetService("Lighting")

l.Ambient = Color3.fromRGB(100, 100, 100)

l.Brightness = .8
--l.GlobalShadows = false

l.FogColor =  Color3.fromRGB(192, 192, 192)
l.FogEnd = 700

script.Skybox.Parent = l
script.ColorCorrection.Parent = l