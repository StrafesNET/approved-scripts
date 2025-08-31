Speed = 1
while wait() do 
for i = 0, 360, Speed do 
script.Parent.CFrame = CFrame.new(script.Parent.Position)*CFrame.fromEulerAnglesXYZ(math.rad(i), math.rad(i), math.rad(i))
wait(.001)
end
end 