--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(math.rad(0.5),math.rad(0.5),math.rad(0.5)))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(0.5756634831618359,0.5807091426075236,0.5756634831618359)
local RotSpeed=0.015092946791770121*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Stepped:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
