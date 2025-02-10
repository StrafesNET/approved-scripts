while true do
wait(0.0001) -- how fast to change into that color
script.Parent.Color3 = Color3.new(script.Parent.Script2.R.Value/255,script.Parent.Script2.G.Value/255,script.Parent.Script2.B.Value/255)
end