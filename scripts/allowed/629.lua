local l = game:GetService("Lighting");
local skybox = script.Sky;

skybox.SkyboxBk = '' --http://www.roblox.com/asset/?id=6285719338
skybox.SkyboxDn = '' --http://www.roblox.com/asset/?id=6285721078
skybox.SkyboxFt = '' --http://www.roblox.com/asset/?id=6285722964
skybox.SkyboxLf = '' --http://www.roblox.com/asset/?id=6285724682
skybox.SkyboxRt = '' --http://www.roblox.com/asset/?id=6285726335
skybox.SkyboxUp = '' --http://www.roblox.com/asset/?id=6285730635

skybox.MoonTextureId = 'http://www.roblox.com/asset/?id=9028249353'
skybox.MoonAngularSize = 15;
skybox.StarCount = 5000;

skybox.Parent = l;

l.ClockTime = 0;
l.GeographicLatitude = 56.75;

l.Brightness = 1.25;

--[[

l.Ambient = Color3.new(0.176471, 0.156863, 0.258824);

l.FogColor = Color3.new(0.0980392, 0.0862745, 0.133333);
l.FogEnd = 300;
l.FogStart = 100;
]]
l.ExposureCompensation = 0.25;

script:Destroy(); -- saw quat being happy when this was on a map's lighting script lmao
