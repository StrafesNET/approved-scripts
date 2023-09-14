local l = game:GetService("Lighting")
l.Ambient = Color3.fromRGB(101, 124, 159)
l.Brightness = 1.5
l.ColorShift_Top = Color3.fromRGB(235,222,177)
--l.OutdoorAmbient = Color3.fromRGB(235,222,177)
l.OutdoorAmbient = Color3.fromRGB(140,140,140)
l.ClockTime = 10.9
l.GeographicLatitude = 48

local t = workspace.Terrain
t.WaterColor = Color3.fromRGB(92, 90, 72)
t.WaterReflectance = 0
t.WaterTransparency = 0.5
t.WaterWaveSize = 0.05
t.WaterWaveSpeed = 0

script.Parent.Parent = l