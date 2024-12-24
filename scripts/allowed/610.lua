local TweenService = game:GetService'TweenService'

local LavaTextures = {}
for i,part in script.Parent.Lava:GetChildren() do
	LavaTextures[i] = part.Texture
end

while true do
	local duration = math.random(10,30)
	local offsetx = math.random(-80,80)/10
	local offsety = math.random(-80,80)/10

	local tween_info = TweenInfo.new(duration,Enum.EasingStyle.Quad,Enum.EasingDirection.InOut)
	local target = {OffsetStudsU = offsetx,OffsetStudsV = offsety}

	for _,Texture in LavaTextures do
		TweenService:Create(Texture,tween_info,target):Play()
	end

	task.wait(duration-.1)
end
