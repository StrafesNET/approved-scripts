wait()

local l = game:GetService("Lighting")

l.Ambient = Color3.fromRGB(100, 100, 100)

l.Brightness = .9
--l.GlobalShadows = false

l.FogColor =  Color3.fromRGB(200, 145, 146)
l.FogEnd = 3000

script.Skybox.Parent = l
