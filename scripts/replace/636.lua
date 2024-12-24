local tweenService = game:GetService("TweenService")

local object = script.Parent

local TextureSpeed = 20

local tweenInfo = TweenInfo.new(
	TextureSpeed,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	-1,
	false,
	0
)

for _, texture in pairs(object:GetChildren()) do

	if texture:IsA("Texture") then

		local textureTween = tweenService:Create(texture, tweenInfo, {OffsetStudsU = 100})
		local textureTween2 = tweenService:Create(texture, tweenInfo, {OffsetStudsV = 100})

		textureTween:Play()

		textureTween2:Play()
	end

end
