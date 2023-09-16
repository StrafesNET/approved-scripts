--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrameToAxisAngle(CFrame.fromEulerAnglesXYZ(math.rad(.04),math.rad(.03),math.rad(.09)))

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(0.3770687702987293,0.31024175793528863,0.8726793191651937)
local RotSpeed=0.10242164091355949*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Stepped:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
