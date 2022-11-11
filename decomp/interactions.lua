-- Decompiled with the Synapse X Luau decompiler.

local l__ReplicatedStorage__1 = game:GetService("ReplicatedStorage");
local l__Lighting__2 = game:GetService("Lighting");
local l__Players__3 = game:GetService("Players");
local l__LocalPlayer__4 = l__Players__3.LocalPlayer;
local l__PlayerGui__5 = l__LocalPlayer__4:WaitForChild("PlayerGui");
while true do
	wait();
	if l__LocalPlayer__4.Character then
		break;
	end;
end;
local l__Teams__1 = game:GetService("Teams");
local l__FE__2 = l__ReplicatedStorage__1.FE;
local u3 = false;
local v6 = {};
local v7 = {
	Distance = 7, 
	GetText = function(p1)
		local v8 = nil;
		if p1.Parent:FindFirstChild("Owner") then
			v8 = p1.Parent.Owner.Value;
		elseif p1.Parent.Parent:FindFirstChild("Owner") then
			v8 = p1.Parent.Parent.Owner.Value;
		end;
		if v8 ~= l__LocalPlayer__4 and not l__LocalPlayer__4:FindFirstChild("IsMod") then
			return;
		end;
		return "Pick Up";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
function v7.Execute(p2)
	local v9 = nil;
	if p2.Parent:FindFirstChild("Owner") then
		v9 = p2.Parent.Owner.Value;
	elseif p2.Parent.Parent:FindFirstChild("Owner") then
		v9 = p2.Parent.Parent.Owner.Value;
	end;
	if v9 == l__LocalPlayer__4 or l__LocalPlayer__4:FindFirstChild("IsMod") then
		l__ReplicatedStorage__1.Tools.PickUpObj:FireServer(p2.Parent);
	end;
end;
v6.PickUpObj = v7;
local v10 = {
	Distance = 7, 
	GetText = function(p3)
		if l__LocalPlayer__4.Team ~= game.Teams.Police and l__LocalPlayer__4.Team ~= game.Teams.Sheriff then
			return;
		end;
		return "Fill Ammo";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
local l__Character__4 = l__LocalPlayer__4.Character;
function v10.Execute(p4)
	if l__LocalPlayer__4.Team == game.Teams.Police or l__LocalPlayer__4.Team == game.Teams.Sheriff then
		l__Character__4.Humanoid:UnequipTools();
		wait();
		l__FE__2.LEOFillAmmo:FireServer(p4.Parent);
	end;
end;
v6.LEOAmmo = v10;
v6.Locker = {
	Distance = 5, 
	GetText = function(p5)
		if l__LocalPlayer__4.Team ~= l__Teams__1[p5.Parent.Parent.Parent:WaitForChild("Team").Value] then
			return;
		end;
		return "Change Loadout";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p6)
		if l__LocalPlayer__4.Team == l__Teams__1[p6.Parent.Parent.Parent:WaitForChild("Team").Value] then
			l__LocalPlayer__4.PlayerGui.GameMenus.Loadout.OpenEvent:Fire();
		end;
	end
};
v6.WeaponLocker = {
	Distance = 7, 
	GetText = function(p7)
		if l__LocalPlayer__4.Team ~= l__Teams__1[p7.Parent.Parent:WaitForChild("Team").Value] then
			return;
		end;
		return "Access Armory";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p8)
		if l__LocalPlayer__4.Team == l__Teams__1[p8.Parent.Parent:WaitForChild("Team").Value] then
			l__LocalPlayer__4.PlayerGui.GameMenus.WeaponLoadout.OpenEvent:Fire();
		end;
	end
};
v6.GunStore = {
	Distance = 14, 
	GetText = function(p9)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian or l__LocalPlayer__4:FindFirstChild("Job") and l__LocalPlayer__4.Job.Value ~= "Bank Worker" then
			return;
		end;
		return "Shop Weapons";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p10)
		if l__LocalPlayer__4.Team == game.Teams.Civilian and (not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value == "Bank Worker") then
			l__LocalPlayer__4.PlayerGui.GameMenus.WeaponStore.OpenEvent:Fire();
		end;
	end
};
v6.HardwareStore = {
	Distance = 14, 
	GetText = function(p11)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		return "Shop Tools";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p12)
		if l__LocalPlayer__4.Team == game.Teams.Civilian then
			l__LocalPlayer__4.PlayerGui.GameMenus.HardwareStore.OpenEvent:Fire();
		end;
	end
};
local v11 = {
	Distance = 7
};
local function u5(p13)
	local v12 = false;
	if p13 == "Fire_Spawners" then
		if l__LocalPlayer__4.Team == l__Teams__1.Fire then
			return "Fire";
		end;
	elseif p13 == "Police_Spawners" then
		if l__LocalPlayer__4.Team == l__Teams__1.Police then
			return "Police";
		end;
	elseif p13 == "Sheriff_Spawners" then
		if l__LocalPlayer__4.Team == l__Teams__1.Sheriff then
			return "Sheriff";
		end;
	elseif p13 == "Civilian_Spawners" then
		if l__LocalPlayer__4.Team == l__Teams__1.Civilian then
			return "Civilian";
		end;
	elseif p13 == "DOT_Spawners" and l__LocalPlayer__4.Team == l__Teams__1.DOT then
		v12 = "DOT";
	end;
	return v12;
end;
function v11.GetText(p14)
	if not u5(p14.Parent.Parent.Parent.Name) then
		local v13 = false;
		if l__LocalPlayer__4:FindFirstChild("Job") then
			local l__Value__14 = l__LocalPlayer__4.Job.Value;
			if l__Value__14:gsub(" ", "") .. "_Spawners" == p14.Parent.Parent.Parent.Name then
				v13 = l__Value__14;
			end;
		end;
		if v13 and not l__Character__4:FindFirstChild("SpawningCar") then
			return "Spawn Vehicle";
		end;
	elseif not l__Character__4:FindFirstChild("SpawningCar") then
		return "Spawn Vehicle";
	end;
end;
v11.KeyCode = Enum.KeyCode.E;
v11.HoldTime = 0;
v11.MultiAction = false;
function v11.Execute(p15)
	if not u5(p15.Parent.Parent.Parent.Name) then
		local v15 = false;
		if l__LocalPlayer__4:FindFirstChild("Job") then
			local l__Value__16 = l__LocalPlayer__4.Job.Value;
			if l__Value__16:gsub(" ", "") .. "_Spawners" == p15.Parent.Parent.Parent.Name then
				v15 = l__Value__16;
			end;
		end;
		if v15 and not l__Character__4:FindFirstChild("SpawningCar") then
			local v17 = Instance.new("StringValue");
			v17.Name = "NoInteraction";
			v17.Parent = l__LocalPlayer__4;
			_G.InMenu = "VehicleMenuHolder";
			local v18 = u5(p15.Parent.Parent.Parent.Name);
			if not v18 then
				local v19 = false;
				if l__LocalPlayer__4:FindFirstChild("Job") then
					local l__Value__20 = l__LocalPlayer__4.Job.Value;
					if l__Value__20:gsub(" ", "") .. "_Spawners" == p15.Parent.Parent.Parent.Name then
						v19 = l__Value__20;
					end;
				end;
				v18 = v19;
			end;
			l__ReplicatedStorage__1.FE.GetSpawnVehicleUI:FireServer(v18, p15);
			spawn(function()
				wait(2);
				v17:Destroy();
				if _G.InMenu == "VehicleMenuHolder" then
					_G.InMenu = false;
				end;
			end);
		end;
	elseif not l__Character__4:FindFirstChild("SpawningCar") then
		v17 = Instance.new("StringValue");
		v17.Name = "NoInteraction";
		v17.Parent = l__LocalPlayer__4;
		_G.InMenu = "VehicleMenuHolder";
		v18 = u5(p15.Parent.Parent.Parent.Name);
		if not v18 then
			v19 = false;
			if l__LocalPlayer__4:FindFirstChild("Job") then
				l__Value__20 = l__LocalPlayer__4.Job.Value;
				if l__Value__20:gsub(" ", "") .. "_Spawners" == p15.Parent.Parent.Parent.Name then
					v19 = l__Value__20;
				end;
			end;
			v18 = v19;
		end;
		l__ReplicatedStorage__1.FE.GetSpawnVehicleUI:FireServer(v18, p15);
		spawn(function()
			wait(2);
			v17:Destroy();
			if _G.InMenu == "VehicleMenuHolder" then
				_G.InMenu = false;
			end;
		end);
	end;
