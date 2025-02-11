print("Starting animations in " .. script.Parent.Name)

local CRAWL_RATE = 5
local region = script.Parent

local startTime = tick()
local tileSize = 230 -- equal to image.TileSize.X.Offset
local crawlInterval = tileSize/(CRAWL_RATE*60)
local pulseSpeed = 2
local minIntensity = 0
local maxIntensity = 1

local displays = {}
local lava = {}
local tests = {}

for i,v in pairs(script.Parent:GetDescendants()) do
	if v:IsA("BasePart") and v.Name:find("^Display") then
		v.UI.Brightness = 0.25
		table.insert(displays, v)
	elseif v:IsA("BasePart") and v:FindFirstChild("Flow") then
		table.insert(lava,v)
	elseif v:IsA("BasePart") and v.Name == "Test" then
		table.insert(tests,v)
	end
end


game:GetService'RunService'.RenderStepped:Connect(function()
	local timeElapsed = tick() - startTime
	
	--animate displays
	for i,display in pairs(displays) do
		--animate position
		local ui = display.UI
		local image = ui.ImageMask.Image
		local cycleTimeElapsed = timeElapsed % crawlInterval
		image.Position = UDim2.new(image.Position.X.Scale, -((cycleTimeElapsed*tileSize)/crawlInterval), image.Position.Y.Scale, image.Position.Y.Offset)
		
		--animate light

		local cycleTimeElapsed = timeElapsed % pulseSpeed
		local easedTime = math.abs(math.sin(math.pi * cycleTimeElapsed / pulseSpeed))

		local intensity = minIntensity + (maxIntensity - minIntensity) * easedTime

		ui.LightInfluence = intensity
	end
	
	--animate lava
	for i, lava in pairs(lava) do
		local lavaCrawlInterval
		if lava:FindFirstChild("Flow") then
			lavaCrawlInterval = lava.Flow.Value
		end
		local ui = lava.UI
		local image = ui.ImageMask.Image
		local cycleTimeElapsed = timeElapsed % crawlInterval
		image.Position = UDim2.new(image.Position.X.Scale, -((cycleTimeElapsed*tileSize)/crawlInterval), image.Position.Y.Scale, image.Position.Y.Offset)
	end
	
	-- make test panels invis when close up
	for i,v in pairs(tests) do
		local camera = workspace.CurrentCamera
		if camera then
			local cameraCFrame = camera.CFrame
			local cameraPosition = cameraCFrame.Position
			local dist = (cameraPosition - v.Position).Magnitude
			local transparency = 0
			if dist < 19 then
				transparency = 1 - ((dist-4)/15)
			end
			for _,decal in pairs(v:GetChildren()) do
				decal.Transparency = transparency
			end
		end
	end
end)
