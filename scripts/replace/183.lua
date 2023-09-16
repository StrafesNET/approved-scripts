local X = 0.5
local Y = 0.5
local Z = 0.5 
while true do 
	script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(math.rad(X),math.rad(Y),math.rad(Z)) 
	wait()
end