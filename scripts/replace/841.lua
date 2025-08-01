local	lighting = game:GetService("Lighting")
lighting.GeographicLatitude = 58
lighting.ClockTime = 12.4
lighting.Brightness = 1.5
lighting.Ambient = Color3.new(0.54902, 0.54902, 0.54902)
lighting.OutdoorAmbient = Color3.new(0, 0, 0)
lighting.ColorShift_Top = Color3.new(0, 0, 0)
lighting.GlobalShadows = true
lighting.EnvironmentDiffuseScale = 0
lighting.EnvironmentSpecularScale = 0

script:WaitForChild("Sky").Parent = lighting
script:WaitForChild("Atmosphere").Parent = lighting
script:WaitForChild("ColorCorrection").Parent = lighting

local t = workspace.Terrain
t.WaterWaveSize = 0.15
t.WaterReflectance = .7
t.WaterColor = Color3.fromRGB(75, 86, 91)
t.WaterTransparency = 1
t.WaterWaveSpeed =10
