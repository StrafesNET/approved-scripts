--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--rot=CFrame.fromEulerAnglesXYZ(-0.01,0.01,0.01):ToAxisAngle()

local tick=tick
local tau=math.pi*2
local RotAxis=Vector3.new(-0.5754162073135376,0.5811992883682251,0.5754162073135376)
local RotSpeed=0.01729116402566433*30
local Part=script.Parent
local BaseCFrame=Part.CFrame
game:GetService'RunService'.Stepped:connect(function()
	Part.CFrame=BaseCFrame*CFrame.fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
end)
