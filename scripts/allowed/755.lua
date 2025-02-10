local Lighting = game:GetService'Lighting'

local LightingConfig = script.Parent.Lighting
LightingConfig.Sky.Parent = Lighting

Lighting.TimeOfDay = LightingConfig.TimeOfDay.Value
Lighting.GeographicLatitude = LightingConfig.GeographicLatitude.Value
Lighting.Brightness = LightingConfig.Brightness.Value
Lighting.FogStart = LightingConfig.FogStart.Value
Lighting.FogEnd = LightingConfig.FogEnd.Value
Lighting.Ambient = LightingConfig.AmbientColor.Value
Lighting.OutdoorAmbient = LightingConfig.OutdoorAmbientColor.Value
Lighting.ColorShift_Bottom = LightingConfig.ColorShiftBottomColor.Value
Lighting.ColorShift_Top = LightingConfig.ColorShiftTopColor.Value
Lighting.FogColor = LightingConfig.FogColorColor.Value
Lighting.Outlines = false
Lighting.GlobalShadows = false

local Shaders = script.Parent.Shaders
Shaders.Bloom.Parent = Lighting
Shaders.ColorCorrection.Parent = Lighting
Shaders.SunRays.Parent = Lighting
