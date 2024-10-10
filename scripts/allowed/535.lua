local Lighting = game:GetService'Lighting'

local Shaders = script.Parent.Shaders
Shaders.Bloom.Parent = Lighting
Shaders.ColorCorrection.Parent = Lighting
Shaders.SunRays.Parent = Lighting

local LightingSettings = script.Parent.Lighting

LightingSettings.Sky.Parent = Lighting

Lighting.TimeOfDay = LightingSettings.TimeOfDay.Value
Lighting.GeographicLatitude = LightingSettings.GeographicLatitude.Value
Lighting.Brightness = LightingSettings.Brightness.Value
Lighting.FogStart = LightingSettings.FogStart.Value
Lighting.FogEnd = LightingSettings.FogEnd.Value

Lighting.Ambient = LightingSettings.AmbientColor.Value
Lighting.OutdoorAmbient = LightingSettings.OutdoorAmbientColor.Value
Lighting.ColorShift_Bottom = LightingSettings.ColorShiftBottomColor.Value
Lighting.ColorShift_Top = LightingSettings.ColorShiftTopColor.Value
Lighting.FogColor = LightingSettings.FogColorColor.Value
Lighting.GlobalShadows = false
Lighting.Outlines = false
