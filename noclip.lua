local character = game.Players.LocalPlayer.Character
while true do
for i,v in pairs(character:GetDescendants()) do
pcall(function()
if v:IsA("BasePart") then
v.CanCollide = false
end
end)
end
task.wait()
end
