-- Decompiled with the Synapse X Luau decompiler.

local CitationGui = script.Parent;
local v2 = require(CitationGui.Parent.MenuFunctions);
local reasonName = nil;
local fineMax = 0;
local CitationBoard = CitationGui.CitationBoard.Content;
for _, reason in pairs(CitationBoard.CitationFrame.Reasons:GetChildren()) do
	if reason:IsA("TextButton") then
		reason.MouseButton1Down:Connect(function()
			if reason.Box.Checked.Visible == true then
				reasonName = nil;
				fineMax = 0;
				CitationBoard.CitationFrame.AmountText.PlaceholderText = "[Select Reason]";
				reason.Box.Checked.Visible = false;
				return;
			end;
			for v5, reason2 in pairs(CitationBoard.CitationFrame.Reasons:GetChildren()) do
				if reason2:IsA("TextButton") then
					reasonName = nil;
					fineMax = 0;
					CitationBoard.CitationFrame.AmountText.PlaceholderText = "[Select Reason]";
					reason2.Box.Checked.Visible = false;
				end;
			end;
			reasonName = reason.Name;
			fineMax = reason.Max.Value;
			CitationBoard.CitationFrame.AmountText.PlaceholderText = "(0 - " .. tostring(fineMax) .. ")";
			reason.Box.Checked.Visible = true;
		end);
	end;
end;
local u4 = nil;
local FE = game:GetService("ReplicatedStorage"):WaitForChild("FE");
local u6 = nil;
local function showWarning()
	CitationBoard.NoType.Visible = false;
	CitationBoard.CannotFine.Visible = false;
	CitationBoard.Submit.Visible = true;
	u4 = "Warning";
	local WarningButton = CitationBoard.WarningButton;
	WarningButton.BackgroundColor3 = Color3.new(0, 0, 0);
	WarningButton.TextColor3 = _G.GoldColor;
	WarningButton.Font = "SourceSansBold";
	local l__FineButton__8 = CitationBoard.FineButton;
	l__FineButton__8.BackgroundColor3 = Color3.new(1, 1, 1);
	l__FineButton__8.TextColor3 = Color3.new(0, 0, 0);
	l__FineButton__8.Font = "SourceSansSemibold";
	CitationBoard.CitationFrame.Visible = false;
	CitationBoard.WarningFrame.Visible = true;
	CitationBoard.Mutual.Visible = true;
	CitationBoard.WarningFrame.ReasonText.Visible = false;
	CitationBoard.WarningFrame.NoReason.Visible = false;
	if _G.GetRank(true)[2] < 3 then
		CitationBoard.WarningFrame.NoReason.Visible = true;
		return;
	end;
	CitationBoard.WarningFrame.ReasonText.Visible = true;
end;
CitationBoard.WarningButton.MouseButton1Down:Connect(function()
	showWarning();
end);
local function showFine()
	for _, reason in pairs(CitationBoard.CitationFrame.Reasons:GetChildren()) do
		if reason:IsA("TextButton") then
			reasonName = nil;
			fineMax = 0;
			CitationBoard.CitationFrame.AmountText.PlaceholderText = "[Select Reason]";
			reason.Box.Checked.Visible = false;
		end;
	end;
	local l__WarningButton__11 = CitationBoard.WarningButton;
	l__WarningButton__11.BackgroundColor3 = Color3.new(1, 1, 1);
	l__WarningButton__11.TextColor3 = Color3.new(0, 0, 0);
	l__WarningButton__11.Font = "SourceSansSemibold";
	local l__FineButton__12 = CitationBoard.FineButton;
	l__FineButton__12.BackgroundColor3 = Color3.new(0, 0, 0);
	l__FineButton__12.TextColor3 = _G.GoldColor;
	l__FineButton__12.Font = "SourceSansBold";
	CitationBoard.NoType.Visible = false;
	CitationBoard.CitationFrame.AmountText.Text = "";
	CitationBoard.CitationFrame.Reasons["Running Red Light"].Visible = false;
	CitationBoard.CitationFrame.Reasons.Speeding.Visible = false;
	CitationBoard.CitationFrame.Reasons["Running Red Light"].Max.Value = 0;
	CitationBoard.CitationFrame.Reasons.Speeding.Max.Value = 0;
	fineMax = 0;
	local trafficCrimes = FE.GetTrafficCrimes:InvokeServer(u6);
	if #trafficCrimes == 0 then
		CitationBoard.Mutual.Visible = false;
		CitationBoard.CannotFine.Visible = true;
		CitationBoard.CitationFrame.Visible = false;
		CitationBoard.WarningFrame.Visible = false;
		CitationBoard.Submit.Visible = false;
		return;
	end;
	for v14, traficCrime in pairs(trafficCrimes) do
		CitationBoard.CitationFrame.Reasons[traficCrime[3]].Visible = true;
		CitationBoard.CitationFrame.Reasons[traficCrime[3]].Max.Value = CitationBoard.CitationFrame.Reasons[traficCrime[3]].Max.Value + math.floor(traficCrime[2] * 5);
		CitationBoard.CitationFrame.Reasons[traficCrime[3]].Max.Value = math.min(CitationBoard.CitationFrame.Reasons[traficCrime[3]].Max.Value, 200);
	end;
	CitationBoard.CannotFine.Visible = false;
	u4 = "Fine";
	local l__WarningButton__16 = CitationBoard.WarningButton;
	l__WarningButton__16.BackgroundColor3 = Color3.new(1, 1, 1);
	l__WarningButton__16.TextColor3 = Color3.new(0, 0, 0);
	l__WarningButton__16.Font = "SourceSansSemibold";
	local l__FineButton__17 = CitationBoard.FineButton;
	l__FineButton__17.BackgroundColor3 = Color3.new(0, 0, 0);
	l__FineButton__17.TextColor3 = _G.GoldColor;
	l__FineButton__17.Font = "SourceSansBold";
	CitationBoard.CitationFrame.Visible = true;
	CitationBoard.WarningFrame.Visible = false;
	CitationBoard.CitationFrame.AmountText.PlaceholderText = "[Select Reason]";
	CitationBoard.Mutual.Visible = true;
	CitationBoard.Submit.Visible = true;
