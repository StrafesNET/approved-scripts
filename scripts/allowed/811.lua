local Lighting = game:GetService'Lighting'

local sunRays = Instance.new("SunRaysEffect",Lighting)
sunRays.Intensity = .25
sunRays.Spread = 1

local bloom = Instance.new("BloomEffect",Lighting)
bloom.Intensity = .70
bloom.Size = 74.67
bloom.Threshold = .94
