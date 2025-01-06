local l = game:GetService("Lighting");
script.Sky.Parent = l;

l.ClockTime = 0;
l.GeographicLatitude = 56.75;

l.Brightness = 1.25;

l.ExposureCompensation = 0.25;

script:Destroy(); -- saw quat being happy when this was on a map's lighting script lmao
