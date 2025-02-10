local tick=tick
local sin=math.sin

local Amplitude=Vector3.new(703/200,0,23/10)/2
local Period=46/30
local tau=2*math.pi

local Part=script.Parent
local BaseCFrame=Part.CFrame+Amplitude

local t0=tick()
game:GetService'RunService'.Heartbeat:Connect(function()
	local t=tick()-t0
	Part.CFrame=BaseCFrame+Amplitude*sin(t*tau/Period%tau)
end)
