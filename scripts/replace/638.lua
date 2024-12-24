local light = script.Parent.PointLight

while true do
	wait (2) ------- Change this to how long you want the player to wait for the light to start flickering
	light.Enabled = true
	wait (2) ------- Change this to how long you want the player to wait for the light to STOP flickering
	light.Enabled = false
	
	
