local tick=tick
local abs=math.abs

local SelectionBox=script.Parent.SelectionBox

local HalfPeriod=25/10/2
local TransparencyMin=0.5
local TransparencyMax=0.8
local TransparencyDelta=TransparencyMax-TransparencyMin

local t0=tick()
game:GetService("RunService").Stepped:connect(function()
	local t=(tick()-t0)/HalfPeriod%2
	SelectionBox.Transparency=TransparencyMin+TransparencyDelta*abs(1-t)
end)
