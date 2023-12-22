local sound = script.Parent
sound.Looped = false
sound.Playing = false

local soundIdList = {"rbxassetid://1841979451","rbxassetid://9046476113","rbxassetid://9045766377","rbxassetid://1845341094","rbxassetid://9046435309","rbxassetid://1841984324"}
local i = 2

sound:Play()

while true do

	if sound.IsPlaying == true then
		wait()
		
	else
		i = i + 1

		if i > #(soundIdList) then
			i = 1

		end
		
		sound.SoundId = soundIdList[i]
		sound:Play()
		sound.TimePosition = 0
		wait(2)
		
	end
end

local died = 0