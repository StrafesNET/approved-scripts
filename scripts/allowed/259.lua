--The original script is a nightmare, I'm just going to lerp
--I aint writing a gamma function just for some misinterpretation of interpolation math
local tick=tick

local Period=1/.009/30

local Colors={"Really red","Deep orange","New Yeller","Lime green","Really blue","Hot pink","Royal purple"}
local NColors=#Colors
--convert to color3
for i=1,#Colors do
	Colors[i]=BrickColor.new(Colors[i]).Color
end

local parent=script.Parent

game:GetService'RunService'.Heartbeat:connect(function()
	local n,t=math.modf(tick()/Period%NColors)
	local c0=Colors[n%NColors+1]
	local c1=Colors[(n+1)%NColors+1]
	parent.Color3=c0:lerp(c1,t)
end)