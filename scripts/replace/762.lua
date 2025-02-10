lighting = game:GetService("Lighting")
lighting.GeographicLatitude = 180
lighting.ClockTime = 12
lighting.Outlines = false
lighting.Brightness = 2
lighting.Ambient = Color3.new(0.835294, 0.698039, 0.666667)
lighting.OutdoorAmbient = Color3.new(0.870588, 0.713725, 0.65098)
lighting.ColorShift_Top = Color3.new(0.709804, 0.823529, 0.854902)
lighting.ColorShift_Bottom = Color3.new(0.85098, 0.772549, 0.580392)
lighting.GlobalShadows = true
lighting.ShadowSoftness = 1
lighting.EnvironmentDiffuseScale = .233
lighting.EnvironmentSpecularScale = .233
workspace.Terrain:SetMaterialColor("Ground",Color3.new(95/255, 57/255, 41/255))
workspace.Terrain:SetMaterialColor("Rock",Color3.new(89/255, 95/255, 95/255))
workspace.Terrain:SetMaterialColor("Sand",Color3.new(143/255, 126/255, 95/255))


script["Sky"].Parent = lighting
script["Bloom"].Parent = lighting
script["SunRays"].Parent = lighting
script["ColorCorrection"].Parent = lighting