local lighting = game:GetService("Lighting")
local dragDetector = script.Parent
local button = script.Parent.Parent
local lChanger = script.Parent.Parent.Parent.Parent.Parent
local timeColors = {
	{time = 0, color = Color3.fromRGB(10, 10, 30)},   -- Midnight
	{time = 6, color = Color3.fromRGB(255, 160, 80)}, -- Sunrise
	{time = 12, color = Color3.fromRGB(255, 255, 160)}, -- Noon
	{time = 18, color = Color3.fromRGB(255, 120, 60)}, -- Sunset
	{time = 24, color = Color3.fromRGB(10, 10, 30)},  -- Midnight again
}

local function getColorFromTime(clockTime)
	local t0 = timeColors[1]
	for i = 2, #timeColors do
		local t1 = timeColors[i]
		if clockTime <= t1.time then
			local alpha = (clockTime - t0.time) / (t1.time - t0.time)
			return t0.color:Lerp(t1.color, alpha)
		end
		t0 = t1
	end
	return timeColors[1].color -- fallback
end

dragDetector.DragContinue:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(118, 118, 118)
	local pos = button.Position.X.Scale
	lighting.ClockTime = (13.25 + pos * 24) % 24
	lChanger.Color = getColorFromTime(lighting.ClockTime)
end)

dragDetector.DragEnd:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(255,255,255)
end)
