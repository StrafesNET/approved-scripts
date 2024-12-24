--- This will cause a brick to go in motion unanchored or not! ---

while true do
wait()
for i= 1, 10 do
script.Parent.CFrame = script.Parent.CFrame * CFrame.new(0,-0.005,0)
wait()
end
for i= 1, 10 do
script.Parent.CFrame = script.Parent.CFrame * CFrame.new(0,0.005,0)
wait()
end
end