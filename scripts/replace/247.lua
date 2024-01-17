local tweenTime = 0.5

local part1Off =  game:GetService("TweenService"):Create(script.Parent.Parent.Parent:WaitForChild("Light1").Part, TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Color = Color3.fromRGB(0,0,0)})
local part1On =  game:GetService("TweenService"):Create(script.Parent.Parent.Parent:WaitForChild("Light1").Part, TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(88, 34, 133)})

local part2Off =  game:GetService("TweenService"):Create(script.Parent.Parent.Parent:WaitForChild("Light2").Part, TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Color = Color3.fromRGB(0,0,0)})
local part2On =  game:GetService("TweenService"):Create(script.Parent.Parent.Parent:WaitForChild("Light2").Part, TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(123, 0, 123)})

local part3Off =  game:GetService("TweenService"):Create(script.Parent.Parent.Parent:WaitForChild("Light3").Part, TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.In), {Color = Color3.fromRGB(0,0,0)})
local part3On =  game:GetService("TweenService"):Create(script.Parent.Parent.Parent:WaitForChild("Light3").Part, TweenInfo.new(tweenTime, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Color = Color3.fromRGB(51, 88, 130)})

wait(10)
while true do
	part1Off:Play()
	wait(tweenTime/2)
	
	part2Off:Play()
	wait(tweenTime/2)
	
	part3Off:Play()
	wait(tweenTime/2)
	
	part1On:Play()
	wait(tweenTime/2)
	
	part2On:Play()
	wait(tweenTime/2)
	
	part3On:Play()
	wait(tweenTime/2)
	
end	