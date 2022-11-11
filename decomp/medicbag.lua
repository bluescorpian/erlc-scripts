-- Decompiled with the Synapse X Luau decompiler.

local l__Players__1 = game:GetService("Players");
local l__LocalPlayer__2 = l__Players__1.LocalPlayer;
local l__Parent__3 = script.Parent;
if game.PlaceId == 5914275584 then
	script:WaitForChild("HoldAnim").AnimationId = "rbxassetid://9351456122";
elseif game.PlaceId == 6158369151 then
	script:WaitForChild("HoldAnim").AnimationId = "rbxassetid://9379974223";
else
	script:WaitForChild("HoldAnim").AnimationId = "rbxassetid://9379976340";
end;
local u1 = false;
local u2 = nil;
local u3 = {};
local l__PlaceMedicBag__4 = game.ReplicatedStorage.Tools.PlaceMedicBag;
local u5 = (l__LocalPlayer__2.Character and l__LocalPlayer__2.Character.Parent and l__LocalPlayer__2.Character or l__LocalPlayer__2.CharacterAdded:Wait()):WaitForChild("Humanoid"):WaitForChild("Animator"):LoadAnimation(script:WaitForChild("HoldAnim"));
local u6 = false;
local l__GameGui__7 = l__LocalPlayer__2:WaitForChild("PlayerGui"):WaitForChild("GameGui");
local u8 = {};
local l__UserInputService__9 = game:GetService("UserInputService");
local l__CurrentCamera__10 = workspace.CurrentCamera;
local u11 = nil;
local l__mouse__12 = l__LocalPlayer__2:GetMouse();
local u13 = false;
l__Parent__3.Equipped:Connect(function()
	local l__Character__4 = l__LocalPlayer__2.Character;
	if l__Character__4.Humanoid.Sit then
		wait();
		l__Character__4.Humanoid:UnequipTools();
		return;
	end;
	u5:Play();
	spawn(function()
		for v5, v6 in pairs(l__Players__1:GetPlayers()) do
			pcall(function()
				if v6 ~= l__LocalPlayer__2 and v6.Character and v6.Character.Humanoid.Health < 100 then
					local v7 = Instance.new("Attachment");
					v7.Name = "InteractionAttachment";
					local v8 = Instance.new("StringValue");
					v8.Name = "Purpose";
					v8.Value = "Heal";
					v8.Parent = v7;
					local v9 = Instance.new("ObjectValue");
					v9.Name = "Suspect";
					v9.Value = v6;
					v9.Parent = v7;
					v7.Parent = v6.Character.HumanoidRootPart;
					table.insert(u3, v7);
					_G.AddInteraction(v7);
				end;
			end);
		end;
	end);
	u6 = true;
	u2 = script.HealGui:Clone();
	if _G.IsTablet() then
		u2.ToolHint.Text = "Approach a player to heal them. Tap to place a medic bag.";
	else
		u2.ToolHint.Text = "Approach a player to heal them. Click to place a medic bag. Hold R to rotate.";
	end;
	u2.Parent = l__GameGui__7;
	if _G.IsTablet() then
		table.insert(u8, l__UserInputService__9.TouchTapInWorld:Connect(function(p1, p2)
			if not u6 then
				return;
			end;
			if p2 then
				return;
			end;
			local v10 = l__CurrentCamera__10:ViewportPointToRay(p1.X, p1.Y);
			local v11, v12 = game.Workspace:FindPartOnRay((Ray.new(v10.Origin, v10.Direction * 30)));
			if not v11 then
				return;
			end;
			local v13 = l__PlaceMedicBag__4:InvokeServer(CFrame.new(v12 + Vector3.new(0, game.ReplicatedStorage.Tools[script.Parent.Name].Size.Y / 2, 0)) * (l__Parent__3.Handle.CFrame - l__Parent__3.Handle.CFrame.Position));
			if v13 ~= "Success" then
				local u14 = tostring(v13);
				spawn(function()
					if u1 == false then
						u1 = true;
						u2.ToolHint.Text = u14;
						u2.ToolHint.TextColor3 = Color3.new(1, 0.24313725490196078, 0.24313725490196078);
						wait(1);
						u1 = false;
						if u2 then
							if _G.IsTablet() then
								u2.ToolHint.Text = "Approach a player to heal them. Tap to place a medic bag.";
							else
								u2.ToolHint.Text = "Approach a player to heal them. Click to place a medic bag. Hold R to rotate.";
							end;
							u2.ToolHint.TextColor3 = Color3.new(1, 1, 1);
						end;
					end;
				end);
			end;
		end));
		return;
	end;
	u11 = game.ReplicatedStorage.Tools[script.Parent.Name]:Clone();
	u11.Transparency = 1;
	u11.TextureID = "";
	u11.Color = _G.GoldColor;
	u11.CanCollide = false;
	u11.Anchored = true;
	l__mouse__12.TargetFilter = u11;
	table.insert(u8, l__mouse__12.Move:Connect(function()
		local l__p__14 = l__mouse__12.Hit.p;
		if u6 and (l__p__14 - l__Character__4.HumanoidRootPart.Position).magnitude < 13 and l__mouse__12.Hit and l__p__14 and l__p__14 ~= Vector3.new() then
			u11.Position = l__p__14 + Vector3.new(0, u11.Size.Y / 2, 0);
			u11.Transparency = 0.5;
			u11.Parent = workspace;
			return;
		end;
		if u6 then
			u11.Transparency = 1;
		end;
	end));
	table.insert(u8, l__UserInputService__9.InputBegan:Connect(function(p3, p4)
		if p3.UserInputType == Enum.UserInputType.Keyboard and p3.KeyCode == Enum.KeyCode.R and not _G.IgnoreInput then
			u13 = true;
			spawn(function()
				while u13 and u11 do
					u11.CFrame = u11.CFrame * CFrame.Angles(0, 0.03490658503988659, 0);
					wait();				
				end;
			end);
		end;
	end));
	table.insert(u8, l__UserInputService__9.InputEnded:Connect(function(p5, p6)
		if p5.UserInputType == Enum.UserInputType.Keyboard and p5.KeyCode == Enum.KeyCode.R and not _G.IgnoreInput then
			u13 = false;
		end;
	end));
	table.insert(u8, l__mouse__12.Button1Down:Connect(function()
		if not u6 then
			return;
		end;
		if u11.Transparency ~= 1 then
			local v15 = l__PlaceMedicBag__4:InvokeServer(u11.CFrame);
			if v15 ~= "Success" then
				local u15 = tostring(v15);
				spawn(function()
					if u1 == false then
						u1 = true;
						u2.ToolHint.Text = u15;
						u2.ToolHint.TextColor3 = Color3.new(1, 0.24313725490196078, 0.24313725490196078);
						wait(1);
						u1 = false;
						if u2 then
							if _G.IsTablet() then
								u2.ToolHint.Text = "Approach a player to heal them. Tap to place a medic bag.";
							else
								u2.ToolHint.Text = "Approach a player to heal them. Click to place a medic bag. Hold R to rotate.";
							end;
							u2.ToolHint.TextColor3 = Color3.new(1, 1, 1);
						end;
					end;
				end);
			end;
		end;
	end));
end);
local function u16()
	for v16, v17 in pairs(u3) do
		_G.RemoveInteraction(v17);
	end;
	u3 = {};
end;
l__Parent__3.Unequipped:Connect(function()
	u5:Stop();
	for v18, v19 in pairs(u8) do
		local u17 = v19;
		pcall(function()
			u17:Disconnect();
			u17 = nil;
		end);
	end;
	u8 = {};
	if u11 then
		u11:Destroy();
	end;
	if u2 then
		u2:Destroy();
	end;
	u16();
	u11 = nil;
	u6 = false;
	u2 = nil;
end);
