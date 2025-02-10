local map = workspace.surf_bloodthirst
local ratio = 0.5

for _, x in map:GetDescendants() do
    if x.ClassName == "PointLight" or x.ClassName == "SpotLight" or x.ClassName == "SurfaceLight" then
        x.Brightness = x.Brightness * ratio
        x.Shadows = true
    end
end
