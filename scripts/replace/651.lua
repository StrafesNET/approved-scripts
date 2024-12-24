task.wait(3)

local RunService = game:GetService("RunService")

local seconds_per_cycle = 4
local seconds_per_cycle2 = 6

local arrows = {}
for _, inst in script.Parent:GetDescendants() do
	if inst.Name == "Arrows" then
		table.insert(arrows, inst)
	end
end

local arrows2 = {}
for _, inst in script.Parent:GetDescendants() do
	if inst:IsA("Texture") and inst.Name == "Arrows2" then
		table.insert(arrows2, inst)
	end
end


--ORIGINAL COLORS
--local colors = {
--	Color3.fromRGB(253, 0, 255),
--	Color3.fromRGB(253, 255, 0),
--	Color3.fromRGB(0, 255, 56),
--	Color3.fromRGB(0, 249, 255),
--	Color3.fromRGB(60, 0, 255)
--}

local colors = {
	Color3.fromRGB(1000, 0, 1275),
	Color3.fromRGB(1000, 255, 0),
	Color3.fromRGB(0, 1000, 56),
	Color3.fromRGB(0, 1000, 255),
	Color3.fromRGB(60, 0, 2000)
}

local function lerpColor(lerp)
	local numColors = #colors
	local index = math.floor(lerp * numColors) + 1
	local nextIndex = index + 1
	if nextIndex > numColors then
		nextIndex = 1
	end
	local startColor = colors[index]
	local endColor = colors[nextIndex]
	local alpha = math.fmod(lerp * numColors, 1)
	return startColor:Lerp(endColor, alpha)
end

local totDt = 0

local function onStep(dt)
	totDt = totDt + dt
	if (totDt > seconds_per_cycle) then
		totDt = math.fmod(totDt, seconds_per_cycle)
	end
	local color = lerpColor(totDt / seconds_per_cycle)
	for _, arrow in pairs(arrows) do
		arrow.Color3 = color
	end
	
	if (totDt > seconds_per_cycle2) then
		totDt = math.fmod(totDt, seconds_per_cycle2)
	end
	local color = lerpColor(totDt / seconds_per_cycle2)
	for _, arrow2 in pairs(arrows2) do
		arrow2.Color3 = color
	end
end

RunService.RenderStepped:Connect(onStep)

-------------------------------------------------------------------------------------------------

--task.wait(7)
--local RunService = game:GetService("RunService")

--local seconds_per_cycle = 3

--local arrows = {}
--for _, inst in script.Parent:GetDescendants() do
--	if inst:IsA("Texture") and inst.Name == "Arrows" then
--		table.insert(arrows, inst)
--		print("arrow added to table")
--	end
--end

--local hue = 0

--local function onStep(dt)
--	hue = hue + (dt / seconds_per_cycle)
--	if (hue > 1) then
--		hue = hue - 1
--	end
--	local color = Color3.fromHSV(hue, 1, 1)
--	for _, arrow in arrows do
--		arrow.Color3 = color
--	end
--end

--RunService.RenderStepped:Connect(onStep)

------------------------------------------------------------------------------------------------------

--wait(5)
--b = script.Parent
--x = 0
--tx = script.Parent:WaitForChild("Arrows")



--while true do

--    tx.Color3 = Color3.fromHSV(x,1,1)
--    x = x + 2/255 -- you can change the increment to speed/slow up the changing effect (eg: 3/500, 10/255, 0.5/255, etc.)
--    if x >= 1 then
--        x = 0
--    end
--    wait() -- put time in seconds to slow the effect if you want (rlly slowwwwwwwwwwwwww). Leave nothing inside otherwise.
--end
