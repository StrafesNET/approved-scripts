local texture_ids={357078195,357078221,357078254,357078304,357078342,357078362,357078375,357078384,357078404,357078431,357078444,357078456,357078466,357078481,357078500,357078528,357078550,357078569,357078583,357078620,357078677,357078696,357078712,357078726,357078742}
local num=#texture_ids
local fps=30
local tick=tick
local floor=math.floor
local decal=script.Parent.Texture
game:GetService'RunService'.Stepped:connect(function()
	decal.Texture=`rbxassetid://{texture_ids[floor(tick()*fps)%num+1]}`
end)
