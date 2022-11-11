local LocalPlayer = game:GetService("Players").LocalPlayer
local FE = game:GetService("ReplicatedStorage"):WaitForChild("FE");
local gameMenus = game:GetService("Players").LocalPlayer.PlayerGui.GameMenus
local menuFunctions = require(gameMenus.MenuFunctions)
local gasPumpGui = gameMenus:WaitForChild("Gas Pump")
local instantButton = gasPumpGui:WaitForChild("BuyFrame"):WaitForChild("Instant")

local maxFuel = 0
local pump = nil

FE.FuelPump.OnClientEvent:Connect(function(...)
    local args = {...}
    maxFuel = args[2]
    pump = args[5]
end)

local instantButtonClickHandler = getconnections(instantButton.MouseButton1Down)[1].Function

hookfunction(instantButtonClickHandler, function()
    local buyGasResult = FE.BuyGas:InvokeServer(maxFuel, pump, false); -- <-- exploit here
	if buyGasResult == "Good" then
		getrenv()._G.CloseMenu("Small", gasPumpGui);
		LocalPlayer.Character.Humanoid.WalkSpeed = 16;
		return;
	end;
	if buyGasResult ~= "Gamepass" then
		menuFunctions.ShowMessage("Error", (tostring(buyGasResult)));
		return;
	end;
end)

