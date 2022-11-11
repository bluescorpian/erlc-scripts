local FE = game:GetService("ReplicatedStorage"):WaitForChild("FE");
local fillStaminaButton = game:GetService("Players").LocalPlayer.PlayerGui.GameGui.BottomLeft.Health.Stamina.Fill

local fillStaminaClick = getconnections(fillStaminaButton.MouseButton1Down)[1].Function

hookfunction(fillStaminaClick, function()
    firesignal(FE.FillStaminaBought.OnClientEvent)
end)