end;
v6.SpawnVehicle = v11;
v6.ATM = {
	Distance = 5, 
	GetText = function(p16)
		return "Use ATM";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p17)
		local v21 = Instance.new("StringValue");
		v21.Name = "NoInteraction";
		v21.Parent = l__LocalPlayer__4;
		_G.InMenu = "ATMHolder";
		l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 0;
		spawn(function()
			wait(1);
			if l__FE__2.CheckWalkSpeed:InvokeServer() ~= 0 then
				l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 16;
			end;
		end);
		l__ReplicatedStorage__1.FE.StartATM:FireServer(p17.Parent.Parent);
		spawn(function()
			wait(2);
			v21:Destroy();
			if _G.InMenu == "ATMHolder" then
				_G.InMenu = false;
			end;
		end);
	end
};
v6.FuelPump = {
	Distance = 5, 
	GetText = function(p18)
		if p18.Parent.Parent == workspace.TeamFuelPumps and l__LocalPlayer__4.Team ~= game.Teams.Fire and l__LocalPlayer__4.Team ~= game.Teams.DOT then
			return;
		end;
		return "Pump Fuel";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p19)
		local v22 = Instance.new("StringValue");
		v22.Name = "NoInteraction";
		v22.Parent = l__LocalPlayer__4;
		_G.InMenu = "FuelPumpHolder";
		l__ReplicatedStorage__1.FE.FuelPump:FireServer(p19.Parent);
		spawn(function()
			wait(2);
			v22:Destroy();
			if _G.InMenu == "FuelPumpHolder" then
				_G.InMenu = false;
			end;
		end);
	end
};
v6.TeamFuelPump = {
	Distance = 10, 
	GetText = function(p20)
		if p20.Parent.Parent == workspace.TeamFuelPumps and l__LocalPlayer__4.Team ~= game.Teams.Fire and l__LocalPlayer__4.Team ~= game.Teams.DOT then
			return;
		end;
		return "Pump Fuel";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p21)
		local v23 = Instance.new("StringValue");
		v23.Name = "NoInteraction";
		v23.Parent = l__LocalPlayer__4;
		_G.InMenu = "TeamFuelPumpHolder";
		l__ReplicatedStorage__1.FE.FuelPump:FireServer(p21.Parent);
		spawn(function()
			wait(2);
			v23:Destroy();
			if _G.InMenu == "TeamFuelPumpHolder" then
				_G.InMenu = false;
			end;
		end);
	end
};
v6.PayOffBounty = {
	Distance = 6, 
	GetText = function(p22)
		if not (require(game.ReplicatedStorage.Modules.WantedInfo).ArrestableLevel <= _G.WantedLevel) then
			return;
		end;
		return "Pay Off Bounty";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0.5, 
	MultiAction = false, 
	Execute = function(p23)
		if require(game.ReplicatedStorage.Modules.WantedInfo).ArrestableLevel <= _G.WantedLevel then
			l__LocalPlayer__4.PlayerGui.GameMenus["Pay Bounty"].OpenEvent:Fire();
		end;
	end
};
v6.FoodTruckPanel = {
	Distance = 3, 
	GetText = function(p24)
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Fast Food Restaurant Worker" then
			return;
		end;
		return "SWITCH";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p25)
		p25.Parent.RemoteEvent:FireServer();
	end
};
v6.MobileCommandTruckPanel = {
	Distance = 3, 
	GetText = function(p26)
		if p26.Parent.Parent.Parent.Parent.Control_Values.Owner.Value ~= l__LocalPlayer__4.Name then
			return;
		end;
		return "SWITCH";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p27)
		p27.Parent.RemoteEvent:FireServer();
	end
};
local v24 = {
	Distance = 6
};
function v24.GetText(p28)
	local l__Parent__25 = p28.Parent;
	if not l__Parent__25:IsA("VehicleSeat") then
		if u3 then
			return;
		else
			u3 = true;
			print("LOG: " .. tostring("Not a seat"));
			spawn(function()
				wait(1);
				u3 = false;
			end);
			return;
		end;
	end;
	if l__Character__4:FindFirstChild("VehicleSeatTag") then
		return;
	end;
	if l__Character__4:FindFirstChild("Stretcher") then
		return;
	end;
	if l__Character__4:FindFirstChild("Backboard") then
		return;
	end;
	if l__Parent__25:FindFirstChild("Disabled") then
		return;
	end;
	local l__Parent__26 = l__Parent__25.Parent;
	local v27 = l__Parent__26:FindFirstChild("Control_Values") and l__Parent__26.Control_Values.Owner.Value or nil;
	local v28 = l__Parent__25.Occupant;
	local v29 = nil;
	if l__Parent__26:FindFirstChild("BeingTowed") then
		return;
	end;
	if v28 then
		v29 = l__Players__3:GetPlayerFromCharacter(v28.Parent);
		if v29 == l__LocalPlayer__4 then
			v28 = nil;
			v29 = nil;
		end;
	end;
	local v30 = true;
	if l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
		v30 = l__LocalPlayer__4.Team == l__Teams__1.Police;
	end;
	if v30 and (l__LocalPlayer__4.Character:FindFirstChild("Handcuffs") and v29 and v29:FindFirstChild("Is_Wanted") and not v29:FindFirstChild("Detained")) then
		return "Eject";
	end;
	if l__Parent__25.Name == "DriverSeat" then
		if v27 == l__LocalPlayer__4.Name then
			return "Enter Driver";
		end;
	elseif not v28 and not l__Parent__26:FindFirstChild("BeingTowed") and not l__Parent__26:FindFirstChild("InImpoundLot") then
		if l__Parent__26.Name == "Ladder" then
			return "Enter Ladder";
		else
			return "Enter Passenger";
		end;
	end;
	if not u3 then

	end;
end;
v24.KeyCode = Enum.KeyCode.E;
v24.HoldTime = 0;
v24.MultiAction = false;
function v24.Execute(p29)
	local l__Parent__31 = p29.Parent;
	if not l__Parent__31:IsA("VehicleSeat") then
		return;
	end;
	if l__Character__4:FindFirstChild("VehicleSeatTag") then
		return;
	end;
	if l__Character__4:FindFirstChild("Backboard") then
		return;
	end;
	if l__Parent__31:FindFirstChild("Disabled") then
		return;
	end;
	local l__Parent__32 = l__Parent__31.Parent;
	if l__Parent__32:FindFirstChild("BeingTowed") then
		return;
	end;
	local v33 = Instance.new("BoolValue");
	v33.Name = "NoInteraction";
	v33.Parent = l__LocalPlayer__4;
	game:GetService("Debris"):AddItem(v33, 2);
	local v34 = l__Parent__32:FindFirstChild("Control_Values") and l__Parent__32.Control_Values.Owner.Value or nil;
	local v35 = l__Parent__31.Occupant;
	local v36 = nil;
	if v35 then
		v36 = l__Players__3:GetPlayerFromCharacter(v35.Parent);
		if v36 == l__LocalPlayer__4 then
			v35 = nil;
			v36 = nil;
		end;
	end;
	local v37 = true;
	if l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
		v37 = l__LocalPlayer__4.Team == l__Teams__1.Police;
	end;
	if v37 and (l__LocalPlayer__4.Character:FindFirstChild("Handcuffs") and v36 and v36:FindFirstChild("Is_Wanted") and not v36:FindFirstChild("Detained")) then
		l__ReplicatedStorage__1.FE.Eject:FireServer(v36, l__Parent__32);
		return;
	end;
	if l__Parent__31.Name == "DriverSeat" then
		if v34 == l__LocalPlayer__4.Name then
			l__ReplicatedStorage__1.FE.VehicleSit:FireServer(p29.Parent);
			l__Character__4.Humanoid:UnequipTools();
			return;
		end;
	elseif not v35 and not l__Parent__32:FindFirstChild("BeingTowed") and not l__Parent__32:FindFirstChild("InImpoundLot") then
		l__ReplicatedStorage__1.FE.VehicleSit:FireServer(p29.Parent);
		l__Character__4.Humanoid:UnequipTools();
	end;
