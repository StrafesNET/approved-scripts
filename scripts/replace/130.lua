spinning = script.Parent

while true do
spinning.CFrame = spinning.CFrame * CFrame.fromEulerAnglesXYZ(0, math.rad(0), 0.010)
wait(0.0001)
end