end;
CitationBoard.FineButton.MouseButton1Down:Connect(function()
	showFine();
end);
CitationBoard.Submit.MouseEnter:Connect(function()
	CitationBoard.Submit.TextColor3 = _G.GoldColor;
	CitationBoard.Submit.TextStrokeTransparency = 0;
end);
CitationBoard.Submit.MouseLeave:Connect(function()
	CitationBoard.Submit.TextColor3 = Color3.new(0, 0, 0);
	CitationBoard.Submit.TextStrokeTransparency = 1;
end);
local u9 = false;
CitationBoard.Submit.MouseButton1Down:Connect(function()
	if u9 then
		return;
	end;
	u9 = true;
	if u4 == "Fine" and (fineMax == 0 or not reasonName) then
		v2.ShowMessage("Error", "No reason selected");
		return;
	end;
	if u4 == "Warning" then
		reasonName = CitationBoard.WarningFrame.ReasonText.Text;
	end;
	local v18 = FE.GiveCitation:InvokeServer(u6, u4, reasonName, (tonumber(CitationBoard.CitationFrame.AmountText.Text)));
	if u4 == "Warning" then
		reasonName = nil;
	end;
	if v18 == "Good" then
		_G.CloseMenu("Small", CitationGui);
		_G.PushNotification("Green", "Citation Successful");
	elseif v18 == "Violator" then
		v2.ShowMessage("Error", "Violator not found");
	elseif v18 == "Amount" then
		v2.ShowMessage("Error", "Invalid fine amount");
	elseif v18 == "Reason" then
		v2.ShowMessage("Error", "Invalid reason");
	elseif v18 == "Distance" then
		v2.ShowMessage("Error", "Too far from violator");
	else
		v2.ShowMessage("Error");
	end;
	u9 = false;
end);
local guiOpening = false;
CitationGui.Close.MouseButton1Down:Connect(function()
	if guiOpening == false then
		_G.CloseMenu("Small", CitationGui);
	end;
end);
local function prepareCitationGui()
	if game.Players.LocalPlayer.TeamColor == BrickColor.new("Linen") then
		local v19 = "LIBERTY COUNTY SHERIFF'S OFFICE";
	else
		v19 = "RIVER CITY POLICE DEPARTMENT";
	end;
	CitationBoard.Title1.Text = v19;
	CitationBoard.Mutual.Visible = false;
	CitationBoard.Mutual.LocationText.Text = "";
	CitationBoard.WarningFrame.ReasonText.Text = "";
	CitationBoard.Mutual.VehicleText.Text = "";
	CitationBoard.ViolatorName.Text = u6.Name;
	CitationBoard.CitationFrame.Visible = false;
	CitationBoard.WarningFrame.Visible = false;
	CitationBoard.NoType.Visible = true;
	CitationBoard.CannotFine.Visible = false;
	CitationBoard.Submit.Visible = false;
	local l__WarningButton__20 = CitationBoard.WarningButton;
	l__WarningButton__20.BackgroundColor3 = Color3.new(1, 1, 1);
	l__WarningButton__20.TextColor3 = Color3.new(0, 0, 0);
	l__WarningButton__20.Font = "SourceSansSemibold";
	local l__FineButton__21 = CitationBoard.FineButton;
	l__FineButton__21.BackgroundColor3 = Color3.new(1, 1, 1);
	l__FineButton__21.TextColor3 = Color3.new(0, 0, 0);
	l__FineButton__21.Font = "SourceSansSemibold";
end;
CitationGui.OpenEvent.Event:Connect(function(p1)
	guiOpening = true;
	u6 = p1;
	prepareCitationGui();
	_G.OpenMenu("Small", CitationGui, true);
	guiOpening = false;
end);
