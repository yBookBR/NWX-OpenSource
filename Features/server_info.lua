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