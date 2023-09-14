--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(math.rad(1),math.rad(1),math.rad(1)))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(0.5739619558889911,0.5840679295973781,0.5739619558889911)
local RotSpeed=0.0301415408524189*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Stepped:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
