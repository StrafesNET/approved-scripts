local wait = task.wait

local light = script.Parent.LightBulb.SpotLight

while true do
	light.Enabled = false
	wait(math.random()*0.5)
	light.Enabled = true
	wait(math.random())
end
