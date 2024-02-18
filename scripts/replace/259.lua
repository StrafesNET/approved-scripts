local Colors = {"Really red","Deep orange","New Yeller","Lime green","Really blue","Hot pink","Royal purple"}

while wait() do
	for num,color in pairs(Colors) do
		local Color = BrickColor.new(color)
		for i = 0,1,.009 do
			wait()
			script.Parent.Color3 = script.Parent.Color3:lerp(Color.Color,i)
		end
	end
end