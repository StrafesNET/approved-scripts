local Part = script.Parent
local abs=math.abs
local cf=CFrame.new
local Pos0=Part.pos0.Position
local Pos1=Part.pos1.Position
local Diff=Pos1-Pos0
local Frequency=0.25
while true do
    Part.CFrame=cf(Pos0+Diff*(1-abs(1-tick()*Frequency%1*2)))
    wait()
end