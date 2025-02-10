--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(-0.025,0.025,0.025))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(-0.5724785327911377,0.5869723558425903,0.5724785327911377)
local RotSpeed=0.04311933902190104*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Heartbeat:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
