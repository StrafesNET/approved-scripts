local tick=tick
local speed=1
local selbo=script.Parent.SelectionBox
game:GetService'RunService'.Stepped:connect(function()
	local t=speed*tick()%2
	if t<1 then
		selbo.Transparency=t
	else
		selbo.Transparency=2-t
	end
end)
