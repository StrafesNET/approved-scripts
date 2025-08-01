local tau = math.pi * 2

local function rotate(model : Model)
	local speed = model:GetAttribute("RotateSpeed")
	local basePivot = model:GetPivot()
	
	local rotationAxis = Vector3.new(0,1,0)
	if model.Name == "Gear" then
		rotationAxis = Vector3.new(1,0,0)
		game:GetService("RunService").Heartbeat:Connect(function()
			model:PivotTo(basePivot * CFrame.fromAxisAngle(rotationAxis, speed / 2 * tick() % tau))
		end)
		
	elseif model.Parent.Name == "SYSTEM" then
		local planetMesh = model:FindFirstChildWhichIsA("MeshPart")
		if planetMesh then
			repeat planetMesh = model:FindFirstChildWhichIsA("MeshPart") until planetMesh
		end
		
		local planetRotation = planetMesh.CFrame.Rotation
		
		game:GetService("RunService").Heartbeat:Connect(function()
			model:PivotTo(basePivot * CFrame.fromAxisAngle(rotationAxis, speed / 2 * tick() % tau))
			planetMesh.CFrame = CFrame.new(planetMesh.CFrame.Position) * CFrame.fromAxisAngle(Vector3.new(0,1,0), 10 * speed * tick() % tau)
		end)
	end
end


local collectionService = game:GetService("CollectionService")
local rotateModels = collectionService:GetTagged("RotateModel")

for _,model in rotateModels do
	rotate(model)
end

collectionService:GetInstanceAddedSignal("RotateModel"):Connect(function(model)
	rotate(model)
end)