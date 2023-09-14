--These are the seperate variables for RGB colors. It will set the light to 255,0,0, or Red.
local r = 255
local g = 0
local b = 0

--This is the amount of time between the color changing.
local WaitAmount = 0.01

local function changecolor()
	repeat
		script.Parent.Color = Color3.fromRGB(r,g,b)
		wait(WaitAmount)
		g = g + 1
	until g > 254
	wait(WaitAmount)

	repeat
		script.Parent.Color = Color3.fromRGB(r,g,b)
		wait(WaitAmount)
		r = r - 1
	until r < 1
	wait(WaitAmount)

	repeat
		script.Parent.Color = Color3.fromRGB(r,g,b)
		wait(WaitAmount)
		b = b + 1
	until b > 254
	wait(WaitAmount)

	repeat
		script.Parent.Color = Color3.fromRGB(r,g,b)
		wait(WaitAmount)
		g = g - 1
	until g < 1
	wait(WaitAmount)

	repeat
		script.Parent.Color = Color3.fromRGB(r,g,b)
		wait(WaitAmount)
		r = r + 1
	until r > 254
	wait(WaitAmount)

	repeat
		script.Parent.Color = Color3.fromRGB(r,g,b)
		wait(WaitAmount)
		b = b - 1
	until b < 1
	wait(WaitAmount)
end
while true do
	changecolor()
end