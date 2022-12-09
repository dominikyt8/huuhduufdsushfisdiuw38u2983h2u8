local shadow=game:GetObjects("rbxassetid://158932562")[1] shadow.Parent = game.Players.LocalPlayer.Backpack local Players = game:GetService("Players") local Plr = Players.LocalPlayer local Char = Plr.Character or Plr.CharacterAdded:Wait() local Hum = Char:WaitForChild("Humanoid") local RightArm = Char:WaitForChild("RightUpperArm") local LeftArm = Char:WaitForChild("LeftUpperArm") local RightC1 = RightArm.RightShoulder.C1 local LeftC1 = LeftArm.LeftShoulder.C1 local function setupCrucifix(tool) RightArm.Name = "R_Arm" LeftArm.Name = "L_Arm" RightArm.RightShoulder.C1 = RightC1 * CFrame.Angles(math.rad(-90), math.rad(-15), 0) LeftArm.LeftShoulder.C1 = LeftC1 * CFrame.new(-0.2, -0.3, -0.5) * CFrame.Angles(math.rad(-125), math.rad(25), math.rad(25)) for _, v in next, Hum:GetPlayingAnimationTracks() do v:Stop() end end shadow.Equipped:Connect(function() setupCrucifix(shadow) game.Players.LocalPlayer:SetAttribute("Hidden", true) end) shadow.Unequipped:Connect(function() game.Players.LocalPlayer:SetAttribute("Hidden", false) RightArm.Name = "RightUpperArm" LeftArm.Name = "LeftUpperArm" RightArm.RightShoulder.C1 = RightC1 LeftArm.LeftShoulder.C1 = LeftC1 end)

-- function

workspace.CurrentRooms.ChildAdded:Connect(function(Room)
    local ChaseStart = game.ReplicatedStorage.GameData.ChaseStart.Value
        Room = tonumber(Room.Name)
        if Room == ChaseStart then
        Room = workspace.CurrentRooms[Room - 1]
        Room.Door.ClientOpen:Destroy()
        Room.Door.Hidden:Destroy()
        Room.Door.Door.CanCollide = false
        Room = workspace.CurrentRooms[tonumber(Room.Name) + 1]
        repeat task.wait(0.25) until Room:FindFirstChild("LightFixture", true)
        for _,Object in pairs(Room:GetDescendants()) do
            local IsLight = Object:FindFirstAncestor("LightFixture") and (Object:IsA("PointLight") or Object:IsA("SpotLight"))
            if IsLight then
                Object.Enabled = true
            end
        end
    end
end)

-- delete seek

game:GetService("Workspace"):FindFirstChild("SeekMoving"):Destroy()
