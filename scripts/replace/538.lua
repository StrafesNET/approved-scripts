local sp=script.Parent


change=6
wavetime=10

local mesh=sp:WaitForChild('Mesh')


while true do
	local t1,t2=wait()
	local extra=Vector3.new(0,((math.cos((t2*math.pi)/wavetime)*.5)+.5)*change,0)
	mesh.Scale=Vector3.new(1,1,1)+extra
	mesh.Offset=sp.Size*extra*-.5
end

