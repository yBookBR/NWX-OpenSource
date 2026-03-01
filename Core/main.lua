--██████╗ ██╗   ██╗    ██████╗  ██████╗  ██████╗ ██╗  ██╗
--██╔══██╗╚██╗ ██╔╝    ██╔══██╗██╔═══██╗██╔═══██╗██║ ██╔╝
--██████╔╝ ╚████╔╝     ██████╔╝██║   ██║██║   ██║█████╔╝ 
--██╔══██╗  ╚██╔╝      ██╔══██╗██║   ██║██║   ██║██╔═██╗ 
--██████╔╝   ██║       ██████╔╝╚██████╔╝╚██████╔╝██║  ██╗
--╚═════╝    ╚═╝       ╚═════╝  ╚═════╝  ╚═════╝ ╚═╝  ╚═╝
 -- Portfolio: https://guns.lol/book.                                                   


-- • • • • • • • • • SERVICES • • • • • • • • •

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local Stats = game:GetService("Stats")
local UserInputService = game:GetService("UserInputService")
local TeamsService = game:GetService("Teams")
local player = Players.LocalPlayer
 
pcall(function()
    if player.PlayerGui:FindFirstChild("NWXHub") then
        player.PlayerGui:FindFirstChild("NWXHub"):Destroy()
    end
end)

local DEFAULT_SPEED = 16
local MAX_SPEED = 100


-- • • • • • • • • • MAIN FRAME • • • • • • • • • 
local gui = Instance.new("ScreenGui", player.PlayerGui)
gui.Name = "NWX_HUB"
gui.ResetOnSpawn = false
gui.ZIndexBehavior = Enum.ZIndexBehavior.Global
 
local main = Instance.new("Frame", gui)
main.Size = UDim2.new(0,760,0,420)
main.Position = UDim2.new(0.5,-380,0.5,-210)
main.BackgroundColor3 = Color3.fromRGB(20,20,20)
main.BorderSizePixel = 0
main.Active = true
main.Draggable = true
Instance.new("UICorner", main).CornerRadius = UDim.new(0,18)
 
local mainStroke = Instance.new("UIStroke", main)
mainStroke.Thickness = 1.5
mainStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 
-- • • • • • • • • • SIDEBAR • • • • • • • • • 
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

-- • • • • • • • • • PROFILE • • • • • • • • • 
local profile = Instance.new("Frame", side)
profile.Size = UDim2.new(1,-20,0,90)
profile.Position = UDim2.new(0,19,1,-90)
profile.BackgroundTransparency = 1
local avatar = Instance.new("ImageLabel", profile)
avatar.Size = UDim2.new(0,42,0,42)
avatar.Position = UDim2.new(0,0,0,8)
avatar.BackgroundTransparency = 1
Instance.new("UICorner", avatar).CornerRadius = UDim.new(1,0)
task.spawn(function()
    avatar.Image = Players:GetUserThumbnailAsync(player.UserId, Enum.ThumbnailType.HeadShot, Enum.ThumbnailSize.Size180x180)
end)
 
local function profileText(text,y,size,bold,color)
    local l = Instance.new("TextLabel", profile)
    l.Position = UDim2.new(0,52,0,y)
    l.Size = UDim2.new(1,-52,0,18)
    l.Text = text
    l.Font = bold and Enum.Font.GothamBold or Enum.Font.Gotham
    l.TextSize = size
    l.TextColor3 = color
    l.BackgroundTransparency = 1
    l.TextXAlignment = Enum.TextXAlignment.Left
    return l
end
profileText(player.Name, 6, 13, true, Color3.new(1,1,1))
profileText(os.date("%d / %m / %Y"), 24, 11, false, Color3.fromRGB(180,180,180))
profileText("Version 1.0", 40, 10, false, Color3.fromRGB(140,140,140))
 
local content = Instance.new("Frame", main)
content.Position = UDim2.new(0,190,0,20)
content.Size = UDim2.new(1,-210,1,-40)
content.BackgroundTransparency = 1
 
-- • • • • • • • • • OTHERS (MAIN)  • • • • • • • • •
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
 
-- • • • • • • • • • TEAM & ESP • • • • • • • • • 
local teamPage = Instance.new("Frame", content)
teamPage.Size = UDim2.new(1,0,1,0)
teamPage.BackgroundTransparency = 1
teamPage.Visible = false
 
local teamTitle = Instance.new("TextLabel", teamPage)
teamTitle.Size = UDim2.new(0.5,0,0,30)
teamTitle.Text = "Function"
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

-- • • • • • • • • • SPEED • • • • • • • • •
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
 
btnMain.MouseButton1Click:Connect(function() mainPage.Visible = true teamPage.Visible = false end)
btnTeam.MouseButton1Click:Connect(function() mainPage.Visible = false teamPage.Visible = true end)
 
-- • • • • • • • • • SERVER INFO • • • • • • • • •
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
 
RunService.RenderStepped:Connect(function()
    frames += 1
    local now = tick()
    if now - lastTime >= 1 then
        fps = frames
        frames = 0
        lastTime = now
        infoFPS.Text = "FPS: " .. fps
    end
end)
 
-- • • • • • • • • • MINIMIZE SYSTEM • • • • • • • • •
local mini = Instance.new("TextButton", gui)
mini.Size = UDim2.new(0,42,0,42)
mini.Position = UDim2.new(1,-60,0.5,-21)
mini.Text = "≡"
mini.Font = Enum.Font.GothamBold
mini.TextSize = 20
mini.TextColor3 = Color3.fromRGB(255,255,255)
mini.BackgroundColor3 = Color3.fromRGB(25,25,25)
mini.BorderSizePixel = 0
mini.AutoButtonColor = false
mini.ZIndex = 50
Instance.new("UICorner", mini).CornerRadius = UDim.new(1,0)
 
local miniStroke = Instance.new("UIStroke", mini)
miniStroke.Thickness = 1.5
miniStroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
 
local opened = true
local function toggle()
    opened = not opened
    main.Visible = opened
end
 
mini.MouseButton1Click:Connect(toggle)
 
UserInputService.InputBegan:Connect(function(input, gp)
    if gp then return end
    
    if input.KeyCode == Enum.KeyCode.F and 
       (UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) 
        or UserInputService:IsKeyDown(Enum.KeyCode.RightShift)) then
        toggle()
    end
end)
 
RunService.RenderStepped:Connect(function()
    miniStroke.Color = Color3.fromHSV((tick() % 14) / 14, 1, 1)
end)