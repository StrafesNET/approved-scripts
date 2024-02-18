local tick=tick
local decalLoc=script.Parent
local last_decal=1--whatever
local period=0.1
local decal_list={
	decalLoc.one,
	decalLoc.two,
	decalLoc.three,
	decalLoc.four,
	decalLoc.five,
	decalLoc.six,
	decalLoc.seven,
	decalLoc.eight,
	decalLoc.nine,
	decalLoc.ten
}
local decal_list_len=#decal_list
game:GetService'RunService'.Stepped:connect(function()
	local current=math.floor(tick()/period%decal_list_len+1)
	if current~=last_decal then
		decal_list[current].Transparency=0
		decal_list[last_decal].Transparency=1
		last_decal=current
	end
end)