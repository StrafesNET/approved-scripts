local t = tick()
local h_change_speed=8
local _h = 0
local lastBlink = 0
local blinK_rate = 3.5 -- time it takes between each blink sequence
local blink_length = 0.2 -- when it blinks, how long should it blink for?
local blink_count = 3 -- how many times to blink?
function blink()
	if blink_length*blink_count > blinK_rate then
		blink_count =  blinK_rate/blink_length-blinK_rate
	end
	for i = 1,blink_count do
		script.Parent.Visible = false
		wait(blink_length/2)
		script.Parent.Visible = true
		wait(blink_length/2)
	end
	print("blinkfunc called")
end
game["Run Service"].RenderStepped:Connect(function(dt)
	local h,s,v = script.Parent.TextColor3:ToHSV()
	script.Parent.TextColor3 = Color3.fromHSV(_h/359,s,v)
	_h = t*h_change_speed % 359
	if t - lastBlink >= blinK_rate then
		print("blink")
		lastBlink = tick()
		blink()
	end
	t = tick()
end)