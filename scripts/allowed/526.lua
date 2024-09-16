--this script emulates the indescribably horrible behavour of compounding small angle rotation matrices constructed with euler angles applying in a frame dependent manner, except with an analytic equation frame-rate independently.
--blades[i].Orientation -= Vector3.new(0,-10.3,0)

local Blades=script.Parent.fanblades:GetChildren()

local BaseCFrames={}
for _,Part in Blades do
	BaseCFrames[Part]=Part.CFrame
end

local tick=tick
local fromAxisAngle=CFrame.fromAxisAngle
local tau=math.pi*2
local RotAxis=Vector3.new(0,1,0)
local RotSpeed=-10.3*tau/180*30

game:GetService'RunService'.Stepped:Connect(function()
	for Part,BaseCFrame in BaseCFrames do
		Part.CFrame=BaseCFrame*fromAxisAngle(RotAxis,RotSpeed*tick()%tau)
	end
end)
