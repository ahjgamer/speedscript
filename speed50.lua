--// Simple GUI Speed Script with Toggle and Minimize

-- Prevent duplicate GUI
if game.CoreGui:FindFirstChild("SpeedGui") then
    game.CoreGui:FindFirstChild("SpeedGui"):Destroy()
end

-- Variables
local plr = game.Players.LocalPlayer
local speedOn = false

-- Create ScreenGui
local gui = Instance.new("ScreenGui")
gui.Name = "SpeedGui"
gui.ResetOnSpawn = false
gui.Parent = game.CoreGui

-- Main Frame
local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 100)
frame.Position = UDim2.new(0.3, 0, 0.3, 0)
frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

-- Title
local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, 0, 0, 30)
title.Text = "Speed Menu"
title.BackgroundColor3 = Color3.fromRGB(45, 45, 45)
title.TextColor3 = Color3.fromRGB(255, 255, 255)
title.Font = Enum.Font.SourceSansBold
title.TextSize = 18
title.Parent = frame

-- Minimize Button
local minimize = Instance.new("TextButton")
minimize.Size = UDim2.new(0, 30, 0, 30)
minimize.Position = UDim2.new(1, -30, 0, 0)
minimize.Text = "-"
minimize.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
minimize.TextColor3 = Color3.fromRGB(255, 255, 255)
minimize.Font = Enum.Font.SourceSans
minimize.TextSize = 20
minimize.Parent = frame

-- Speed Toggle Button
local toggle = Instance.new("TextButton")
toggle.Size = UDim2.new(1, -20, 0, 40)
toggle.Position = UDim2.new(0, 10, 0, 40)
toggle.Text = "Speed: OFF"
toggle.BackgroundColor3 = Color3.fromRGB(60, 60, 60)
toggle.TextColor3 = Color3.fromRGB(255, 255, 255)
toggle.Font = Enum.Font.SourceSans
toggle.TextSize = 18
toggle.Parent = frame

-- Toggle Logic
toggle.MouseButton1Click:Connect(function()
    speedOn = not speedOn
    toggle.Text = "Speed: " .. (speedOn and "ON" or "OFF")
end)

-- Minimize Logic
local minimized = false
minimize.MouseButton1Click:Connect(function()
    minimized = not minimized
    for _, obj in pairs(frame:GetChildren()) do
        if obj ~= title and obj ~= minimize then
            obj.Visible = not minimized
        end
    end
end)

-- Speed Handler
game:GetService("RunService").RenderStepped:Connect(function()
    local char = plr.Character
    if char and char:FindFirstChild("Humanoid") then
        local humanoid = char.Humanoid
        if speedOn then
            humanoid.WalkSpeed = 50
        else
            humanoid.WalkSpeed = 16
        end
    end
end)
