repeat
	wait(0.1)
	for i=0, 100 do
		script.Parent.Mesh.Scale=script.Parent.Mesh.Scale+Vector3.new(0, 0.036, 0)
		wait()
	end
	wait()
	for i=0, 100 do
		script.Parent.Mesh.Scale=script.Parent.Mesh.Scale-Vector3.new(0, 0.036, 0)
		wait()
	end 
until false 