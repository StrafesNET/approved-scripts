local tick=tick

local Part=script.Parent

local change=6
local wavetime=10

local mesh=Part.Mesh

game:GetService'RunService'.Stepped:Connect(function()
	local t=tick()
	local extra=Vector3.new(0,((math.cos((t*math.pi)/wavetime)*.5)+.5)*change,0)
	mesh.Scale=Vector3.new(1,1,1)+extra
	mesh.Offset=Part.Size*extra*-.5
end)