end;
v6.Seat = v24;
v6.Arrest = {
	Distance = 7, 
	GetText = function(p30)
		local v38 = l__Players__3:GetPlayerFromCharacter(p30.Parent.Parent);
		if not v38 or v38.Character:FindFirstChild("Downed") then
			return;
		end;
		if not l__LocalPlayer__4.Character:FindFirstChild("Handcuffs") then
			return;
		end;
		if not v38.Character:FindFirstChild("Head") then
			return;
		end;
		if not v38.Character.Head:FindFirstChild("OverheadGui") then
			return;
		end;
		if v38:FindFirstChild("In_Handcuffs") then
			return;
		end;
		if v38:FindFirstChild("Detained") then
			return;
		end;
		if v38.Character.Humanoid.SeatPart and v38.Character.Humanoid.SeatPart:IsA("VehicleSeat") then
			return;
		end;
		return "Arrest";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0.8, 
	MultiAction = false, 
	Execute = function(p31)
		_G.HandcuffSuspect(l__Players__3:GetPlayerFromCharacter(p31.Parent.Parent));
	end
};
v6.GrabDetain = {
	Distance = 8, 
	GetText = function(p32)
		local v39 = l__Players__3:GetPlayerFromCharacter(p32.Parent.Parent);
		if v39.Character:FindFirstChild("Downed") then
			return;
		end;
		if v39 and l__LocalPlayer__4.Character:FindFirstChild("Handcuffs") and (v39.Character.Humanoid.Sit == false or not v39.Character.Humanoid.SeatPart or (not (not v39.Character.Humanoid.SeatPart) and not v39.Character.Humanoid.SeatPart:IsA("VehicleSeat") or v39.Character.Humanoid.SeatPart and v39:FindFirstChild("Detained") and v39.Detained.Value == l__LocalPlayer__4.Name)) then
			return "Grab";
		end;
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0.8, 
	MultiAction = false, 
	Execute = function(p33)
		local v40 = l__Players__3:GetPlayerFromCharacter(p33.Parent.Parent);
		if v40.Character:FindFirstChild("Downed") then
			return;
		end;
		if v40 and l__LocalPlayer__4.Character:FindFirstChild("Handcuffs") and (v40.Character.Humanoid.Sit == false or not v40.Character.Humanoid.SeatPart or not (not v40.Character.Humanoid.SeatPart) and not v40.Character.Humanoid.SeatPart:IsA("VehicleSeat") or v40.Character.Humanoid.SeatPart and v40:FindFirstChild("Detained") and v40.Detained.Value == l__LocalPlayer__4.Name) then
			_G.HandcuffSuspect(l__Players__3:GetPlayerFromCharacter(p33.Parent.Parent));
		end;
	end
};
local v41 = {
	Distance = 7, 
	GetText = function(p34)
		local v42 = true;
		if p34.Parent.Occupant then
			return;
		end;
		for v43, v44 in pairs(game.Players:GetPlayers()) do
			if v44:FindFirstChild("In_Handcuffs") and v44.In_Handcuffs.Value == l__LocalPlayer__4.Name and not v44:FindFirstChild("Detainable") then
				v42 = false;
				break;
			end;
		end;
		if not v42 then
			return;
		end;
		return "Put In";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
local u6 = false;
function v41.Execute(p35)
	if p35.Parent.Occupant then
		return;
	end;
	if u6 then
		return;
	end;
	u6 = true;
	for v45, v46 in pairs(game.Players:GetPlayers()) do
		if v46:FindFirstChild("In_Handcuffs") and v46.In_Handcuffs.Value == l__LocalPlayer__4.Name and v46:FindFirstChild("Detainable") and game.ReplicatedStorage.FE.DetainSit:InvokeServer(v46, p35.Parent) then
			_G.ReleaseDetainSuspect(v46);
		end;
	end;
	_G.ClearDetainSitInteractions();
	u6 = false;
end;
v6.DetainSit = v41;
v6.TakedownLadder = {
	Distance = 7, 
	GetText = function(p36)
		if p36.Parent.Owner.Value ~= l__LocalPlayer__4 and not l__LocalPlayer__4:FindFirstChild("IsMod") then
			return;
		end;
		return "Take Down";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p37)
		local v47 = l__Players__3:GetPlayerFromCharacter(p37.Parent.Parent);
		if p37.Parent.Owner.Value == l__LocalPlayer__4 or l__LocalPlayer__4:FindFirstChild("IsMod") then
			l__ReplicatedStorage__1.Tools.TakedownLadder:FireServer(p37.Parent);
		end;
	end
};
v6.Citation = {
	Distance = 6, 
	GetText = function(p38)
		if not l__LocalPlayer__4.Character:FindFirstChild("Citation Book") then
			return;
		end;
		return "Cite";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p39)
		if l__LocalPlayer__4.Character:FindFirstChild("Citation Book") then
			l__Players__3.LocalPlayer.PlayerGui.GameMenus.Citation.OpenEvent:Fire(p39.Suspect.Value);
		end;
	end
};
local v48 = {
	Distance = 5, 
	GetText = function(p40)
		local l__Parent__49 = p40.Parent.Parent.Parent.Parent;
		local v50 = l__Character__4:FindFirstChildOfClass("Tool");
		if v50 and (v50.Name:match("Mail") and v50:FindFirstChild("HousePosition") and v50.HousePosition.Value == l__Parent__49.PrimaryPart.Position) then
			return "Deliver";
		end;
		if v50 and v50.Name == "Lockpick" and l__LocalPlayer__4.Team == l__Teams__1.Civilian and l__Parent__49.Config.Owner.Value ~= l__LocalPlayer__4 then
			return "Lockpick";
		end;
		if v50 and v50.Name == "Trick or Treat Bag" and l__Parent__49.Config.Owner.Value == nil then
			return "Ring";
		end;
		if not l__Parent__49.Config.Owner.Value or not l__Parent__49.Config.Locked.Value then
			return;
		end;
		return "Interact";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
local l__ClientBinds__7 = l__ReplicatedStorage__1.ClientBinds;
function v48.Execute(p41)
	local v51 = l__Character__4:FindFirstChildOfClass("Tool");
	local l__Parent__52 = p41.Parent.Parent.Parent.Parent;
	if v51 and (v51.Name:match("Mail") and v51:FindFirstChild("HousePosition") and v51.HousePosition.Value == l__Parent__52.PrimaryPart.Position) then
		local v53 = l__FE__2.DeliverPackage:InvokeServer(p41, v51);
		if v53 ~= "Success" then
			_G.PushNotification("Red", "Error: " .. tostring(v53));
		end;
		return;
	end;
	if v51 and v51.Name == "Lockpick" and l__LocalPlayer__4.Team == l__Teams__1.Civilian and l__Parent__52.Config.Owner.Value ~= l__LocalPlayer__4 then
		local v54 = l__ClientBinds__7.GetRobberyDifficulty:Invoke("HouseLock");
		if v54 then
			l__ReplicatedStorage__1.Houses.Lockpick:FireServer(p41, v54);
		end;
	end;
	if v51 and v51.Name == "Trick or Treat Bag" and l__Parent__52.Config.Owner.Value == nil then
		l__ReplicatedStorage__1.Halloween.TrickOrTreat:FireServer(p41);
	end;
	if l__Parent__52.Config.Owner.Value and l__Parent__52.Config.Locked.Value then
		l__ReplicatedStorage__1.Houses.ExitHouse:FireServer(l__Parent__52);
	end;
end;
v6.HouseDoor = v48;
v6.DrillJewelryCase = {
	Distance = 5, 
	GetText = function(p42)
		if not l__Character__4:FindFirstChild("Drill") then
			return;
		end;
		return "Drill Case";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p43)
		if l__Character__4:FindFirstChild("Drill") then
			l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 0;
			spawn(function()
				wait(1);
				if l__FE__2.CheckWalkSpeed:InvokeServer() ~= 0 then
					l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 16;
				end;
			end);
			local v55 = l__ClientBinds__7.GetRobberyDifficulty:Invoke("Jewelry");
			if v55 then
				local v56 = game.ReplicatedStorage.FE.RobJewelry:InvokeServer(p43.Parent, v55);
				if v56 == "PlrCooldown" then
					_G.PushNotification("Red", "Slow down! You must wait a couple of seconds before trying another case.");
					l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 16;
					return;
				end;
				if v56 == "CaseCooldown" then
					_G.PushNotification("Red", "This case has been robbed recently! Try again later!");
					l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 16;
					return;
				end;
				if v56 == "Distance" then
					_G.PushNotification("Red", "Too far away!");
					l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 16;
					return;
				end;
				if v56 == "Drill" then
					_G.PushNotification("Red", "You need a drill! Purchase from the tool store.");
					l__LocalPlayer__4.Character.Humanoid.WalkSpeed = 16;
					return;
				end;
				if v56 == "Team" then
					_G.PushNotification("Red", "You must be on the civilian team!");
				end;
			end;
		end;
	end
};
local v57 = {
	Distance = 5, 
	GetText = function(p44)
		return "Buy Home";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
function v57.Execute(p45)
	l__PlayerGui__5.GameMenus.RentHouse.OpenEvent:Fire("Buy", p45.Parent.Parent.Parent);
end;
v6.BuyHouse = v57;
v6.HouseGarage = {
	Distance = 5, 
	GetText = function(p46)
		if p46.Parent.Parent.Parent.Parent.Config.Owner.Value ~= l__LocalPlayer__4 then
			return;
		end;
		return "Spawn Car";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p47)
		if l__LocalPlayer__4.TeamColor ~= BrickColor.new("Fossil") then
			_G.PushNotification("Red", "You cannot use this spawn while on a team.");
			return;
		end;
		l__ReplicatedStorage__1.Houses.GarageSpawner:FireServer(p47);
	end
};
v6.Heal = {
	Distance = 6, 
	GetText = function(p48)
		if p48.Suspect.Value.Character.Humanoid.Health == p48.Suspect.Value.Character.Humanoid.MaxHealth or not l__Character__4:FindFirstChild("Medic Bag") then
			return;
		end;
		return "Heal";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 5, 
	MultiAction = false, 
	Execute = function(p49)
		if p49.Suspect.Value.Character.Humanoid.Health ~= p49.Suspect.Value.Character.Humanoid.MaxHealth and l__Character__4:FindFirstChild("Medic Bag") then
			l__ReplicatedStorage__1.Tools.EMSHeal:FireServer(p49.Suspect.Value);
			wait();
			if p49.Suspect.Value.Character.Humanoid.Health == p49.Suspect.Value.Character.Humanoid.MaxHealth then
				_G.RemoveInteraction(p49);
			end;
		end;
	end
};
v6.Tow = {
	Distance = 6, 
	GetText = function(p50)
		if not (not l__PlayerGui__5:WaitForChild("GameGui"):WaitForChild("VehicleGui"):FindFirstChild("Tow_Control")) or not (not l__Character__4:FindFirstChild("Tow")) or p50.Parent.Parent.Parent.Control_Values.Owner.Value ~= l__LocalPlayer__4.Name then
			return;
		end;
		return "Control Bed";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p51)
		if l__LocalPlayer__4.TeamColor == BrickColor.new("Br. yellowish orange") and not l__PlayerGui__5:WaitForChild("GameGui"):WaitForChild("VehicleGui"):FindFirstChild("Tow_Control") and not l__Character__4:FindFirstChild("Tow") and p51.Parent.Parent.Parent.Control_Values.Owner.Value == l__LocalPlayer__4.Name then
			_G.GiveCarGui(l__ReplicatedStorage__1:WaitForChild("UIs").Tow_Control);
		end;
	end
};
v6.FixTrafficLight = {
	Distance = 6, 
	GetText = function(p52)
		if l__LocalPlayer__4.Team ~= game.Teams.DOT or not p52.Parent.Parent.Parent:FindFirstChild("Broken") or p52.Parent.Parent.Parent:FindFirstChild("Broken").Value ~= true then
			return;
		end;
		return "Repair Light";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 1, 
	MultiAction = false, 
	Execute = function(p53)
		if l__LocalPlayer__4.Team == game.Teams.DOT and p53.Parent.Parent.Parent:FindFirstChild("Broken") and p53.Parent.Parent.Parent:FindFirstChild("Broken").Value == true then
			l__PlayerGui__5.GameMenus.DOT.OpenEvent:Fire(p53.Parent.Parent.Parent, "FixTrafficLight");
		end;
	end
};
v6.ChangeTire = {
	Distance = 6, 
	GetText = function(p54)
		if l__LocalPlayer__4.Team == game.Teams.DOT and p54.Parent.CanCollide == false and (not p54.Parent.Parent.Parent:FindFirstChild("BeingTowed") and l__Character__4:FindFirstChild("Change Tire")) then
			return "Change Tire";
		end;
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p55)
		if l__LocalPlayer__4.Team == game.Teams.DOT and p55.Parent.CanCollide == false and not p55.Parent.Parent.Parent:FindFirstChild("BeingTowed") and l__Character__4:FindFirstChild("Change Tire") then
			l__PlayerGui__5.GameMenus.DOT.OpenEvent:Fire(p55.Parent, "ChangeTire");
		end;
	end
};
v6.ChangeLight = {
	Distance = 6, 
	GetText = function(p56)
		if l__LocalPlayer__4.Team ~= game.Teams.DOT or not p56.Parent.Parent:FindFirstChild("Broken") then
			return;
		end;
		return "Change Light";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p57)
		if l__LocalPlayer__4.Team == game.Teams.DOT and p57.Parent.Parent:FindFirstChild("Broken") then
			l__PlayerGui__5.GameMenus.DOT.OpenEvent:Fire(p57.Parent, "ChangeLight");
		end;
	end
};
v6.UnimpoundLot = {
	Distance = 6, 
	GetText = function(p58)
		return "Un-Impound Vehicle";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p59)
		l__PlayerGui__5.GameMenus.UnimpoundVehicle.OpenEvent:Fire(p59.Parent);
	end
};
v6.Trunk = {
	Distance = 6, 
	GetText = function(p60)
		local v58 = game.Players:FindFirstChild(p60.Parent.Parent.Parent:WaitForChild("Control_Values").Owner.Value);
		if not v58 then
			return;
		end;
		if v58 == l__LocalPlayer__4 then
			return "Access " .. p60.Name;
		end;
		if v58.Team == game.Teams.Civilian and ((l__LocalPlayer__4.Team == game.Teams.Sheriff or l__LocalPlayer__4.Team == game.Teams.Police) and v58:FindFirstChild("Is_Wanted")) then
			return "Search " .. p60.Name;
		end;
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p61)
		local v59 = game.Players:FindFirstChild(p61.Parent.Parent.Parent:WaitForChild("Control_Values").Owner.Value);
		if not v59 then
			return;
		end;
		if v59 == l__LocalPlayer__4 then
			l__PlayerGui__5.GameMenus.Trunk.OpenEvent:Fire(p61.Name);
			return;
		end;
		if v59.Team == game.Teams.Civilian and ((l__LocalPlayer__4.Team == game.Teams.Sheriff or l__LocalPlayer__4.Team == game.Teams.Police) and v59:FindFirstChild("Is_Wanted")) then
			if l__PlayerGui__5.GameGui:FindFirstChild("TrunkSearch") then
				return;
			end;
			l__FE__2.SearchTrunk:FireServer(v59);
		end;
	end
};
local v60 = {
	Distance = 5
};
local u8 = false;
function v60.GetText(p62)
	if not u8 then
		local l__Value__61 = p62.Parent.StartingPlayer.Value;
		if not l__Value__61 then
			return;
		end;
		if l__Value__61 == l__LocalPlayer__4 or l__Value__61:FindFirstChild("Mafia") and l__LocalPlayer__4:FindFirstChild("Mafia") and l__Value__61.Mafia.Value == l__LocalPlayer__4.Mafia.Value then
			return "Steal";
		end;
	end;
