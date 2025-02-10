local lighting = game:GetService'Lighting'
lighting.Ambient = Color3.fromRGB(200,200,200)

local sunRays = Instance.new("SunRaysEffect",lighting)
sunRays.Intensity = .1
sunRays.Spread = 1

local bloom = Instance.new("BloomEffect",lighting)
bloom.Intensity = .1
bloom.Size = 74.67
bloom.Threshold = .94
