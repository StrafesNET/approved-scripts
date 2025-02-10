wait(.04)

local sunRays = Instance.new("SunRaysEffect",game.Lighting)

sunRays.Intensity = .1
sunRays.Spread = 1

local bloom = Instance.new("BloomEffect",game.Lighting)
bloom.Intensity = .1
bloom.Size = 74.67
bloom.Threshold = .94

game.Lighting.Ambient = Color3.fromRGB(200,200,200)