end;
v60.KeyCode = Enum.KeyCode.E;
v60.HoldTime = 0;
v60.MultiAction = false;
function v60.Execute(p63)
	if u8 then
		return;
	end;
	u8 = true;
	spawn(function()
		wait(1);
		u8 = false;
	end);
	l__ReplicatedStorage__1.Houses.StealItem:FireServer(p63.Parent);
end;
v6.HouseRobbery_Steal = v60;
v6.HouseRobbery_Safe = {
	Distance = 5, 
	GetText = function(p64)
		if u8 == false then
			local l__Value__62 = p64.Parent.Parent.StartingPlayer.Value;
			if not l__Value__62 then
				return;
			end;
			if l__Value__62 == l__LocalPlayer__4 or l__Value__62:FindFirstChild("Mafia") and l__LocalPlayer__4:FindFirstChild("Mafia") and l__Value__62.Mafia.Value == l__LocalPlayer__4.Mafia.Value then
				return "Break In";
			end;
		end;
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p65)
		if u8 then
			return;
		end;
		u8 = true;
		l__Character__4.Humanoid:UnequipTools();
		spawn(function()
			wait(1);
			u8 = false;
		end);
		local v63 = l__ClientBinds__7.GetRobberyDifficulty:Invoke("HouseSafe");
		if v63 then
			l__ReplicatedStorage__1.Houses.BreakInSafe:FireServer(p65.Parent.Parent, v63);
		end;
	end
};
v6.EnterUnderground = {
	Distance = 7, 
	GetText = function(p66)
		return "ENTER";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p67)
		_G.InteractInterior(p67.Parent);
	end
};
v6.ExitUnderground = {
	Distance = 7, 
	GetText = function(p68)
		return "EXIT";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p69)
		_G.InteractInterior(p69.Parent);
	end
};
v6.JerryFill = {
	Distance = 15, 
	GetText = function(p70)
		if not l__Character__4:FindFirstChild("Gas Can") then
			return;
		end;
		return "ADD FUEL";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 1, 
	MultiAction = false, 
	Execute = function(p71)
		local v64 = l__FE__2.JerryFill:InvokeServer(p71.Parent.Parent.Parent);
		local u9 = false;
		local l__GasGui__10 = l__PlayerGui__5:WaitForChild("GameGui"):WaitForChild("GasGui");
		if v64 ~= "Success" then
			local u11 = tostring(v64);
			local u12 = "Error";
			spawn(function()
				if u9 == false and l__GasGui__10 then
					u9 = true;
					l__GasGui__10.ToolHint.Text = u11;
					l__GasGui__10.ToolHint.TextColor3 = u12 == "Error" and Color3.new(1, 0.24313725490196078, 0.24313725490196078) or Color3.new(0.24313725490196078, 1, 0.24313725490196078);
					wait(3);
					u9 = false;
					if not l__GasGui__10 then
						return;
					end;
					l__GasGui__10.ToolHint.Text = "Approach a vehicle to fill it with 2 gallons.";
					l__GasGui__10.ToolHint.TextColor3 = Color3.new(1, 1, 1);
				end;
			end);
		else
			local u13 = "Vehicle filled with 2 gallons!";
			local u14 = nil;
			spawn(function()
				if u9 == false and l__GasGui__10 then
					u9 = true;
					l__GasGui__10.ToolHint.Text = u13;
					l__GasGui__10.ToolHint.TextColor3 = u14 == "Error" and Color3.new(1, 0.24313725490196078, 0.24313725490196078) or Color3.new(0.24313725490196078, 1, 0.24313725490196078);
					wait(3);
					u9 = false;
					if not l__GasGui__10 then
						return;
					end;
					l__GasGui__10.ToolHint.Text = "Approach a vehicle to fill it with 2 gallons.";
					l__GasGui__10.ToolHint.TextColor3 = Color3.new(1, 1, 1);
				end;
			end);
		end;
		print(v64);
	end
};
v6.PutOnStretcher = {
	Distance = 10, 
	GetText = function(p72)
		local v65 = l__Character__4:FindFirstChild("Stretcher") or l__Character__4:FindFirstChild("Backboard");
		if not v65 or v65.Main.OccupantHumanoid.Value ~= nil then
			return;
		end;
		return "PUT ON";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p73)
		local v66 = l__Character__4:FindFirstChild("Stretcher") or l__Character__4:FindFirstChild("Backboard");
		if v66 and v66.Main.OccupantHumanoid.Value == nil then
			v66.Bindable:Fire(l__Players__3:GetPlayerFromCharacter(p73.Parent.Parent));
		end;
	end
};
v6.PutOnStretcherNPC = {
	Distance = 10, 
	GetText = function(p74)
		local l__Stretcher__67 = l__Character__4:FindFirstChild("Stretcher");
		if not l__Stretcher__67 or l__Stretcher__67.Main.OccupantHumanoid.Value ~= nil then
			return;
		end;
		return "PUT ON";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p75)
		local l__Stretcher__68 = l__Character__4:FindFirstChild("Stretcher");
		if l__Stretcher__68 and l__Stretcher__68.Main.OccupantHumanoid.Value == nil then
			l__Stretcher__68.Bindable:Fire(p75.Parent.Parent);
		end;
	end
};
v6.GrabStretcher = {
	Distance = 10, 
	GetText = function(p76)
		local v69 = nil;
		if p76.Parent:FindFirstChild("Owner") then
			v69 = p76.Parent.Owner.Value;
		elseif p76.Parent.Parent:FindFirstChild("Owner") then
			v69 = p76.Parent.Parent.Owner.Value;
		end;
		if v69 ~= l__LocalPlayer__4 and not l__LocalPlayer__4:FindFirstChild("IsMod") then
			return;
		end;
		return "GRAB STRETCHER";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p77)
		l__FE__2.Stretcher:InvokeServer("Grab", p77.Parent.Parent);
	end
};
v6.StretcherSit = {
	Distance = 14, 
	GetText = function(p78)
		if p78.Parent.Occupant then
			return;
		end;
		local v70 = l__Character__4:FindFirstChild("Stretcher") or l__Character__4:FindFirstChild("Backboard");
		if not v70 then
			return;
		end;
		if v70.Main.OccupantHumanoid.Value == nil then
			return;
		end;
		return "Put In";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p79)
		if p79.Parent.Occupant then
			return;
		end;
		local v71 = l__Character__4:FindFirstChild("Stretcher") or l__Character__4:FindFirstChild("Backboard");
		if not v71 then
			return;
		end;
		if v71.Main.OccupantHumanoid.Value == nil then
			return;
		end;
		l__FE__2.Stretcher:InvokeServer("PutInAmbulance", p79.Parent);
	end
};
v6.StretcherGet = {
	Distance = 14, 
	GetText = function(p80)
		if not p80.Parent.Occupant then
			return;
		end;
		local v72 = l__Character__4:FindFirstChild("Stretcher") or l__Character__4:FindFirstChild("Backboard");
		if not v72 then
			return;
		end;
		if v72.Main.OccupantHumanoid.Value ~= nil then
			return;
		end;
		return "Take Out";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p81)
		if not p81.Parent.Occupant then
			return;
		end;
		local v73 = l__Character__4:FindFirstChild("Stretcher") or l__Character__4:FindFirstChild("Backboard");
		if not v73 then
			return;
		end;
		if v73.Main.OccupantHumanoid.Value ~= nil then
			return;
		end;
		l__FE__2.Stretcher:InvokeServer("GetOutAmbulance", p81.Parent);
	end
};
v6.SWATHang = {
	Distance = 6, 
	GetText = function(p82)
		local v74 = true;
		if l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
			v74 = l__LocalPlayer__4.Team == l__Teams__1.Police;
		end;
		if not v74 or p82.Parent.Occupant.Value ~= "" then
			return;
		end;
		return "STEP ON";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p83)
		local v75 = true;
		if l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
			v75 = l__LocalPlayer__4.Team == l__Teams__1.Police;
		end;
		if v75 and p83.Parent.Occupant.Value == "" then
			if l__Character__4.Humanoid.Jump == true or l__Character__4.Humanoid:GetState() == Enum.HumanoidStateType.Jumping then
				return;
			end;
			l__FE__2.BearcatHang:FireServer("Hang", p83.Parent);
		end;
	end
};
v6.CarWash = {
	Distance = 10, 
	GetText = function(p84)
		return "CAR WASH";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.F, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p85)
		if l__LocalPlayer__4:FindFirstChild("Is_Wanted") then
			_G.PushNotification("Red", "Cannot use car wash while wanted!");
			return;
		end;
		l__FE__2.GetCarWash:FireServer();
	end
};
v6.StartJob = {
	Distance = 7, 
	GetText = function(p86)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		return "START JOB";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p87)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Is_Wanted") then
			_G.PushNotification("Red", "Cannot start job while wanted!");
			return;
		end;
		l__PlayerGui__5:WaitForChild("GameMenus").StartJob.OpenEvent:Fire(not l__LocalPlayer__4:FindFirstChild("Job"), p87.Parent.Parent);
	end
};
v6.PickUpPackage = {
	Distance = 10, 
	GetText = function(p88)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Postal Worker" then
			return;
		end;
		return "COLLECT MAIL";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 1, 
	MultiAction = false, 
	Execute = function(p89)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") and l__LocalPlayer__4.Job.Value == "Postal Worker" then
			local v76 = l__FE__2.PickUpPackages:InvokeServer(p89.Parent);
			if v76 ~= "Success" then
				_G.PushNotification("Red", "Error: " .. tostring(v76));
				return;
			end;
		else
			return;
		end;
		_G.PushNotification("Green", "Packages picked up!");
	end
};
v6.ChangeJobClothes = {
	Distance = 7, 
	GetText = function(p90)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= p90.Parent.Parent.Name then
			return;
		end;
		return "Change Clothes";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p91)
		if l__LocalPlayer__4.Team ~= game.Teams.Civilian then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") and l__LocalPlayer__4.Job.Value == p91.Parent.Parent.Name then
			l__FE__2.ChangeJobClothes:FireServer();
		end;
	end
};
v6.KeypadBankDoor = {
	Distance = 7, 
	GetText = function(p92)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if p92.Parent.CanCollide == false then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		return "USE KEYPAD";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p93)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if p93.Parent.CanCollide == false then
			return;
		end;
		l__ReplicatedStorage__1.Bank.UseDoorKeypad:FireServer();
	end
};
v6.LockpickBankDoor = {
	Distance = 7, 
	GetText = function(p94)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if p94.Parent.CanCollide == false then
			return;
		end;
		if not l__Character__4:FindFirstChild("Lockpick") then
			return;
		end;
		return "LOCKPICK";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p95)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if p95.Parent.CanCollide == false then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if not l__Character__4:FindFirstChild("Lockpick") then
			return;
		end;
		l__ReplicatedStorage__1.Bank.LockpickDoor:FireServer(p95.Parent.Name);
	end
};
v6.BlowBankVault = {
	Distance = 7, 
	GetText = function(p96)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if p96.Parent.CanCollide == false then
			return;
		end;
		if p96.Parent.Velocity.Magnitude * 0.6818181818181818 > 2 then
			return;
		end;
		return "PLANT EXPLOSIVES";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 4, 
	MultiAction = false, 
	Execute = function(p97)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if p97.Parent.CanCollide == false then
			return;
		end;
		l__ReplicatedStorage__1.Bank.PlantVaultExplosive:FireServer();
	end
};
v6.StealBankMoney = {
	Distance = 7, 
	GetText = function(p98)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if p98.Parent.Parent:FindFirstChild("Taken") then
			return;
		end;
		return "STEAL";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 5, 
	MultiAction = false, 
	Execute = function(p99)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if p99.Parent.Parent:FindFirstChild("Taken") then
			return;
		end;
		l__ReplicatedStorage__1.Bank.StealCash:FireServer(p99.Parent);
	end
};
v6.StealBankTruckMoney = {
	Distance = 4, 
	GetText = function(p100)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if not p100.Parent.Parent:FindFirstChild("Money bag") then
			return;
		end;
		if p100.Parent.Parent:FindFirstChild("Taken") then
			return;
		end;
		if l__LocalPlayer__4.Mafia.Value ~= p100.Parent.Parent.Parent.Parent.RobbingValues.RobbingMafia.Value then
			return;
		end;
		if p100.Parent.Parent.Parent.Parent.RobbingValues.CanStealMoney.Value == false then
			return;
		end;
		return "STEAL";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 5, 
	MultiAction = false, 
	Execute = function(p101)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if not p101.Parent.Parent:FindFirstChild("Money bag") then
			return;
		end;
		if p101.Parent.Parent:FindFirstChild("Taken") then
			return;
		end;
		if l__LocalPlayer__4.Mafia.Value ~= p101.Parent.Parent.Parent.Parent.RobbingValues.RobbingMafia.Value then
			return;
		end;
		if p101.Parent.Parent.Parent.Parent.RobbingValues.CanStealMoney.Value == false then
			return;
		end;
		l__ReplicatedStorage__1.Bank.StealTruckCash:FireServer(p101.Parent);
	end
};
v6.BlowBankTruckDoor = {
	Distance = 4, 
	GetText = function(p102)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if not p102.Parent.Parent.Parent:FindFirstChild("Rear Door") then
			return;
		end;
		if p102.Parent.Parent.Parent["Rear Door"]:FindFirstChild("Blown") then
			return;
		end;
		if p102.Parent.Parent.Parent.RobbingValues.RobbingMafia.Value ~= "" then
			return;
		end;
		if p102.Parent.Parent.Parent.RobbingValues.HasMoney.Value == false then
			return;
		end;
		return "PLANT EXPLOSIVE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 5, 
	MultiAction = false, 
	Execute = function(p103)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Mafia") then
			return;
		end;
		if not p103.Parent.Parent.Parent:FindFirstChild("Rear Door") then
			return;
		end;
		if p103.Parent.Parent.Parent["Rear Door"]:FindFirstChild("Blown") then
			return;
		end;
		if p103.Parent.Parent.Parent.RobbingValues.RobbingMafia.Value ~= "" then
			return;
		end;
		if p103.Parent.Parent.Parent.RobbingValues.HasMoney.Value == false then
			return;
		end;
		l__ReplicatedStorage__1.Bank.PlantTruckExplosive:FireServer();
	end
};
v6.ClaimGift = {
	Distance = 10, 
	GetText = function(p104)
		return "PICK UP GIFT";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p105)
		_G.PickUpGift(p105.Parent.Name, p105.Parent.Mesh.MeshId);
	end
};
v6.ClaimBadge = {
	Distance = 10, 
	GetText = function(p106)
		return "CLAIM BADGE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p107)
		_G.ClaimBadge(p107.Parent.Parent.Name);
	end
};
v6.ClaimRazor = {
	Distance = 10, 
	GetText = function(p108)
		return "CLAIM RAZOR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p109)
		_G.ClaimRazor(p109.Parent.Name);
	end
};
local v77 = {
	Distance = 10, 
	GetText = function(p110)
		return "SPEAK";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
local l__GameMenus__15 = l__PlayerGui__5:WaitForChild("GameMenus");
function v77.Execute(p111)
	l__GameMenus__15:WaitForChild("PhilipsHunt").OpenEvent:Fire();
end;
v6.ViewPhilipsHunt = v77;
v6.ClearDebris = {
	Distance = 10, 
	GetText = function(p112)
		if l__LocalPlayer__4.Team == l__Teams__1.DOT then
			return "CLEAR DEBRIS";
		end;
		if l__LocalPlayer__4.Team ~= l__Teams__1.Fire or not p112:IsDescendantOf(workspace.MajorServerCalls) then
			return;
		end;
		return "CLEAR DEBRIS";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p113)
		l__FE__2.ClearRoadDebris:FireServer(p113.Parent);
	end
};
v6.ClearTreeDebris = {
	Distance = 10, 
	GetText = function(p114)
		if l__LocalPlayer__4.Team ~= l__Teams__1.DOT and l__LocalPlayer__4.Team ~= l__Teams__1.Fire then
			return;
		end;
		if not l__LocalPlayer__4.Character or not l__LocalPlayer__4.Character:FindFirstChild("Heavy Chainsaw") then
			return;
		end;
		return "CLEAR TREE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 10, 
	MultiAction = false, 
	Execute = function(p115)
		l__FE__2.ClearTreeDebris:FireServer(p115.Parent.Parent);
	end
};
v6.AddToFoodTray = {
	Distance = 10, 
	GetText = function(p116)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__Character__4:FindFirstChild("Food Tray") then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Fast Food Restaurant Worker" then
			return;
		end;
		return "ADD " .. string.upper(p116.Parent.Name);
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p117)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__Character__4:FindFirstChild("Food Tray") then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") and l__LocalPlayer__4.Job.Value == "Fast Food Restaurant Worker" then
			local v78 = l__FE__2.FoodTray:InvokeServer("Add", p117.Parent);
			if v78 ~= "Success" then
				_G.PushNotification("Red", "Error: " .. tostring(v78));
				return;
			end;
		else
			return;
		end;
		_G.PushNotification("Green", "Item added!");
	end
};
v6.GetFoodTray = {
	Distance = 10, 
	GetText = function(p118)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Fast Food Restaurant Worker" then
			return;
		end;
		return "GET TRAY";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p119)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if l__LocalPlayer__4:FindFirstChild("Job") and l__LocalPlayer__4.Job.Value == "Fast Food Restaurant Worker" then
			local v79 = l__FE__2.FoodTray:InvokeServer("Get");
			if v79 ~= "Success" then
				_G.PushNotification("Red", "Error: " .. tostring(v79));
				return;
			end;
		else
			return;
		end;
		_G.PushNotification("Green", "Food tray received!");
	end
};
v6.GetPie = {
	Distance = 5, 
	GetText = function(p120)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Pie Stand Worker" then
			return;
		end;
		return "GET PIE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p121)
		local v80 = l__ReplicatedStorage__1.Halloween.Pie:InvokeServer("Get");
		if v80 == "Success" then
			_G.PushNotification("Green", "Pie received!");
			return;
		end;
		_G.PushNotification("Red", "Error: " .. tostring(v80));
	end
};
v6.HalloweenShop = {
	Distance = 10, 
	GetText = function(p122)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Civilian then
			return;
		end;
		return "SHOP";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p123)
		l__GameMenus__15.HalloweenStore.OpenEvent:Fire();
	end
};
local v81 = {
	Distance = 10, 
	GetText = function(p124)
		if not l__Character__4:FindFirstChild("Food Tray") then
			return;
		end;
		return "DISPOSE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false
};
local l__GameGui__16 = l__PlayerGui__5:WaitForChild("GameGui");
function v81.Execute(p125)
	local v82 = nil;
	if not l__Character__4:FindFirstChild("Food Tray") then
		return;
	end;
	local v83 = l__FE__2.FoodTray:InvokeServer("Discard");
	if v83 == "Success" then
		_G.PushNotification("Green", "Tray disposed of!");
		v82 = l__GameGui__16:FindFirstChild("TrayHint");
		if not v82 then
			return;
		end;
	else
		_G.PushNotification("Red", "Error: " .. tostring(v83));
		return;
	end;
	v82:Destroy();
