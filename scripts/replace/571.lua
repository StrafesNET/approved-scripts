local origsize = script.Parent.Size
while true do
wait(0.4)
	local size = script.Parent.Size
	script.Parent.Size = Vector3.new(size.x+1,origsize.y,size.z+1)
	script.Parent.Decal.Transparency = script.Parent.Decal.Transparency + (1/13)
	if script.Parent.Decal.Transparency > 1 then
		script.Parent.Decal.Transparency = 0
		script.Parent.Size = Vector3.new(1,1,1)
	end
end