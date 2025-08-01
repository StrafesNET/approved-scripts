local materials = {Enum.Material.SmoothPlastic, Enum.Material.Neon}
local currentIndex = 1

while true do
    for _,part in script.Parent:GetChildren() do
        if part:IsA("BasePart") then
            -- Toggle material
            part.Material = materials[currentIndex]
        end
    end
    -- increment currentIndex
    currentIndex = currentIndex % #materials + 1
    task.wait(3)  -- wait 3 seconds
end
