--AdmiralLennox
Chest = script.Parent
Lid = Chest.Lid
Lid.PrimaryPart = Lid.Hinge

increment = -96


function rotate(model, amount)
		for i=1, math.abs(amount/2) do
			model:SetPrimaryPartCFrame(model.Hinge.CFrame * CFrame.fromEulerAnglesXYZ(0,math.pi/amount,0))
			wait()
		end	
end
while true do
	wait(.1)
		debounce = true
		if Chest.Open.Value then
			rotate(Lid, increment)
		wait(10)
			rotate(Lid, -increment)
		end
		Chest.Open.Value = not Chest.Open.Value
		debounce = false
		wait(45)
	
end