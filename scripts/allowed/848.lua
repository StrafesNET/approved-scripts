local tweenservice = game:GetService("TweenService")
local tweendesc = TweenInfo.new(3,Enum.EasingStyle.Linear,Enum.EasingDirection.Out,0,false,0)
local partdesc = {
	Transparency = 1;
	Position = script.Parent:WaitForChild("Ring").Position + Vector3.new(0, 3, 0)
}

while wait(1) do
	task.spawn(function()
		local part = script.Parent.Ring:Clone()
		part.Parent = script.Parent
		local tween = tweenservice:Create(part,tweendesc,partdesc)
		tween:Play()
		wait(tweendesc.Time)
		part:Destroy()
	end)
end
