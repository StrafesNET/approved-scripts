
local playlist = {
	"rbxassetid://209586150",
	"rbxassetid://344201558",
	"rbxassetid://280121606",
	"rbxassetid://254655318",
	"rbxassetid://165598504",
	"rbxassetid://758340079",
	"rbxassetid://147571636",
	"rbxassetid://666420477",
	"rbxassetid://758412107"
}

local sound=Instance.new("Sound",script.Parent)

local current_sound=0
while true do
	current_sound=current_sound%#playlist+1
	sound.SoundId=playlist[current_sound]
	sound:Play()
	sound.Ended:Wait()
	task.wait()
end
