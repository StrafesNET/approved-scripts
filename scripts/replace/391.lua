while true do
local i = 0
while i < 1 do
    script.Parent.SelectionBox.Transparency = i
    wait(0.1)
    i = i + .1
end
while i > 0 do
    script.Parent.SelectionBox.Transparency = i
    wait(0.1)
    i = i - .1
end
end