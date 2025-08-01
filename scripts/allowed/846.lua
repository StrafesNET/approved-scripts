local tau = math.pi * 2

local function rotate(model : Model)
	local speed = model:GetAttribute("RotateSpeed")
	local basePivot = model:GetPivot()

	if model.Name == "Gear" then
		local rotationAxis = Vector3.new(1,0,0)
		game:GetService("RunService").Heartbeat:Connect(function()
			model:PivotTo(basePivot * CFrame.fromAxisAngle(rotationAxis, speed / 2 * tick() % tau))
		end)

	elseif model.Parent.Name == "SYSTEM" then
		local planetMesh = model:FindFirstChildWhichIsA("MeshPart")
		if not planetMesh then
			repeat
				task.wait()
				planetMesh = model:FindFirstChildWhichIsA("MeshPart")
			until planetMesh
		end

		local rotationAxis = Vector3.new(0,1,0)
		local planetRotationAxis = Vector3.new(0,1,0)
		local planetPosition = planetMesh.Position

		game:GetService("RunService").Heartbeat:Connect(function()
			model:PivotTo(basePivot * CFrame.fromAxisAngle(rotationAxis, speed / 2 * tick() % tau))
			planetMesh.CFrame = CFrame.fromAxisAngle(planetRotationAxis, 10 * speed * tick() % tau) + planetPosition
		end)
	end
end


local collectionService = game:GetService("CollectionService")
local rotateModels = collectionService:GetTagged("RotateModel")

for _,model in rotateModels do
	task.spawn(rotate, model)
end

collectionService:GetInstanceAddedSignal("RotateModel"):Connect(rotate)
