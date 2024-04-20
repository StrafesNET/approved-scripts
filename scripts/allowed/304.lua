local l = game:GetService'Lighting'

script.Atmosphere.Parent = l
script.Sky.Parent = l
script.Bloom.Parent = l
script.Blur.Parent = l
script.ColorCorrection.Parent = l

l.Ambient = Color3.fromRGB(127, 127, 127)
l.Brightness = 1.6
l.ColorShift_Top = Color3.fromRGB(0, 0, 0)
l.OutdoorAmbient = Color3.fromRGB(255, 245, 245)
l.ClockTime = 12
l.GeographicLatitude = 23.5
l.GlobalShadows = false
l.ExposureCompensation = 0.02
l.EnvironmentDiffuseScale = 1
l.EnvironmentSpecularScale = 1
