local s = Instance.new("Sky")
local l = game:GetService'Lighting'

s.Parent = l

s.SkyboxBk = "http://www.roblox.com/asset/?id=600830446"
s.SkyboxDn = "http://www.roblox.com/asset/?id=600831635"
s.SkyboxFt = "http://www.roblox.com/asset/?id=600832720"
s.SkyboxLf = "http://www.roblox.com/asset/?id=600886090"
s.SkyboxRt = "http://www.roblox.com/asset/?id=600833862"
s.SkyboxUp = "http://www.roblox.com/asset/?id=600835177"

--lighting
l.Ambient = Color3.fromRGB(0, 0, 0)
l.Brightness = 1.5
l.OutdoorAmbient = Color3.fromRGB(125, 120, 95)
l.ClockTime = 14
l.GeographicLatitude = 14

--color correction
local c = Instance.new("ColorCorrectionEffect",l)
c.Brightness = 0.02
c.Contrast = 0.2
c.Saturation = -0.25