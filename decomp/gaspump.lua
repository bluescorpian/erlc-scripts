-- Decompiled with the Synapse X Luau decompiler.

local FE = game:GetService("ReplicatedStorage"):WaitForChild("FE");
local LocalPlayer = game:GetService("Players").LocalPlayer;
local scriptParent = script.Parent;
local l__BuyFrame__4 = scriptParent.BuyFrame;
local l__MarketplaceService__5 = game:GetService("MarketplaceService");
local u1 = Color3.fromRGB(170, 170, 170);
local bal = 0;
local fPrice = 0;
local cFuel = 0;
local cFuel2 = 0;
local maxF = 0;
local u7 = 0;
local menuFunctions = require(scriptParent.Parent.MenuFunctions);
local u9 = false;
local u10 = false;
local l__RunService__11 = game:GetService("RunService");
local l__ImageColor3__12 = l__BuyFrame__4.Purchase.ImageColor3;
local l__ImageColor3__13 = l__BuyFrame__4.Cancel.ImageColor3;
l__BuyFrame__4.Purchase.MouseEnter:Connect(function()
	if u7 > 0 then
		l__BuyFrame__4.Purchase.ImageColor3 = Color3.fromRGB(0, 124, 0);
	end;
end);
l__BuyFrame__4.Purchase.MouseLeave:Connect(function()
	if u7 > 0 then
		l__BuyFrame__4.Purchase.ImageColor3 = l__ImageColor3__12;
	end;
end);
l__BuyFrame__4.Cancel.MouseEnter:Connect(function()
	if u7 > 0 then
		l__BuyFrame__4.Cancel.ImageColor3 = Color3.fromRGB(136, 0, 0);
	end;
end);
l__BuyFrame__4.Cancel.MouseLeave:Connect(function()
	if u7 > 0 then
		l__BuyFrame__4.Cancel.ImageColor3 = l__ImageColor3__13;
	end;
end);
local u14 = nil;
local function showGui(currentFuel, maxFuel, balance, fuelPrice)
	scriptParent.ThankYou.Visible = false;
	l__BuyFrame__4.Visible = true;
	local v6 = math.floor(currentFuel * 100);
	local v7 = "";
	if v6 % 100 == 0 then
		v7 = ".00";
	elseif v6 % 10 == 0 then
		v7 = "0";
	end;
	l__BuyFrame__4.CurrentText.Text = tostring(v6 / 100) .. v7;
	local v8 = math.floor(maxFuel * 100);
	local v9 = "";
	if v8 % 100 == 0 then
		v9 = ".00";
	elseif v8 % 10 == 0 then
		v9 = "0";
	end;
	l__BuyFrame__4.CapacityText.Text = tostring(v8 / 100) .. v9;
	local v10 = math.floor(fuelPrice * 100);
	local v11 = "";
	if v10 % 100 == 0 then
		v11 = ".00";
	elseif v10 % 10 == 0 then
		v11 = "0";
	end;
	l__BuyFrame__4.PriceText.Text = tostring(v10 / 100) .. v11;
	scriptParent.CurrentFuelGuage.Percent.Size = UDim2.new(currentFuel / maxFuel, 0, 1, 0);
	l__BuyFrame__4.CurrencyText.Text = "You currently have: $" .. _G.AddCommas(balance);
	l__BuyFrame__4.Pump.PriceText.Text = "0";
	l__BuyFrame__4.Pump.Title.Text = "Click & hold to pump gas";
	l__BuyFrame__4.Purchase.ImageColor3 = u1;
	l__BuyFrame__4.Cancel.ImageColor3 = u1;
	bal = balance;
	fPrice = fuelPrice;
	cFuel = currentFuel;
	cFuel2 = currentFuel;
	maxF = maxFuel;
	u7 = 0;
	l__BuyFrame__4.Instant.PriceText.Text = math.ceil((maxF - cFuel) * fPrice);
