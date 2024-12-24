--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(0.005,0.005,0.005))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(0.5783101320266724,0.5754258036613464,0.5783101320266724)
local RotSpeed=0.008667459047526334*60
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Heartbeat:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
