local stop = false
while true do
	wait(0.25)
if script.Parent.Parent.Parent.Spin.Value == true then
	repeat
script.Parent.CFrame = script.Parent.CFrame * CFrame.fromEulerAnglesXYZ(0,2,0)
wait()
	until script.Parent.Parent.Parent.Spin.Value == false
end
end