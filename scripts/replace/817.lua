z = 99
k=nil
while wait() do
	if z > 255 then
		k = false
	end
	if z < 100 then
		k = true
	end
	script.Parent.SelectionBox.Color3 = Color3.fromRGB(z,z,z)
	if k == true then
		z = z+1
	else
		z = z-1
	end
	
end