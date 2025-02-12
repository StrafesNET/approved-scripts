local lg=game:service'Lighting';
function c3(r,g,b)
	return Color3.new(r/255,b/255,g/255)
end
local gr=c3(127,127,127)
lg.Ambient=gr
lg.Brightness=0
lg.ColorShift_Bottom=c3(0,0,0)
lg.ColorShift_Top=c3(0,0,0)
lg.GlobalShadows=false;
lg.OutdoorAmbient=gr
lg.Outlines=true
lg.ShadowColor=c3(178,178,183)
lg.GeographicLatitude=41.733
lg.TimeOfDay='14:00:00'
lg.FogColor=c3(191,191,191)
lg.FogEnd=100000
lg.FogStart=0
