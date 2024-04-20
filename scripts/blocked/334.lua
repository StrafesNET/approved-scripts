local lighting = game:GetService("Lighting")
local mapName = script.MapName.Value
local mapModel = workspace:WaitForChild(mapName)

lighting.GlobalShadows = false
lighting.Brightness = 3
lighting.TimeOfDay = 14

script.Sky.Parent = lighting

workspace.ChildRemoved:Connect(function(instance)
	if instance == mapModel then
		--print("Map deleted, destroying ServerScript")
		script:Destroy()
	end
end)