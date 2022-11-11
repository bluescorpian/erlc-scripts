-- Decompiled with the Synapse X Luau decompiler.

local u1 = game:GetService("TweenService"):Create(game:GetService("Lighting").CameraEffect, TweenInfo.new(0.2, Enum.EasingStyle.Linear, Enum.EasingDirection.Out, 0, true), {
	Brightness = 0.4
});
game:GetService("ReplicatedStorage").FE.TrafficCamera.OnClientEvent:Connect(function(p1, p2)
	p1 = p1.Camera;
	p1:WaitForChild("Effects", 2);
	if p1:FindFirstChild("Effects") then
		p1.Effects.Sound:Play();
		p1.Effects.SpotLight.Enabled = true;
		u1:Play();
		spawn(function()
			wait(0.3);
			p1.Effects.SpotLight.Enabled = false;
		end);
	end;
	if p2 then
		_G.PushNotification("Yellow", "You will become wanted if you continue traffic violations.");
	end;
end);
