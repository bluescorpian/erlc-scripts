local utils = loadstring(game:HttpGet("https://bit.ly/3MvJxjZ"))()
local FE = game:GetService("ReplicatedStorage"):WaitForChild("FE");
local BuyGas = FE.BuyGas

local oldNameCall
oldNameCall = hookmetamethod(game, "__namecall", function(Self, ...)
    if not checkcaller() and Self == BuyGas and getnamecallmethod() == "InvokeServer" then
        local args = {...}
        return oldNameCall(Self, args[1], args[2])
    end
    -- utils.print({...})

    return oldNameCall(Self, ...)
end)
-- local BuyButton = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus:WaitForChild("Gas Pump"):WaitForChild("BuyFrame"):WaitForChild("Purchase")

-- local buyConnection = getconnections(BuyButton.MouseButton1Down)[1]

-- utils.print(debug.getupvalues(buyConnection.Function))