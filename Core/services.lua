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