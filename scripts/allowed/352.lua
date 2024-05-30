local frames={
	82843712,
	82843647,
	82821384,
}

local tick=tick
local floor=math.floor

local totalFrames=#frames

local fps=10

local Mesh=script.Parent

local t0=tick()+math.random()*(totalFrames/fps)
game:GetService("RunService").Stepped:connect(function()
	local t=tick()-t0
	local currentFrame=floor(t*fps%totalFrames)
	Mesh.MeshId="rbxassetid://"..frames[currentFrame+1]
end)
