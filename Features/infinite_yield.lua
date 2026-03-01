--Credits By Book
-- Discord  >> book.sss

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