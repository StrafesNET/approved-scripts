local ligting = game:GetService("Lighting")

ligting.Ambient = Color3.fromRGB (104, 81, 71)
ligting.OutdoorAmbient = Color3.fromRGB(104, 81, 71)
ligting.Brightness = 0.3
ligting.EnvironmentDiffuseScale = 0
ligting.EnvironmentSpecularScale = 0
ligting.ColorShift_Top = Color3.fromRGB(255, 112, 41)
ligting.ShadowSoftness = 1
ligting.ClockTime = 13.6
ligting.GeographicLatitude = 225

script:WaitForChild("Sky").Parent = ligting