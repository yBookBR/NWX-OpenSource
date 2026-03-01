--Credits By Book
-- Discord  >> book.sss

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
end