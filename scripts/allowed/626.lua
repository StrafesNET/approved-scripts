local part = script.Parent;

workspace.Terrain:FillBlock(part.CFrame, part.Size, Enum.Material.Water);
workspace.Terrain:SetMaterialColor(Enum.Material.Water, Color3.fromRGB(22, 90, 132));

--part.Transparency = 1;

script:Destroy();