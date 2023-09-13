local part = script.Parent
local tau=2*math.pi
local Angles=CFrame.Angles
local Frequency=0.25
local Pos = part.Parent.pos1.Position
local Offset=CFrame.new(0,0,6)
while wait() do
    part.CFrame=Angles(0,tick()*Frequency*tau%tau,0)*Offset+Pos
end