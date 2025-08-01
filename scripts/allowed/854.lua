local TweenService = game:GetService'TweenService'

local folder = script.Parent

local textures = {}
-- Apply tweens to all textures in the LavaValues folder
for _, child in folder:GetChildren() do
	local texture = child:FindFirstChild("Texture")
	if texture then
		table.insert(textures,texture)
	end
end


while true do
	-- Generate random values for tween settings
	local duration = math.random(10, 20)
	local offsetx = math.random(-80, 80) / 10
	local offsety = math.random(-80, 80) / 10

	local tween_info = TweenInfo.new(duration, Enum.EasingStyle.Quad, Enum.EasingDirection.InOut)

	local target = {OffsetStudsU = offsetx, OffsetStudsV = offsety}

	for _, texture in textures do
		TweenService:Create(texture, tween_info, target):Play()
	end

	task.wait(duration)
end