end;
v6.ClearFoodTray = v81;
v6.StartBankTruckJob = {
	Distance = 20, 
	GetText = function(p126)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Bank Worker" then
			return;
		end;
		return "START DELIVERY";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.F, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p127)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Bank Worker" then
			return;
		end;
		l__ReplicatedStorage__1.Bank.StartTruckDelivery:FireServer();
	end
};
v6.StartFuelDelivery = {
	Distance = 20, 
	GetText = function(p128)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Gas Station Worker" then
			return;
		end;
		return "START DELIVERY";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.F, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p129)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Gas Station Worker" then
			return;
		end;
		l__ReplicatedStorage__1.FuelDelivery.StartFuelDelivery:FireServer();
	end
};
v6.PickUpGarbageBin = {
	Distance = 5, 
	GetText = function(p130)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Garbage Collector" then
			return;
		end;
		if not l__LocalPlayer__4.Character:FindFirstChild("GarbageBin") then
			return "PICK UP";
		end;
		if not l__LocalPlayer__4.Character.GarbageBin:FindFirstChild("PutBackInSpot") then
			return;
		end;
		return "PLACE BACK";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p131)
		if not l__LocalPlayer__4.Character:FindFirstChild("GarbageBin") then
			l__FE__2.ManageGarbageBin:FireServer("PickUp", p131.Parent.Parent);
			return;
		end;
		l__FE__2.ManageGarbageBin:FireServer("PlaceBack", l__LocalPlayer__4.Character.GarbageBin);
	end
};
v6.DumpInGarbageTruck = {
	Distance = 7, 
	GetText = function(p132)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Garbage Collector" then
			return;
		end;
		if not l__Character__4:FindFirstChild("GarbageBin") then
			return;
		end;
		if l__Character__4.GarbageBin:FindFirstChild("PutBackInSpot") then
			return;
		end;
		return "DUMP";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p133)
		l__FE__2.ManageGarbageBin:FireServer("Dump", l__Character__4.GarbageBin, p133.Parent);
	end
};
v6.EMSTreatNPC = {
	Distance = 7, 
	GetText = function(p134)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Fire then
			return;
		end;
		return "TREAT";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0.5, 
	MultiAction = false, 
	Execute = function(p135)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Fire then
			return;
		end;
		l__GameMenus__15:WaitForChild("EMSMonitor").OpenEvent:Fire(p135.Parent.Parent);
	end
};
v6.ClearTunnelCollapse = {
	Distance = 10, 
	GetText = function(p136)
		if l__LocalPlayer__4.Team ~= l__Teams__1.DOT then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("FirePart") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("EMSNPC") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("Wrecked Vehicle") then
			return;
		end;
		return "CLEAR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 10, 
	MultiAction = false, 
	Execute = function(p137)
		l__ReplicatedStorage__1.MajorServerCalls.ClearTunnelCollapse:FireServer(p137.Parent);
	end
};
v6.ClearCollapsedBridge = {
	Distance = 10, 
	GetText = function(p138)
		if l__LocalPlayer__4.Team ~= l__Teams__1.DOT then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("FirePart") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("EMSNPC") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("Wrecked Vehicle") then
			return;
		end;
		return "CLEAR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 10, 
	MultiAction = false, 
	Execute = function(p139)
		l__ReplicatedStorage__1.MajorServerCalls.ClearBridgeCollapse:FireServer(p139.Parent);
	end
};
v6.ClearPlaneCrash = {
	Distance = 10, 
	GetText = function(p140)
		if l__LocalPlayer__4.Team ~= l__Teams__1.DOT then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("FirePart") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("EMSNPC") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("Wrecked Vehicle") then
			return;
		end;
		return "CLEAR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 10, 
	MultiAction = false, 
	Execute = function(p141)
		l__ReplicatedStorage__1.MajorServerCalls.ClearPlaneCrash:FireServer(p141.Parent);
	end
};
v6.ClearChemicalBarrels = {
	Distance = 7, 
	GetText = function(p142)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Fire then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("ChemicalSpill") then
			return;
		end;
		return "CLEAR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 2, 
	MultiAction = false, 
	Execute = function(p143)
		l__ReplicatedStorage__1.MajorServerCalls.ClearChemicalBarrels:FireServer(p143.Parent);
	end
};
v6.ClearOilBarrels = {
	Distance = 7, 
	GetText = function(p144)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Fire then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("OilSpill") then
			return;
		end;
		return "CLEAR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 2, 
	MultiAction = false, 
	Execute = function(p145)
		l__ReplicatedStorage__1.MajorServerCalls.ClearOilBarrels:FireServer(p145.Parent);
	end
};
v6.ClearTruckSpill = {
	Distance = 7, 
	GetText = function(p146)
		if l__LocalPlayer__4.Team ~= l__Teams__1.DOT then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("ChemicalSpill") then
			return;
		end;
		if workspace.MajorServerCalls:FindFirstChild("OilSpill") then
			return;
		end;
		local v84 = workspace.MajorServerCalls:FindFirstChildWhichIsA("Model");
		if v84 and v84:FindFirstChild("Barrels") then
			return;
		end;
		return "CLEAR";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 10, 
	MultiAction = false, 
	Execute = function(p147)
		l__ReplicatedStorage__1.MajorServerCalls.ClearTruckSpill:FireServer(p147.Parent);
	end
};
v6.ToggleDumpGate = {
	Distance = 7, 
	GetText = function(p148)
		if p148.Parent.Parent.Parent.Parent.Control_Values.Owner.Value ~= l__LocalPlayer__4.Name then
			return;
		end;
		return "TOGGLE GATE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p149)
		p149.Parent.Parent.Parent.RearGate.Events.Toggle:FireServer();
	end
};
v6.BuyForSaleVehicle = {
	Distance = 7, 
	GetText = function(p150)
		if not p150.Parent:IsA("VehicleSeat") then
			return;
		end;
		return "BUY";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p151)
		l__GameMenus__15:WaitForChild("CarForSale").OpenEvent:Fire(p151.Parent.Parent);
	end
};
v6.ViewFuelDeliveries = {
	Distance = 7, 
	GetText = function(p152)
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Gas Station Worker" then
			return;
		end;
		return "VIEW JOBS";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p153)
		l__GameMenus__15:WaitForChild("FuelDelivery").OpenEvent:Fire();
	end
};
v6.OpenGasDepotMenu = {
	Distance = 10, 
	GetText = function(p154)
		if not l__LocalPlayer__4:FindFirstChild("Job") or l__LocalPlayer__4.Job.Value ~= "Gas Station Worker" then
			return;
		end;
		return "GAS DEPOT";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.F, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p155)
		l__GameMenus__15:WaitForChild("FuelDelivery").OpenEvent:Fire("Depot");
	end
};
v6.ShutOffFuelValve = {
	Distance = 7, 
	GetText = function(p156)
		return "SHUT OFF VALVE";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p157)
		l__ReplicatedStorage__1.MajorServerCalls.ShutOffFuelValve:FireServer();
	end
};
v6.GetOnLifeSaver = {
	Distance = 5, 
	GetText = function(p158)
		if p158.Parent.Parent.OccupantHumanoid.Value ~= nil then
			return;
		end;
		if p158.Parent.Parent.OwnerPlayer.Value == l__LocalPlayer__4 then
			return;
		end;
		return "GET ON";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p159)
		l__ReplicatedStorage__1.Tools.LifeSaver:FireServer("GetOn", nil, p159.Parent.Parent);
	end
};
v6.ToggleFDGenerator = {
	Distance = 5, 
	GetText = function(p160)
		if p160.Parent.Owner.Value ~= l__LocalPlayer__4 then
			return;
		end;
		return "TOGGLE";
	end, 
	UseInCar = true, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p161)
		l__ReplicatedStorage__1.Tools.ToggleGenerator:FireServer(p161.Parent);
	end
};
v6.GetHHKey = {
	Distance = 5, 
	GetText = function(p162)
		if p162.Parent.Transparency == 1 then
			return;
		end;
		if p162.Parent:FindFirstChild("HideInteraction") then
			return;
		end;
		return "GET KEY";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p163)
		p163.Parent.Transparency = 1;
		l__ReplicatedStorage__1.Halloween.GetHauntedHouseKey:FireServer(p163.Parent);
	end
};
v6.HauntedHouseDoor = {
	Distance = 5, 
	GetText = function(p164)
		if p164.Parent.Parent.Parent:FindFirstChild("IsOpen") then
			return;
		end;
		return "USE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p165)
		_G.ToggleHHDoor(p165.Parent);
	end
};
v6.PutMailInTruck = {
	Distance = 7, 
	GetText = function(p166)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Postal Worker" then
			return;
		end;
		if not l__Character__4:FindFirstChild("Collected Mail") then
			return;
		end;
		return "PUT IN";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p167)
		l__FE__2.ManageMailbox:FireServer("PutInTruck", l__Character__4["Collected Mail"], p167.Parent);
	end
};
v6.ManagePublicMailbox = {
	Distance = 7, 
	GetText = function(p168)
		if not l__LocalPlayer__4:FindFirstChild("Job") then
			return;
		end;
		if l__LocalPlayer__4.Job.Value ~= "Postal Worker" then
			return;
		end;
		local l__Parent__85 = p168.Parent.Parent;
		if not l__Parent__85:FindFirstChild("ToBePickedUp") then
			return;
		end;
		if l__Parent__85.Closed.Transparency == 0 then
			return "OPEN";
		end;
		if l__Parent__85:FindFirstChild("ToBePickedUp") and not l__Parent__85:FindFirstChild("PickedUp") then
			return "PICK UP";
		end;
		if l__Parent__85.Open.Transparency ~= 0 then
			return;
		end;
		return "CLOSE";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p169)
		local l__Parent__86 = p169.Parent.Parent;
		if l__Parent__86.Closed.Transparency == 0 then
			l__FE__2.ManageMailbox:FireServer("Open", l__Parent__86);
			return;
		end;
		if l__Parent__86:FindFirstChild("ToBePickedUp") and not l__Parent__86:FindFirstChild("PickedUp") then
			l__FE__2.ManageMailbox:FireServer("GetMail", l__Parent__86);
			return;
		end;
		if l__Parent__86.Open.Transparency ~= 0 then
			return;
		end;
		l__FE__2.ManageMailbox:FireServer("Close", l__Parent__86);
	end
};
v6.ViewClothingItem = {
	Distance = 7, 
	GetText = function(p170)
		return "VIEW";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p171)
		l__GameMenus__15:WaitForChild("ClothingSale").OpenEvent:Fire(p171.Parent.Parent);
	end
};
v6.MMDiscoverEvidence = {
	Distance = 7, 
	GetText = function(p172)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Police and l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
			return;
		end;
		if p172.Parent.Name == "BloodStains" then
			local v87 = l__Character__4:FindFirstChildOfClass("Tool");
			if not v87 then
				return;
			end;
			if v87.Name ~= "UV Light" then
				return;
			end;
		end;
		return "INSPECT";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p173)
		l__ReplicatedStorage__1.Halloween.MurderMystery.FindEvidence:FireServer(p173.Parent);
	end
};
v6.MMLockbox = {
	Distance = 7, 
	GetText = function(p174)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Police and l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
			return;
		end;
		return "INSPECT";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p175)
		l__PlayerGui__5.GameMenus.MurderMystery.OpenEvent:Fire("Lockbox");
	end
};
v6.MMViewStatus = {
	Distance = 7, 
	GetText = function(p176)
		if l__LocalPlayer__4.Team ~= l__Teams__1.Police and l__LocalPlayer__4.Team ~= l__Teams__1.Sheriff then
			return;
		end;
		return "VIEW";
	end, 
	KeyCode = Enum.KeyCode.E, 
	HoldTime = 0, 
	MultiAction = false, 
	Execute = function(p177)
		l__PlayerGui__5.GameMenus.MurderMystery.OpenEvent:Fire();
	end
};
return v6;
