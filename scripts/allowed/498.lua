--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(-0.02,0.02,-0.02))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(-0.5811609625816345,0.5696524381637573,-0.5811609625816345)
local RotSpeed=0.034755715039907674*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Stepped:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
