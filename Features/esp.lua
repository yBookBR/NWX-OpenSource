--Credits By Book
-- Discord  >> book.sss

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
