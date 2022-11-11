-- Decompiled with the Synapse X Luau decompiler.

local l__Parent__1 = script.Parent;
local l__LocalPlayer__2 = game:GetService("Players").LocalPlayer;
local l__ReplicatedStorage__3 = game:GetService("ReplicatedStorage");
local l__FE__4 = l__ReplicatedStorage__3.FE;
local v5 = require(l__ReplicatedStorage__3.Modules.WantedInfo);
local l__Players__6 = game:GetService("Players");
local l__LocalPlayer__1 = l__Players__6.LocalPlayer;
local u2 = {};
local u3 = false;
local u4 = nil;
l__Parent__1.Equipped:connect(function()
	Equip = true;
	u4 = script.CiteGui:Clone();
	u4.Parent = l__LocalPlayer__1.PlayerGui.GameGui;
	spawn(function()
		for v7, v8 in pairs(l__Players__6:GetPlayers()) do
			pcall(function()
				if v8 ~= l__LocalPlayer__1 and v8.Character and v8.TeamColor == BrickColor.new("Fossil") then
					local v9 = Instance.new("Attachment");
					v9.Name = "InteractionAttachment";
					local v10 = Instance.new("StringValue");
					v10.Name = "Purpose";
					v10.Value = "Citation";
					v10.Parent = v9;
					local v11 = Instance.new("ObjectValue");
					v11.Name = "Suspect";
					v11.Value = v8;
					v11.Parent = v9;
					v9.Parent = v8.Character.HumanoidRootPart;
					table.insert(u2, v9);
					_G.AddInteraction(v9);
				end;
			end);
		end;
	end);
end);
local function u5()
	for v12, v13 in pairs(u2) do
		_G.RemoveInteraction(v13);
		table.remove(u2, v12);
	end;
end;
l__Parent__1.Unequipped:Connect(function()
	Equip = false;
	u4:Destroy();
	u5();
end);
