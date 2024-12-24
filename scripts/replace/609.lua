local l = game:GetService("Lighting")
local skybox = script.Sky


skybox.Parent = l
l.ClockTime = "0"

script.Atmosphere.Parent = l
script.Sky.Parent = l
script.Bloom.Parent = l
script.DepthOfField.Parent = l
script.SunRays.Parent = l