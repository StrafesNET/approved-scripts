local region = script.Parent
print("Starting animations in " .. region.Name)

local CRAWL_RATE = 5

local startTime = tick()
local tileSize = 230 -- equal to image.TileSize.X.Offset
local crawlInterval = tileSize/(CRAWL_RATE*60)
local pulseSpeed = 2
local minIntensity = 0
local maxIntensity = 1

local displays = {}
local lava = {}
local tests = {}

local function AddPart(Part)
	if Part:IsA("BasePart") then
		if Part.Name:find("^Display") then
			local ui = Part.UI
			local image = ui.ImageMask.Image
			ui.Brightness = 0.25
			table.insert(displays, {
				ui=ui,
				image=image,
				x_scale=image.Position.X.Scale,
				y_scale=image.Position.Y.Scale,
				y_offset=image.Position.Y.Offset
			})
		elseif Part:FindFirstChild("Flow") then
			local image = Part.UI.ImageMask.Image
			table.insert(lava, {
				image=image,
				x_scale=image.Position.X.Scale,
				y_scale=image.Position.Y.Scale,
				y_offset=image.Position.Y.Offset
			})
		elseif Part.Name == "Test" then
			table.insert(tests,Part)
		end
	end
end

for _,Part in region:GetDescendants() do
	AddPart(Part)
end
region.DescendantAdded:Connect(AddPart)

local camera = workspace.CurrentCamera

game:GetService'RunService'.RenderStepped:Connect(function()
	local timeElapsed = tick() - startTime

	--animate displays
	for _,display in displays do
		--animate position
		local x_offset = -(timeElapsed/crawlInterval%1*tileSize)
		display.image.Position = UDim2.new(display.x_scale, x_offset, display.y_scale, display.y_offset)

		--animate light
		-- don't need math.abs because this never reaches the negative portion of sin
		local easedTime = math.sin(timeElapsed / pulseSpeed % 1 * math.pi)
		local intensity = minIntensity + (maxIntensity - minIntensity) * easedTime
		display.ui.LightInfluence = intensity
	end

	--animate lava
	for _, lava in lava do
		local x_offset = -(timeElapsed/crawlInterval%1*tileSize)
		lava.image.Position = UDim2.new(lava.x_scale, x_offset, lava.y_scale, lava.y_offset)
	end

	-- make test panels invis when close up
	for _,test in tests do
		local cameraPosition = camera.CFrame.Position
		local dist = (cameraPosition - test.Position).Magnitude
		local transparency = 0
		if dist < 19 then
			transparency = 1 - ((dist-4)/15)
		end
		for _,decal in test:GetChildren() do
			decal.Transparency = transparency
		end
	end
end)
