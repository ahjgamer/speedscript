local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
LocalPlayer.CharacterAdded:Wait()
local character = LocalPlayer.Character or LocalPlayer.CharacterAdded:Wait()
local humanoid = character:WaitForChild("Humanoid")
humanoid.WalkSpeed = 50

while true do
    task.wait(0.2)
    if humanoid and humanoid.WalkSpeed ~= 50 then
        humanoid.WalkSpeed = 50
    end
end
