light = script.Parent.PointLight

while true do
	light.Enabled = false
	wait(0.3)
	light.Enabled =  true
	wait(0.3)
end