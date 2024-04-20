local Lighting = game:GetService'Lighting'

local s = Instance.new("Sky",Lighting)
s.SkyboxBk = "http://www.roblox.com/asset/?id=3890256003"
s.SkyboxDn = "http://www.roblox.com/asset/?id=3890256648"
s.SkyboxFt = "http://www.roblox.com/asset/?id=3890257099"
s.SkyboxLf = "http://www.roblox.com/asset/?id=3890257619"
s.SkyboxRt = "http://www.roblox.com/asset/?id=3890258346"
s.SkyboxUp = "http://www.roblox.com/asset/?id=3890258843" 
s.MoonTextureId = ""
s.SunTextureId = ""
Lighting.TimeOfDay="6:00:00"
Lighting.ColorCorrection.Brightness="-0.45"
Lighting.ColorCorrection.Saturation="0.5"
Lighting.ShadowSoftness = "0.5"