end;
FE.FuelPump.OnClientEvent:Connect(function(currentFuel, maxFuel, balance, fuelPrice, p9)
	_G.OpenMenu("Small", scriptParent);
	u14 = p9;
	showGui(currentFuel, maxFuel, balance, fuelPrice);
end);
scriptParent.Close.MouseButton1Down:Connect(function()
	_G.CloseMenu("Small", scriptParent);
	LocalPlayer.Character.Humanoid.WalkSpeed = 16;
end);
l__BuyFrame__4.Cancel.MouseButton1Down:Connect(function()
	if l__BuyFrame__4.Cancel.ImageColor3 == u1 then
		return;
	end;
	_G.CloseMenu("Small", scriptParent);
	LocalPlayer.Character.Humanoid.WalkSpeed = 16;
end);
local function u16()
	l__BuyFrame__4.Pump.Title.Text = "Release to stop";
	while u10 == true and u10 do
		l__RunService__11.Heartbeat:Wait();
		local v12 = math.min(maxF, cFuel + 0.01);
		if v12 == maxF then
			break;
		end;
		local v13 = math.ceil((v12 - cFuel2) * fPrice);
		if bal < v13 then
			break;
		end;
		u7 = v13;
		cFuel = v12;
		l__BuyFrame__4.Pump.PriceText.Text = u7;
		local v14 = math.floor(cFuel * 100);
		local v15 = "";
		if v14 % 100 == 0 then
			v15 = ".00";
		elseif v14 % 10 == 0 then
			v15 = "0";
		end;
		l__BuyFrame__4.CurrentText.Text = tostring(v14 / 100) .. v15;
		scriptParent.CurrentFuelGuage.Percent.Size = UDim2.new(cFuel / maxF, 0, 1, 0);
		l__BuyFrame__4.Purchase.ImageColor3 = l__ImageColor3__12;
		l__BuyFrame__4.Cancel.ImageColor3 = l__ImageColor3__13;	
	end;
end;
scriptParent.BuyFrame.Pump.MouseButton1Down:Connect(function()
	scriptParent.BuyFrame.Pump.ImageColor3 = Color3.fromRGB(54, 54, 54);
	if u10 then
		return;
	end;
	u10 = true;
	u16();
end);
scriptParent.BuyFrame.Pump.MouseLeave:Connect(function()
	scriptParent.BuyFrame.Pump.ImageColor3 = Color3.fromRGB(66, 66, 66);
	u10 = false;
	l__BuyFrame__4.Pump.Title.Text = "Click & hold to pump gas";
end);
scriptParent.BuyFrame.Pump.MouseButton1Up:Connect(function()
	scriptParent.BuyFrame.Pump.ImageColor3 = Color3.fromRGB(66, 66, 66);
	u10 = false;
	l__BuyFrame__4.Pump.Title.Text = "Click & hold to pump gas";
end);
scriptParent.BuyFrame.Purchase.MouseButton1Down:Connect(function()
	if l__BuyFrame__4.Purchase.ImageColor3 == u1 then
		return;
	end;
	local v16 = FE.BuyGas:InvokeServer(cFuel, u14);
	if v16 == "Good" then
		spawn(function()
			u9 = true;
			wait(1.3);
			u9 = false;
		end);
		_G.CloseMenu("Small", scriptParent);
		LocalPlayer.Character.Humanoid.WalkSpeed = 16;
		return;
	end;
	if v16 == "No car" then
		menuFunctions.ShowMessage("Error", "No car found");
		return;
	end;
	if v16 == "Distance" then
		menuFunctions.ShowMessage("Error", "Vehicle is too far away");
		return;
	end;
	if v16 == "Currency" then
		menuFunctions.ShowMessage("Error", "Not enough money");
		menuFunctions.PromtBuyCash(u7);
		return;
	end;
	menuFunctions.ShowMessage("Error", (tostring(v16)));
end);
scriptParent.BuyFrame.Instant.MouseButton1Down:Connect(function()
	local response = FE.BuyGas:InvokeServer(maxF, u14, true);
	if response == "Good" then
		-- ????
		spawn(function()
			u9 = true;
			wait(1.3);
			u9 = false;
		end);
		_G.CloseMenu("Small", scriptParent);
		LocalPlayer.Character.Humanoid.WalkSpeed = 16;
		return;
	end;
	if response ~= "Gamepass" then
		menuFunctions.ShowMessage("Error", (tostring(response)));
		return;
	end;
	spawn(function()
		u9 = true;
		wait(1.3);
		u9 = false;
	end);
	l__MarketplaceService__5:PromptGamePassPurchase(game.Players.LocalPlayer, 27482897);
end);
