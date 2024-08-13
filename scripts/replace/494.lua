local rate = 0.0001 -- How fast the colors will fade


while true do
if script.R.Value == 255 and script.G.Value == 0 and script.B.Value == 0 then
	repeat
wait(rate)
script.B.Value = script.B.Value +1
	until
	script.B.Value == 255
	if script.R.Value == 255 and script.B.Value == 255 then
		repeat
		wait(rate)
		script.R.Value = script.R.Value -1	
		until
		script.R.Value == 0
		if script.R.Value == 0 and script.B.Value == 255 then
	repeat
		wait(rate)
		script.G.Value = script.G.Value +1
	until
	script.G.Value == 255
	if script.G.Value == 255 and script.B.Value == 255 then
		repeat
			wait(rate)
		script.B.Value = script.B.Value -1
		until
		script.B.Value == 0
		if script.B.Value == 0 and script.G.Value == 255 then
			repeat
			wait(rate)
		script.R.Value = script.R.Value +1
		until
		script.R.Value == 255
		if script.R.Value == 255 and script.G.Value == 255 then
			repeat
				wait(rate)
				script.G.Value = script.G.Value -1
			until
		script.G.Value == 0
		end
		end
		end
		end
		
	end
	end
end


while true do
wait(0.0001) 
script.Parent.Color3 = Color3.new(script.R.Value/255,script.G.Value/255,script.B.Value/255)
end