local tick=tick
local sub=string.sub
local floor=math.floor
local Model=script.Parent
local s="Magical Rotating Part!!!!"
game:GetService'RunService'.Stepped:connect(function()
	Model.Name=sub(s,1,floor(tick()*10)%#s+1)
end)