local tick=tick

local parent=script.Parent

local PShort=parent.PShort
local PShort2=parent.PShort2
local PShort3=parent.PShort3
local PLong=parent.PLong
local PLong2=parent.PLong2
local PLong3=parent.PLong3
local LShort=parent.LShort
local LLong=parent.LLong
local Smoke=parent.Smoke
local Smoke2=parent.Smoke2

local ls = LShort.Brightness
local ll = LLong.Brightness

local on_period=1/10
local dim_period=10/30
local tick_period=on_period+dim_period
local tick_rate=30

local last_state
local last_bright
game:GetService'RunService'.Heartbeat:connect(function()
	local t=tick()*tick_rate%tick_period
	local state
	local bright
	if t<on_period then
		state=true
		bright=1
	else
		state=true
		bright=1-(t-on_period)/dim_period
	end
	if state~=last_state then
		last_state=state
		PShort.Enabled = state
		PShort2.Enabled = state
		PShort3.Enabled = state
		PLong.Enabled = state
		PLong2.Enabled = state
		PLong3.Enabled = state
		Smoke.Enabled = state
		Smoke2.Enabled = state
	end
	if bright~=last_bright then
		last_bright=bright
		LShort.Brightness = 10*bright
		LLong.Brightness = bright
	end
end