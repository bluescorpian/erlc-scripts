local LocalPlayer = game:GetService("Players").LocalPlayer
function onCharacter(character)
    local interactions = require(character:WaitForChild("Interaction Handler"):WaitForChild("InteractionActions"))
    local heal = interactions["Heal"]
    heal.Distance = 30
    heal.HoldTime = 0.5
    local arrest = interactions["Arrest"]
    arrest.Distance = 20
    arrest.HoldTime = 0.2
end
onCharacter(LocalPlayer.Character)
LocalPlayer.CharacterAdded:Connect(onCharacter)

