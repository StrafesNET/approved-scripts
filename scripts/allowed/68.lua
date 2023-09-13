local SurfaceGui=script.Parent
local Part=SurfaceGui.Parent
SurfaceGui.Adornee=Part

local AssetId="http://www.roblox.com/asset/?id=412423574"
local w=49
local h=512

--Options
local Frequency=math.pi--I measured this from the actual map :)
local Offset=w*(4-3)--The nth color from the left
SurfaceGui.Face=Enum.NormalId.Left--Change this if it's not on the right face

--[[ Faces
0 Right
1 Top
2 Back
3 Left
4 Bottom
5 Front
--]]

if SurfaceGui.Face==Enum.NormalId.Right then
	SurfaceGui.CanvasSize=Vector2.new(w,Part.Size.y/Part.Size.z*w)
elseif SurfaceGui.Face==Enum.NormalId.Top then
	SurfaceGui.CanvasSize=Vector2.new(w,Part.Size.x/Part.Size.z*w)
elseif SurfaceGui.Face==Enum.NormalId.Back then
	SurfaceGui.CanvasSize=Vector2.new(w,Part.Size.y/Part.Size.x*w)
elseif SurfaceGui.Face==Enum.NormalId.Left then
	SurfaceGui.CanvasSize=Vector2.new(w,Part.Size.y/Part.Size.z*w)
elseif SurfaceGui.Face==Enum.NormalId.Bottom then
	SurfaceGui.CanvasSize=Vector2.new(w,Part.Size.x/Part.Size.z*w)
elseif SurfaceGui.Face==Enum.NormalId.Front then
	SurfaceGui.CanvasSize=Vector2.new(w,Part.Size.y/Part.Size.x*w)
end

local Clipper=Instance.new("Frame",SurfaceGui)
Clipper.Name="Clipper"
Clipper.BackgroundTransparency=1
Clipper.Size=UDim2.new(1,0,1,0)
Clipper.ClipsDescendants=true

local Frame=Instance.new("Frame",Clipper)
Frame.BackgroundTransparency=1
Frame.Size=UDim2.new(1,0,0,h)

for i=1,1+math.ceil(SurfaceGui.CanvasSize.y/h) do
	local Lazer=Instance.new("ImageLabel",Frame)
	Lazer.Name="Lazer"..i
	Lazer.Image=AssetId
	Lazer.ImageRectSize=Vector2.new(w,h)
	Lazer.ImageRectOffset=Vector2.new(Offset,0)
	Lazer.BackgroundTransparency=1
	Lazer.Size=UDim2.new(1,0,1,0)
	Lazer.Position=UDim2.new(0,0,i-1,0)
end

local u2=UDim2.new
game:GetService'RunService'.Heartbeat:connect(function()
	Frame.Position=u2(0,0,0,(tick()*Frequency%1-1)*h)
end)