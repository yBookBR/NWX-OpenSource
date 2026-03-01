--Credits By Book
-- Discord  >> book.sss

local mainPage = Instance.new("ScrollingFrame", content)
mainPage.Size = UDim2.new(1,0,1,0)
mainPage.BackgroundTransparency = 1
mainPage.BorderSizePixel = 0
mainPage.ScrollBarThickness = 2
mainPage.ScrollBarImageColor3 = Color3.fromRGB(80, 80, 80)
mainPage.Visible = true
mainPage.CanvasSize = UDim2.new(0,0,0,500)
 
local mainLayout = Instance.new("UIListLayout", mainPage)
mainLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
mainLayout.Padding = UDim.new(0,10)
mainLayout.SortOrder = Enum.SortOrder.LayoutOrder
 
local function infoBox(text, order)
    local l = Instance.new("TextLabel", mainPage)
    l.Size = UDim2.new(1,-30,0,50)
    l.LayoutOrder = order
    l.Text = text
    l.Font = Enum.Font.GothamBold
    l.TextSize = 14
    l.TextColor3 = Color3.new(1,1,1)
    l.BackgroundColor3 = Color3.fromRGB(30,30,30)
    l.BorderSizePixel = 0
    Instance.new("UICorner", l)
    return l
end
 
local infoPlayers = infoBox("Players: --", 1)
local infoPing = infoBox("Latency: -- ms", 2)
local infoFPS = infoBox("FPS: --", 3)
local infoServer = infoBox("Server Info: --", 4)
end