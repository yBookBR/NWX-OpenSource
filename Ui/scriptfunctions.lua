--Credits By Book
-- Discord  >> book.sss

RunService.RenderStepped:Connect(function()
    local c = Color3.fromHSV((tick() % 8) / 8,1,1)
    mainStroke.Color = c
    strokeMain.Color = c
    strokeTeam.Color = c
    sliderStroke.Color = c
    sliderFill.BackgroundColor3 = c
end)
 
task.spawn(function()
    while task.wait(1) do
        infoPlayers.Text = "Players: "..#Players:GetPlayers().." / "..Players.MaxPlayers
        local png = 0
        pcall(function() png = math.floor(Stats.Network.ServerStatsItem["Data Ping"]:GetValue()) end)
        infoPing.Text = "Latency: "..png.." ms"
        infoServer.Text = "Server: " .. game.JobId:sub(1,8)
    end
end)
 

local fps = 0
local frames = 0
local lastTime = tick()

local dragging = false
local function setSpeedFromX(x)
    local minX = sliderBg.AbsolutePosition.X
    local maxX = minX + sliderBg.AbsoluteSize.X
    local percent = math.clamp((x - minX) / (maxX - minX), 0, 1)
    sliderFill.Size = UDim2.new(percent,0,1,0)
    local speed = math.floor(DEFAULT_SPEED + (MAX_SPEED - DEFAULT_SPEED) * percent)
    speedValue.Text = speed
    if player.Character and player.Character:FindFirstChild("Humanoid") then
        player.Character.Humanoid.WalkSpeed = speed
    end
end
 
sliderBg.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        main.Draggable = false
        setSpeedFromX(input.Position.X)
    end
end)
UserInputService.InputChanged:Connect(function(input)
    if dragging and input.UserInputType == Enum.UserInputType.MouseMovement then
        setSpeedFromX(input.Position.X)
    end
end)
UserInputService.InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = false
        main.Draggable = true
    end
end)

--Esp

local teamPage = Instance.new("Frame", content)
teamPage.Size = UDim2.new(1,0,1,0)
teamPage.BackgroundTransparency = 1
teamPage.Visible = false
 
local teamTitle = Instance.new("TextLabel", teamPage)
teamTitle.Size = UDim2.new(0.5,0,0,30)
teamTitle.Text = "Times"
teamTitle.Font = Enum.Font.GothamBold
teamTitle.TextSize = 18
teamTitle.TextColor3 = Color3.new(1,1,1)
teamTitle.BackgroundTransparency = 1
 
local espTitle = Instance.new("TextLabel", teamPage)
espTitle.Size = UDim2.new(0.5,0,0,30)
espTitle.Position = UDim2.new(0.5,0,0,0)
espTitle.Text = "ESP"
espTitle.Font = Enum.Font.GothamBold
espTitle.TextSize = 18
espTitle.TextColor3 = Color3.new(1,1,1)
espTitle.BackgroundTransparency = 1
 
local scrollTimes = Instance.new("ScrollingFrame", teamPage)
scrollTimes.Position = UDim2.new(0,0,0,35)
scrollTimes.Size = UDim2.new(0.5,-5,1,-35)
scrollTimes.BackgroundTransparency = 1
scrollTimes.ScrollBarThickness = 0
local layoutTimes = Instance.new("UIListLayout", scrollTimes)
layoutTimes.Padding = UDim.new(0,8)
 
 layoutTimes:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
    scrollTimes.CanvasSize = UDim2.new(0, 0, 0, layoutTimes.AbsoluteContentSize.Y + 10)
end)

local scrollESP = Instance.new("ScrollingFrame", teamPage)
scrollESP.Position = UDim2.new(0.5,5,0,35)
scrollESP.Size = UDim2.new(0.5,-5,1,-35)
scrollESP.BackgroundTransparency = 1
scrollESP.ScrollBarThickness = 0
local layoutESP = Instance.new("UIListLayout", scrollESP)
layoutESP.Padding = UDim.new(0,8)
 
_G.EspNames = false
_G.EspRGB = false
_G.EspPoint = false
 
local function createEspBtn(text, varName)
    local b = Instance.new("TextButton", scrollESP)
    b.Size = UDim2.new(1,-10,0,40)
    b.Text = text
    b.Font = Enum.Font.Gotham
    b.TextSize = 13
    b.TextColor3 = Color3.new(1,1,1)
    b.BackgroundColor3 = Color3.fromRGB(35,35,35)
    b.BorderSizePixel = 0
    Instance.new("UICorner", b)
    
    b.MouseButton1Click:Connect(function()
        _G[varName] = not _G[varName]
        b.BackgroundColor3 = _G[varName] and Color3.fromRGB(60, 60, 180) or Color3.fromRGB(35,35,35)
    end)
end
 
createEspBtn("Name", "EspNames")
createEspBtn("Glow", "EspRGB")
createEspBtn("Point", "EspPoint")
 
