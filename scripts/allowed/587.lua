local lighting = game:GetService("Lighting")
local correct = script.ColorCorrection
local bloom = script.Bloom
local skybox = script.Sky
local terrain = game.Workspace.Terrain

lighting.Ambient = Color3.new(0.815686, 0.784314, 0.909804)
lighting.Brightness = 4
lighting.ColorShift_Bottom = Color3.new(0, 0, 0)
lighting.ColorShift_Top = Color3.new(1, 0.870588, 0.662745)
lighting.EnvironmentDiffuseScale = 1
lighting.EnvironmentSpecularScale = 1
lighting.GlobalShadows = true
lighting.OutdoorAmbient = Color3.new(0.67451, 0.662745, 0.486275)
lighting.ShadowSoftness = 1
lighting.ClockTime = 14
lighting.GeographicLatitude = -.25
lighting.ExposureCompensation = 0
lighting.FogColor = Color3.new(0.752941, 0.752941, 0.752941)
lighting.FogEnd = 100000
lighting.FogStart = 0

correct.Brightness = -.025
correct.Contrast = -.1
correct.Saturation = 0.25
correct.TintColor = Color3.new(1, 1, 1)

bloom.Intensity = 0.1
bloom.Size = 56
bloom.Threshold = .05

terrain.WaterColor = Color3.new(0.156863, 0.152941, 0.117647)
terrain.WaterTransparency = 0.4
terrain.WaterReflectance = 1
terrain.WaterWaveSize = .25
terrain.WaterWaveSpeed = 25

skybox.Parent = lighting
correct.Parent = lighting
bloom.Parent = lighting