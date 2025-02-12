local tick=tick
local abs=math.abs
local Base=255
local Diff=255-100
local HalfTime=Diff/30
local SelectionBox=script.Parent.SelectionBox
local t0=tick()
game:GetService'RunService'.Heartbeat:Connect(function()
	local z=Base-Diff*abs(1-(tick()-t0)/HalfTime%2)
	SelectionBox.Color3=Color3.fromRGB(z,z,z)
end)
