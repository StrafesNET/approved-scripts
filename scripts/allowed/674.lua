local char = script.Parent
local animController = char:FindFirstChildOfClass("Humanoid") or char:FindFirstChildOfClass("AnimationController")
local animation = Instance.new("Animation")
animation.AnimationId = "rbxassetid://6409223729"
local animTrack = animController:LoadAnimation(animation)
animTrack:Play(0,1,1)
animTrack.TimePosition = 10.0
