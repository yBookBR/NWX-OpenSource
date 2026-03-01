--Credits By Book
-- Discord  >> book.sss

local side = Instance.new("Frame", main)
side.Size = UDim2.new(0,180,1,0)
side.BackgroundColor3 = Color3.fromRGB(15,15,15)
side.BorderSizePixel = 0
Instance.new("UICorner", side).CornerRadius = UDim.new(0,18)
 
local title = Instance.new("TextLabel", side)
title.Size = UDim2.new(1,0,0,40)
title.Position = UDim2.new(0,0,0,22)
title.Text = "NWX Open"
title.Font = Enum.Font.GothamBold
title.TextSize = 18
title.TextColor3 = Color3.new(1,1,1)
title.BackgroundTransparency = 1
 
local function sideBtn(text,y)
    local b = Instance.new("TextButton", side)
    b.Size = UDim2.new(0.85,0,0,40)
    b.Position = UDim2.new(0.075,0,0,y)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 14
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(30,30,30)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b)
    local s = Instance.new("UIStroke", b)
    s.Thickness = 1.2
    s.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
    return b, s
end
 
local btnMain, strokeMain = sideBtn("Main", 80)
local btnTeam, strokeTeam = sideBtn("Principal", 130)