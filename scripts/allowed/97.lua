local l = game:GetService("Lighting")

--l.Technology = Enum.Technology.ShadowMap
script.SkyBox.Parent = l
script.ColorCorrection.Parent = l
l.Ambient = Color3.fromRGB(100, 100, 100)
l.GlobalShadows = false
l.Brightness = 1
l.Outlines = false