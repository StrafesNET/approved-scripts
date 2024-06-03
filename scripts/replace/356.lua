pos = script.Parent.Position
pos = Vector3.new(pos.x, pos.y-0.2, pos.z)
x = 0
z = 0
T = -99999
tall = script.Parent.Size.Y / 2
math.randomseed(tick())
rand = (math.random(0,20))/10
while true do
x = pos.x + (math.sin(T + (pos.x/5)) * math.sin(T/9))/10
z = pos.z + (math.sin(T + (pos.z/6)) * math.sin(T/12))/12
script.Parent.CFrame =
	CFrame.new(x, pos.y, z) * CFrame.Angles((z-pos.z)/tall, 0,(x-pos.x)/-tall)
	wait()
	T = T + 0.12
end

