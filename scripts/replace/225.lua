wait()

local l = game:GetService("Lighting")
--clouds
local w = game:GetService("Workspace")
local t = w.Terrain
--clouds variable end

l.Ambient = Color3.fromRGB(100, 100, 100)


--l.Brightness = 3
--l.GlobalShadows = false

--script.Sky.Parent = l
script.Atmosphere.Parent = l
script.Bloom.Parent = l
script.SunRays.Parent = l

--clouds--
--script.Clouds.Parent = t