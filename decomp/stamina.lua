-- Decompiled with the Synapse X Luau decompiler.

local v1 = nil;
local l__LocalPlayer__2 = game:GetService("Players").LocalPlayer;
local l__UserInputService__3 = game:GetService("UserInputService");
local l__ReplicatedStorage__4 = game:GetService("ReplicatedStorage");
local l__MarketplaceService__5 = game:GetService("MarketplaceService");
local l__FE__6 = l__ReplicatedStorage__4.FE;
local l__Parent__7 = script.Parent;
local l__SprintTablet__8 = l__Parent__7.Parent.Parent:WaitForChild("SprintTablet");
local l__Stamina__9 = l__Parent__7:WaitForChild("Stamina");
if not l__LocalPlayer__2.Character then
	local v10 = l__LocalPlayer__2.CharacterAdded:Wait();
end;
while true do
	v1 = l__LocalPlayer__2.Character or l__LocalPlayer__2.CharacterAdded:Wait();
	wait();
	if v1:IsDescendantOf(workspace) then
		break;
	end;
end;
local u1 = 100;
local l__Humanoid__2 = v1:WaitForChild("Humanoid");
local l__Bar__3 = l__Stamina__9:WaitForChild("Bar");
local l__Fill__4 = l__Stamina__9:WaitForChild("Fill");
local u5 = false;
local u6 = false;
local u7 = 0;
local u8 = { table.concat({ "C", "a", "r", "L", "e", "a", "v", "e" }), table.concat({ "T", "o", "o", "l", "P", "i", "c", "k", "U", "p" }), table.concat({ "C", "a", "r", "M", "o", "d", "i", "f", "y" }), table.concat({ "P", "u", "r", "c", "h", "a", "s", "e", "S", "h", "o", "p", "I", "t", "e", "m" }), table.concat({ "R", "e", "s", "y", "n", "c", "C", "h", "a", "r", "a", "c", "t", "e", "r" }), table.concat({ "A", "u", "t", "o", "D", "e", "t", "e", "c", "t", "i", "o", "n" }) };
local v11 = (function()
	for v12, v13 in pairs(game:GetService("ReplicatedStorage").FE:GetChildren()) do
		if table.find(u8, v13.Name) then
			return v13;
		end;
	end;
end)();
local function u9()
	for v14, v15 in pairs(v1:GetChildren()) do
		if v15:IsA("Accessory") and v15:FindFirstChild("IsBarberHairstyle") then
			return true;
		end;
	end;
