local collectionService = game:GetService("CollectionService")

local cartoonTextures = collectionService:GetTagged("WaterTexture")

local TweenService = game:GetService("TweenService")
local info = TweenInfo.new(15, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, false)

local function waterSway(texture : Texture, offsetU, offsetV)
	local initialOffsetU = texture.OffsetStudsU
	local initialOffsetV = texture.OffsetStudsV
	local totalOffsetV = -initialOffsetV + offsetV
	local totalOffsetU = initialOffsetU + offsetU

	local target = {OffsetStudsV = -totalOffsetV, OffsetStudsU = totalOffsetU}
	while true do
		local swayTween = TweenService:Create(texture, info, target)
		swayTween:Play()
		swayTween.Completed:Wait()
	end
end

for _, texture in cartoonTextures do
	task.spawn(waterSway, texture, texture.StudsPerTileU, texture.StudsPerTileV * 2)
end

collectionService:GetInstanceAddedSignal("WaterTexture"):Connect(function(texture : Texture)
	task.spawn(waterSway, texture, texture.StudsPerTileU, texture.StudsPerTileV * 2)
end)
