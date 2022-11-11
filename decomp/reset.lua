-- Decompiled with the Synapse X Luau decompiler.

local u1 = false;
local l__LocalPlayer__2 = game.Players.LocalPlayer;
local u3 = nil;
function _G.ResetCharacterCountdown()
	u1 = false;
	if not l__LocalPlayer__2.Character then
		local v1 = l__LocalPlayer__2.CharacterAdded:Wait();
	end;
	game:GetService("StarterGui"):SetCore("ResetButtonCallback", u3);
end;
u3 = Instance.new("BindableEvent");
u3.Event:connect(function()
	_G.SaveBackpackLoadout();
	game.ReplicatedStorage.FE.ResetCharacter:FireServer();
end);
local u4 = nil;
l__LocalPlayer__2.CharacterAdded:Connect(function()
	u1 = false;
	u4 = l__LocalPlayer__2.Character;
end);
game.ReplicatedStorage.FE.ResetCharacter.OnClientEvent:Connect(function()
	_G.ResetCharacterCountdown();
end);
wait(1);
u4 = l__LocalPlayer__2.Character or l__LocalPlayer__2.CharacterAdded:Wait();
wait(3);
local v2 = false;
while not v2 do
	v2 = pcall(function()
		game:GetService("StarterGui"):SetCore("ResetButtonCallback", u3);
	end);
	if v2 then
		break;
	end;
	wait(1);
end;
