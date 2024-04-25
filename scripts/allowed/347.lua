local tick=tick

local hue_change_speed = 8/360
local period = 3.5 -- time it takes between each blink sequence
local blink_length = 0.2 -- when it blinks, how long should it blink for?
local blink_count = 3 -- how many times to blink?

--internal variables
local blink_half=blink_length/2
local blink_phase=blink_count*blink_length

local Blinker = script.Parent
local h,s,v = Blinker.TextColor3:ToHSV()

game:GetService'RunService'.Heartbeat:Connect(function()
	local t=tick()

	Blinker.TextColor3=Color3.fromHSV(t*hue_change_speed%1,s,v)

	local t_blink=t%period
	if t_blink<blink_phase then
		Blinker.Visible=t_blink%blink_length<blink_half
	else
		Blinker.Visible=true
	end
end)
