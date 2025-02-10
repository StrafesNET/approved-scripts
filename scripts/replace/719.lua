function move (x, y, z)
	for i=0,16 do 
		script.Parent.Position = script.Parent.Position + Vector3.new(x,y,z)	
	wait(0.01)	
	end
end

move(0,-0.5,0)
while true do
	move(0,1,0)
	move(0,-1,0)
end
