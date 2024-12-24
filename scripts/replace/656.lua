wait(10)
----------------------------------------------------------------

oh,om = 6,00	-- Opening time (hours,minutes)
ch,cm = 18,00	-- Closing time (hours,minutes)
lightblockname = "LightBulb"
modelname = "StreetLight"
waittime = 1

----------------------------------------------------------------



local light = script.Parent.LightBulb.SpotLight

while true do
	light.Enabled = false
	wait(math.random(0.1,0.5))
	light.Enabled = true
	wait(math.random(0.1,1))
end
			
			

					