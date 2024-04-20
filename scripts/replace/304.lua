script.Atmosphere.Parent = game:GetService("Lighting")
script.Sky.Parent = game:GetService("Lighting")
script.Bloom.Parent = game:GetService("Lighting")
script.Blur.Parent = game:GetService("Lighting")
script.ColorCorrection.Parent = game:GetService("Lighting")

local l = game.Lighting

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


