local MaterialList = {
	Enum.Material.Neon,
	Enum.Material.Cobblestone,
	Enum.Material.Ice,
	Enum.Material.Brick,
	Enum.Material.Marble,
	Enum.Material.Wood,
	Enum.Material.WoodPlanks,
	Enum.Material.DiamondPlate,
	Enum.Material.Foil,
	Enum.Material.Granite,
	Enum.Material.Grass,
	Enum.Material.SmoothPlastic,
	Enum.Material.Plastic,
	Enum.Material.Sand,
	Enum.Material.Glass
}

while true do
	script.Parent.BrickColor = BrickColor.Random()
	script.Parent.Material = MaterialList[math.random(#MaterialList)]
	wait(0.1)
end