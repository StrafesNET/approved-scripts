local part = script.Parent

while task.wait() do

	part.CFrame = part.CFrame * CFrame.Angles(0.005,0,0)

end