local lighting = game:GetService("Lighting")
lighting.GeographicLatitude = -12.269
lighting.ClockTime = 6.4
lighting.Outlines = false
lighting.Brightness = 2
lighting.Ambient = Color3.new(0.392157, 0.392157, 0.392157)
lighting.OutdoorAmbient = Color3.new(0.392157, 0.392157, 0.392157)
lighting.ColorShift_Top = Color3.new(0, 0, 0)
lighting.GlobalShadows = true
workspace.Terrain:SetMaterialColor(Enum.Material.Ground,Color3.new(95/255, 57/255, 41/255))
workspace.Terrain:SetMaterialColor(Enum.Material.Rock,Color3.new(89/255, 95/255, 95/255))
workspace.Terrain:SetMaterialColor(Enum.Material.Sand,Color3.new(143/255, 126/255, 95/255))

script.Sky.Parent = lighting
script.Bloom.Parent = lighting
script.SunRays.Parent = lighting
script.ColorCorrection.Parent = lighting
