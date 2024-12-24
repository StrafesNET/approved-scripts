local sound = script.Parent;
if sound then
	sound:Play();
end
-- thank you so much ic3 for the script, but yeah i don't have time, sorry
-- maybe some other map i can try

--[[
SOUND_UPDATE_TIME = 0.05 -- 0.1 lets not waste 2 milliseconds of processing time per frame 

local Camera = workspace.CurrentCamera
local Map = workspace:WaitForChild('bhop_iteak', 8)

if not Map then
	return warn('what happened to our map?!')
end

local GlobalSound = Map:WaitForChild('RainSoundGlobal', 3)

if not GlobalSound then
	return warn('what happened to our soundregions?!')
end

local SoundRegions = Map:WaitForChild('SoundRegions', 3)

if not SoundRegions then
	return warn('what happened to our soundregions?!')
end

local abs = math.abs

local function isPositionWithinCFrame(position, cframe, size)
	local Relative = cframe:PointToObjectSpace(position)
	local HalfSize = size / 2

	return abs(Relative.X) <= HalfSize.X and abs(Relative.Y) <= HalfSize.Y and abs(Relative.Z) <= HalfSize.Z
end

local SoundGroups = {}

for _, Child in SoundRegions:GetChildren() do
	local SoundGroup = Child:FindFirstChildOfClass('SoundGroup')
	
	if not SoundGroup then
		continue
	end
	
	if Child:IsA('Model') then
		local Parts = {}
		
		for _, Part in pairs(Child:GetChildren()) do
			if Part:IsA('BasePart') then
				table.insert(Parts, { Size = Part.Size, CFrame = Part.CFrame })
			end
		end
		
		if #Parts > 0 then
			table.insert(SoundGroups, { SoundGroup = SoundGroup, Parts = Parts })
		end
	elseif Child:IsA('BasePart') then
		table.insert(SoundGroups, { SoundGroup = SoundGroup, Parts = { { Size = Child.Size, CFrame = Child.CFrame } } })
	end
end

local SoundGroupUpdate = SOUND_UPDATE_TIME

game:GetService('RunService').Heartbeat:Connect(function(DT)
	SoundGroupUpdate -= DT
	
	if SoundGroupUpdate < 0 then
		SoundGroupUpdate = SOUND_UPDATE_TIME
		
		for _, Group in SoundGroups do
			for _, Part in Group.Parts do
				if isPositionWithinCFrame(Camera.CFrame.Position, Part.CFrame, Part.Size) then
					GlobalSound.SoundGroup = Group.SoundGroup
					break
				end
			end
		end
	end
end)
]]