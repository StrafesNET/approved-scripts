blades = script.Parent.fanblades:GetChildren()
while wait(.02) do
	for i=1,8 do
		x = blades[i].Orientation.X
		y = blades[i].Orientation.Y
		z = blades[i].Orientation.Z
		blades[i].Orientation = Vector3.new(x,y-10.3,z)
	end
end