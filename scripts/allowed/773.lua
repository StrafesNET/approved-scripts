local tick=tick
local floor=math.floor
local format=string.format

local IsA=game.IsA
local GetChildren=game.GetChildren

local lighting=game:GetService'Lighting'

local cycle=480--How long each day is in seconds

local SwitchOnHour=18--What time do the lights turn on (24h clock)
local SwitchOffHour=7--What time do the lights turn off (24h clock)

local t_On=SwitchOnHour/24
local t_Off=SwitchOffHour/24

local t_Diff=(t_Off-t_On)%1

local function rsearch(search,cond1,cond2)
    local found={}
    local c=GetChildren(search)
    for i=1,#c do
        local thing=c[i]
        if not cond1 or cond1(thing) then
            found[#found+1]=thing
        end
        if not cond2 or cond2(thing) then
            local nfound=#found
            local r=rsearch(thing,cond1,cond2)
            for i=1,#r do
                found[nfound+i]=r[i]
            end
        end
    end
    return found
end

local function IsNightLight(obj)
    return IsA(obj,"Light") and obj.Name=="NightLight"
end

local NightLights=rsearch(workspace,IsNightLight)
local NNightLights=#NightLights

local State

game:GetService'RunService'.Stepped:connect(function()
    local t=tick()/cycle
    lighting.TimeOfDay=(floor(24*t)%24)..":"..format("%.2i",floor(1440*t)%60)..":"..format("%.2i",floor(86400*t)%60)
    local TargetState=(t-t_On)%1<t_Diff
    if State~=TargetState then
        State=TargetState
        for i=1,NNightLights do
            NightLights[i].Enabled=TargetState
        end
    end 
end)