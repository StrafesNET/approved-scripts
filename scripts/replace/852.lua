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
	for i = 1, #timeColors - 1 do
		local t1 = timeColors[i]
		local t2 = timeColors[i + 1]

		if clockTime >= t1.time and clockTime <= t2.time then
			local alpha = (clockTime - t1.time) / (t2.time - t1.time)
			return t1.color:Lerp(t2.color, alpha)
		end
	end
	return timeColors[1].color -- fallback
end

local function wrapLerp(startTime, endTime, alpha)
	local fullStart = startTime
	local fullEnd = endTime

	if fullEnd <= fullStart then
		fullEnd = fullEnd + 24
	end

	local lerped = fullStart + (fullEnd - fullStart) * alpha
	return lerped % 24
end



dragDetector.DragContinue:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(118, 118, 118)
	local pos = button.Position.X.Scale
	lighting.ClockTime = wrapLerp(13.25, 13.25, pos)
	lChanger.Color = getColorFromTime(lighting.ClockTime)
end)



dragDetector.DragEnd:Connect(function()
	button.BackgroundColor3 = Color3.fromRGB(255,255,255)
end)