task.spawn(function()
    while true do
        for _, p in pairs(Players:GetPlayers()) do
            if p ~= player and p.Character and p.Character:FindFirstChild("HumanoidRootPart") then
                local char = p.Character
                local head = char:FindFirstChild("Head")
                if head then
                    local bGui = char:FindFirstChild("NWX_GUI") or Instance.new("BillboardGui", char)
                    bGui.Name = "NWX_GUI"
                    bGui.AlwaysOnTop = true
                    bGui.Size = UDim2.new(0, 100, 0, 50)
                    bGui.Adornee = head
                    bGui.StudsOffset = Vector3.new(0, 3, 0)
 
                    local tag = bGui:FindFirstChild("NameTag") or Instance.new("TextLabel", bGui)
                    tag.Name = "NameTag"
                    tag.BackgroundTransparency = 1
                    tag.Size = UDim2.new(1,0,0,20)
                    tag.Position = UDim2.new(0,0,0,-15)
                    tag.TextColor3 = Color3.new(1,1,1)
                    tag.Font = Enum.Font.SourceSansItalic
                    tag.TextSize = 16
                    tag.Text = p.DisplayName
                    tag.Visible = _G.EspNames
 
                    local dot = bGui:FindFirstChild("Dot") or Instance.new("Frame", bGui)
                    dot.Name = "Dot"
                    dot.Size = UDim2.new(0,6,0,6)
                    dot.Position = UDim2.new(0.5,-3,0.5,-3)
                    dot.BackgroundColor3 = Color3.new(1,1,1)
                    dot.BorderSizePixel = 0
                    dot.Visible = _G.EspPoint
                    if not dot:FindFirstChild("UICorner") then Instance.new("UICorner", dot).CornerRadius = UDim.new(1,0) end
                end
 
                local highlight = char:FindFirstChild("NWX_GLOW") or Instance.new("Highlight", char)
                highlight.Name = "NWX_GLOW"
                highlight.Enabled = _G.EspRGB
                if _G.EspRGB then
                    local color = Color3.fromHSV((tick() % 5) / 5, 1, 1)
                    highlight.FillColor = color
                    highlight.OutlineColor = color
                    highlight.FillTransparency = 0.5
                    highlight.OutlineTransparency = 0
                end
            end
        end
        task.wait(0.1)
    end
end)


-- Others (main)

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
 
local universalTitle = Instance.new("TextLabel", mainPage)
universalTitle.Size = UDim2.new(1,0,0,24)
universalTitle.LayoutOrder = 6
universalTitle.Text = "UNIVERSAL"
universalTitle.Font = Enum.Font.GothamBold
universalTitle.TextSize = 16
universalTitle.TextColor3 = Color3.new(1,1,1)
universalTitle.BackgroundTransparency = 1
 
local iy = Instance.new("TextButton", mainPage)
iy.LayoutOrder = 7
iy.Size = UDim2.new(1,-30,0,45)
iy.Text = "Infinite Yield"
iy.Font = Enum.Font.Gotham
iy.TextSize = 14
iy.TextColor3 = Color3.new(1,1,1)
iy.BackgroundColor3 = Color3.fromRGB(30,30,30)
iy.BorderSizePixel = 0
Instance.new("UICorner", iy)
iy.MouseButton1Click:Connect(function()
    loadstring(game:HttpGet("https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source"))()
end)
 
local speedTitle = Instance.new("TextLabel", mainPage)
speedTitle.LayoutOrder = 8
speedTitle.Size = UDim2.new(1,0,0,25)
speedTitle.Text = "SPEED"
speedTitle.Font = Enum.Font.GothamBold
speedTitle.TextSize = 14
speedTitle.TextColor3 = Color3.new(1,1,1)
speedTitle.BackgroundTransparency = 1
 
local speedValue = Instance.new("TextLabel", mainPage)
speedValue.LayoutOrder = 9
speedValue.Size = UDim2.new(1,0,0,15)
speedValue.Text = DEFAULT_SPEED
speedValue.Font = Enum.Font.Gotham
speedValue.TextSize = 13
speedValue.TextColor3 = Color3.fromRGB(200,200,200)
speedValue.BackgroundTransparency = 1
 
local sliderCont = Instance.new("Frame", mainPage)
sliderCont.LayoutOrder = 10
sliderCont.Size = UDim2.new(1,-40,0,20)
sliderCont.BackgroundTransparency = 1
 
local sliderBg = Instance.new("Frame", sliderCont)
sliderBg.Size = UDim2.new(1,0,0,8)
sliderBg.Position = UDim2.new(0,0,0.5,-4)
sliderBg.BackgroundColor3 = Color3.fromRGB(45,45,45)
sliderBg.BorderSizePixel = 0
Instance.new("UICorner", sliderBg).CornerRadius = UDim.new(1,0)
 
local sliderStroke = Instance.new("UIStroke", sliderBg)
sliderStroke.Thickness = 1
sliderStroke.Transparency = 0.5
 
local sliderFill = Instance.new("Frame", sliderBg)
sliderFill.Size = UDim2.new(0,0,1,0)
sliderFill.BorderSizePixel = 0
Instance.new("UICorner", sliderFill).CornerRadius = UDim.new(1,0)
 