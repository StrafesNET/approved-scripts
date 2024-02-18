Door = game.Workspace.secretDoor
Door2 = game.Workspace.minimis
Click = script.Parent.ClickDetector
opened = 0

function doorOpening()
	if opened == 0 then
		Door.CanCollide = false
		Door.Transparency = 1
		Door2.Transparency = 1
		Door2.CanCollide = false
		opened = 1
	else
		Door.CanCollide = true
		Door.Transparency = 0
		Door2.Transparency = 0
		Door2.CanCollide = true
		opened = 0
	end
end

Click.MouseClick:connect(doorOpening)