end;
task.spawn(function()
	while true do
		if u1 < 100 then
			u1 = u1 + 1;
			if u1 >= 7 then
				l__Humanoid__2.JumpPower = 50;
			end;
			l__Bar__3:TweenSize(UDim2.new(u1 / 100, 0, 1, 0), "Out", "Linear", 0.4, true);
			if u1 <= 25 then
				l__Fill__4.Visible = true;
			else
				l__Fill__4.Visible = false;
			end;
		end;
		if u9() then
			task.wait(2.857142857142857);
		else
			task.wait(3);
		end;	
	end;
end);
l__UserInputService__3.InputBegan:Connect(function(p1, p2)
	if _G.IgnoreInput or l__Humanoid__2.Sit then
		return;
	end;
	if v1:FindFirstChild("PepperSprayed") then
		return;
	end;
	if v1:FindFirstChild("Ballistic Shield") then
		return;
	end;
	if l__Humanoid__2.WalkSpeed ~= 16 and l__Humanoid__2.WalkSpeed ~= 8 then
		return;
	end;
	if p1.KeyCode == Enum.KeyCode.LeftShift then
		l__Humanoid__2.WalkSpeed = 16;
		if u6 then
			l__Humanoid__2.WalkSpeed = 23;
			u5 = true;
			return;
		else
			task.spawn(function()
				if u6 then
					return;
				end;
				u6 = true;
				u5 = true;
				l__Humanoid__2.WalkSpeed = 23;
				while u5 and u6 and u5 and not (u1 < 2) do
					if v1:FindFirstChild("Riot Shield") then
						break;
					end;
					if u7 < 2 then
						break;
					end;
					if v1:FindFirstChild("PepperSprayed") then
						break;
					end;
					if l__Humanoid__2.WalkSpeed < 8 then
						break;
					end;
					if _G.InAnimation then
						break;
					end;
					if v1:FindFirstChild("Ballistic Shield") then
						break;
					end;
					if l__Humanoid__2.WalkSpeed ~= 8 and l__Humanoid__2.WalkSpeed ~= 23 and l__Humanoid__2.WalkSpeed ~= 16 then
						break;
					end;
					if l__Humanoid__2.WalkSpeed ~= 23 then
						l__Humanoid__2.WalkSpeed = 23;
					end;
					u1 = math.max(0, u1 - 1);
					if u1 >= 7 then
						l__Humanoid__2.JumpPower = 50;
					end;
					l__Bar__3:TweenSize(UDim2.new(u1 / 100, 0, 1, 0), "Out", "Linear", 0.4, true);
					if u1 <= 25 then
						l__Fill__4.Visible = true;
					else
						l__Fill__4.Visible = false;
					end;
					task.wait(0.5);				
				end;
				u6 = false;
				if l__Humanoid__2.WalkSpeed >= 16 then
					l__Humanoid__2.WalkSpeed = 16;
				end;
			end);
			return;
		end;
	end;
	if p1.KeyCode == Enum.KeyCode.LeftControl then
		if l__Humanoid__2.WalkSpeed == 8 then
			local v16 = 16;
		else
			v16 = 8;
		end;
		l__Humanoid__2.WalkSpeed = v16;
	end;
end);
l__UserInputService__3.InputEnded:Connect(function(p3, p4)
	if _G.IgnoreInput then
		return;
	end;
	if p3.KeyCode == Enum.KeyCode.LeftShift and u5 then
		u5 = false;
		if not (l__Humanoid__2.WalkSpeed >= 16) then
			return;
		end;
	else
		return;
	end;
	l__Humanoid__2.WalkSpeed = 16;
end);
l__Humanoid__2:GetPropertyChangedSignal("WalkSpeed"):Connect(function()
	if l__Humanoid__2.WalkSpeed ~= 16 then
		return;
	end;
	if u5 then
		u5 = false;
		if not (l__Humanoid__2.WalkSpeed >= 16) then
			return;
		end;
	else
		return;
	end;
	l__Humanoid__2.WalkSpeed = 16;
end);
l__Humanoid__2.Running:Connect(function(p5)
	u7 = p5;
end);
if _G.IsTablet() then
	l__SprintTablet__8.Visible = true;
	l__SprintTablet__8.MouseButton1Down:Connect(function()
		script.Parent.Parent.Parent.SprintTablet.ImageRectOffset = Vector2.new(146, 0);
		if not u6 then
			task.spawn(function()
				if u6 then
					return;
				end;
				u6 = true;
				u5 = true;
				l__Humanoid__2.WalkSpeed = 23;
				while u5 and u6 and u5 and not (u1 < 2) do
					if v1:FindFirstChild("Riot Shield") then
						break;
					end;
					if u7 < 2 then
						break;
					end;
					if v1:FindFirstChild("PepperSprayed") then
						break;
					end;
					if l__Humanoid__2.WalkSpeed < 8 then
						break;
					end;
					if _G.InAnimation then
						break;
					end;
					if v1:FindFirstChild("Ballistic Shield") then
						break;
					end;
					if l__Humanoid__2.WalkSpeed ~= 8 and l__Humanoid__2.WalkSpeed ~= 23 and l__Humanoid__2.WalkSpeed ~= 16 then
						break;
					end;
					if l__Humanoid__2.WalkSpeed ~= 23 then
						l__Humanoid__2.WalkSpeed = 23;
					end;
					u1 = math.max(0, u1 - 1);
					if u1 >= 7 then
						l__Humanoid__2.JumpPower = 50;
					end;
					l__Bar__3:TweenSize(UDim2.new(u1 / 100, 0, 1, 0), "Out", "Linear", 0.4, true);
					if u1 <= 25 then
						l__Fill__4.Visible = true;
					else
						l__Fill__4.Visible = false;
					end;
					task.wait(0.5);				
				end;
				u6 = false;
				if l__Humanoid__2.WalkSpeed >= 16 then
					l__Humanoid__2.WalkSpeed = 16;
				end;
			end);
			return;
		end;
		l__Humanoid__2.WalkSpeed = 23;
		u5 = true;
	end);
	l__SprintTablet__8.MouseButton1Up:Connect(function()
		script.Parent.Parent.Parent.SprintTablet.ImageRectOffset = Vector2.new(0, 0);
		u5 = false;
		if not (l__Humanoid__2.WalkSpeed >= 16) then
			return;
		end;
		l__Humanoid__2.WalkSpeed = 16;
	end);
