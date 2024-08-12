while wait() do
	script.Parent.Position = script.Parent.Position + Vector3.new(0,math.sin(tick()*5-750)*0.25,0)
end