wait(5)
script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0,0,-0.25)
while true do
script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0,0,0.25)
	wait(0.5)
	script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0,0,0.25)
	wait(0.5)
	script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0,0,-0.25)
	wait(0.5)
	script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0,0,-0.25)
	wait(0.5)
end
