--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(0.0,-0.06,0.03))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(-0.01341680996119976,-0.8943869471549988,0.44709283113479614)
local RotSpeed=0.06708002331676764*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Stepped:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
