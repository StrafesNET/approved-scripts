local top = 255
while true do
wait()
for i = 1,top,1 do
script.Parent.TextColor3 = Color3.new(i/top,0/top,0/top)
wait()
end
for i = 1,top,1 do
script.Parent.TextColor3 = Color3.new(top/top,i/top,0/top)
wait()
end
for i = 1,top,1 do
script.Parent.TextColor3 = Color3.new(top/top,top/top,i/top)
wait()
end
for i = top,1,-1 do
script.Parent.TextColor3 = Color3.new(i/top,top/top,top/top)
wait()
end
for i = top,1,-1 do
script.Parent.TextColor3 = Color3.new(0/top,i/top,top/top)
wait()
end
for i = top,1,-1 do
script.Parent.TextColor3 = Color3.new(0/top,0/top,i/top)
wait()
end
end