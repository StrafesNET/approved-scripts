local textureIds = {
	"rbxassetid://357078195",
	"rbxassetid://357078221",
	"rbxassetid://357078254",
	"rbxassetid://357078304",
	"rbxassetid://357078342",
	"rbxassetid://357078362",
	"rbxassetid://357078375",
	"rbxassetid://357078384",
	"rbxassetid://357078404",
	"rbxassetid://357078431",
	"rbxassetid://357078444",
	"rbxassetid://357078456",
	"rbxassetid://357078466",
	"rbxassetid://357078481",
	"rbxassetid://357078500",
	"rbxassetid://357078528",
	"rbxassetid://357078550",
	"rbxassetid://357078569",
	"rbxassetid://357078583",
	"rbxassetid://357078620",
	"rbxassetid://357078677",
	"rbxassetid://357078696",
	"rbxassetid://357078712",
	"rbxassetid://357078726",
	"rbxassetid://357078742"
}

local tick=tick
local wait=task.wait

local textures = {}
local function AddTexture(part)
	if part:IsA("Texture") then
		table.insert(textures, part)
	end
end
for _, part in script.Parent:GetDescendants() do
	AddTexture(part)
end
script.Parent.DescendantAdded:Connect(AddTexture)

local MaximumSteps=#textureIds
local StepTime=1/30

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	local WrappedStep=Step%MaximumSteps+1
	for _,texture in textures do
		texture.Texture=textureIds[WrappedStep]
	end

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1

	local wait_time=Step*StepTime-t
	if 0<wait_time then
		wait(wait_time)
	end
end
