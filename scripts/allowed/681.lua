local tick=tick
local wait=task.wait

local IDs = {
	"rbxassetid://11181690067", -- 00
	"rbxassetid://11181691746", -- 01
	"rbxassetid://11181692923", -- 02
	"rbxassetid://11181694057", -- 03
	"rbxassetid://11181694939", -- 04
	"rbxassetid://11181696150", -- 05
	"rbxassetid://11181697193", -- 06
	"rbxassetid://11181698052", -- 07
	"rbxassetid://11181699092", -- 08
	"rbxassetid://11181700146", -- 09
	"rbxassetid://11181701308", -- 10
	"rbxassetid://11181702280", -- 11
	"rbxassetid://11181703373", -- 12
	"rbxassetid://11181704257", -- 13
	"rbxassetid://11181705069", -- 14
	"rbxassetid://11181705914", -- 15
}

local MaximumSteps=#IDs
local StepTime=0.05

local Decal=script.Parent

--main loop
local Step=0
local t0=tick()
while true do
	local t=tick()-t0

	local WrappedStep=Step%MaximumSteps+1
	Decal.Texture=IDs[WrappedStep]

	--approximately wait a certain amount of time using roblox's inaccurate scheduling system
	--the times will adjust and self-correct depending on the actual time waited
	Step+=1
	wait(Step*StepTime-t)
end
