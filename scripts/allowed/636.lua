local weenService = game:GetService("TweenService")

local TextureSpeed = 20

local tweenInfo = TweenInfo.new(
	TextureSpeed,
	Enum.EasingStyle.Linear,
	Enum.EasingDirection.Out,
	-1,
	false,
	0
)

local targetU = {OffsetStudsU = 100}
local targetV = {OffsetStudsV = 100}

for _, texture in script.Parent:GetChildren() do
	if texture:IsA("Texture") then
		weenService:Create(texture, tweenInfo, targetU):Play()
		weenService:Create(texture, tweenInfo, targetV):Play()
	end
end
