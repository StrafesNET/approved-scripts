local Door = game.Workspace.secretDoor
local Door2 = game.Workspace.minimis
local Click = script.Parent.ClickDetector
local opened = true

function doorOpening()
	opened=not opened
	if opened then
		Door.CanCollide = false
		Door.Transparency = 1
		Door2.Transparency = 1
		Door2.CanCollide = false
	else
		Door.CanCollide = true
		Door.Transparency = 0
		Door2.Transparency = 0
		Door2.CanCollide = true
	end
end

Click.MouseClick:connect(doorOpening)