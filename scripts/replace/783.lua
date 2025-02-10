for i = 1, math.huge do
	wait()
	script.Parent.StudsPerTileU = 10 + math.sin(i / 15)
	script.Parent.StudsPerTileV = 10 + math.sin(i / 15 + math.pi / 2) 
end
