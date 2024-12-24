while task.wait() do
	local tween = game.TweenService:Create(script.Parent.Texture, TweenInfo.new(4, Enum.EasingStyle.Linear, Enum.EasingDirection.In), {OffsetStudsV = 12})
	tween:Play()
	tween.Completed:Wait()
	script.Parent.Texture.OffsetStudsV = 0
end