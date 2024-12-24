--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(0.03,0.01,0.05))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(0.5101321935653687,0.1559767723083496,0.8458347916603088)
local RotSpeed=0.05928561618223932*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Heartbeat:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