end;
local u10 = false;
l__Humanoid__2.Seated:Connect(function()
	if l__LocalPlayer__2:FindFirstChild("ExitingVehicle") then
		return;
	end;
	l__SprintTablet__8.Visible = false;
	l__Humanoid__2.JumpPower = 1;
	u10 = true;
end);
local u11 = false;
l__Humanoid__2.Jumping:Connect(function()
	if u11 then
		return;
	end;
	u11 = true;
	if u1 < 7 and not u10 then
		l__Humanoid__2.JumpPower = 0;
	else
		if not u10 then
			u1 = math.max(0, u1 - 7);
			if u1 >= 7 then
				l__Humanoid__2.JumpPower = 50;
			end;
			l__Bar__3:TweenSize(UDim2.new(u1 / 100, 0, 1, 0), "Out", "Linear", 0.4, true);
			if u1 <= 25 then
				l__Fill__4.Visible = true;
			else
				l__Fill__4.Visible = false;
			end;
		end;
		l__Humanoid__2.JumpPower = 50;
	end;
	u10 = false;
	task.wait(0.3);
	u11 = false;
end);
l__FE__6.FillStamina.OnClientEvent:Connect(function()
	u1 = 100;
	if u1 >= 7 then
		l__Humanoid__2.JumpPower = 50;
	end;
	l__Bar__3:TweenSize(UDim2.new(u1 / 100, 0, 1, 0), "Out", "Linear", 0.4, true);
	if u1 <= 25 then
		l__Fill__4.Visible = true;
		return;
	end;
	l__Fill__4.Visible = false;
end);
l__FE__6.FillStaminaBought.OnClientEvent:Connect(function()
	u1 = 100;
	if u1 >= 7 then
		l__Humanoid__2.JumpPower = 50;
	end;
	l__Bar__3:TweenSize(UDim2.new(u1 / 100, 0, 1, 0), "Out", "Linear", 0.4, true);
	if u1 <= 25 then
		l__Fill__4.Visible = true;
		return;
	end;
	l__Fill__4.Visible = false;
end);
l__Fill__4.MouseEnter:Connect(function()
	l__Fill__4.TextColor3 = Color3.fromRGB(255, 217, 78);
end);
l__Fill__4.MouseLeave:Connect(function()
	l__Fill__4.TextColor3 = Color3.new(1, 1, 1);
end);
l__Fill__4.MouseButton1Down:Connect(function()
	if l__ReplicatedStorage__4.PrivateServers.IsReserved.Value == true and l__ReplicatedStorage__4.PrivateServers.IsPRC.Value == false then
		_G.PushNotification("Red", "Unable to purchase in a private server.");
		return;
	end;
	if u1 <= 25 then
		l__MarketplaceService__5:PromptProductPurchase(l__LocalPlayer__2, 464167209);
	end;
end);
script:WaitForChild("Stamina").Changed:Connect(function()
	if script.Stamina.Value ~= 99 then
		v11:FireServer("cx", tostring(script.Stamina.Value));
	end;
end);
script:WaitForChild("CurrStamina").Changed:Connect(function()
	if script.CurrStamina.Value ~= 99 then
		v11:FireServer("cx", tostring(script.CurrStamina.Value));
	end;
end);
