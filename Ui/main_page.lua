--Credits By Book
-- Discord  >> book.sss

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