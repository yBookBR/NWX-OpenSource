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