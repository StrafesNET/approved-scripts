local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(1,0,0)
local RotSpeed=4*30*tau/360
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Heartbeat:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
