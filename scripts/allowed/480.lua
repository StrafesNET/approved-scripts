local tick=tick
local modf=math.modf

local BrickColors = {"Really red","Deep orange","New Yeller","Lime green","Really blue","Hot pink","Royal purple"}
local Colors = {}
for i,ColorName in BrickColors do
	Colors[i] = BrickColor.new(ColorName).Color
end

local NumColors=#Colors

local t0=tick()

local TransitionTime=1
local Period=3.7

local TextLabel=script.Parent

game:GetService'RunService'.Stepped:Connect(function()
	local i,t=modf((tick()-t0)/Period)

	if t*Period<TransitionTime then
		--transitioning colors
		local C0=Colors[(i-1)%NumColors+1]
		local C1=Colors[i%NumColors+1]
		TextLabel.TextColor3=C0:lerp(C1,t*Period/TransitionTime)
	else
		--transition complete
		TextLabel.TextColor3=Colors[i%NumColors+1]
	end
end)
