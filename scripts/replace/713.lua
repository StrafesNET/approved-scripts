local brick = script.Parent
local Red,Blue,Green=BrickColor.Red(),BrickColor.Blue(),BrickColor.Green()
while true do
brick.BrickColor = Green
wait(0.5)
brick.BrickColor = Blue
wait(0.5)
brick.BrickColor = Red
wait(0.5)
end