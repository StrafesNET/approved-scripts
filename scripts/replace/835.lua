local TweenService = game:GetService("TweenService");

local part = script.Parent
part.Position = part.Position - Vector3.new(0, .15, 0);

local goalUp = part.Position + Vector3.new(0, .3, 0);
local goalDown = part.Position - Vector3.new(0, .15, 0);
local tweenInfo = TweenInfo.new(2, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, -1, true);


local tweenUp = TweenService:Create(part, tweenInfo, {Position = goalUp});
local tweenDown = TweenService:Create(part, tweenInfo, {Position = goalDown});

while true do
	tweenUp:Play();
	tweenUp.Completed:Wait();
	tweenDown:Play();
	tweenDown.Completed:Wait();
end
