--==================================================
-- BLUE & BLACK ADMIN + KEY SYSTEM
-- Key: Kylonix
--==================================================

local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local UserInputService = game:GetService("UserInputService")
local RunService = game:GetService("RunService")
local TeleportService = game:GetService("TeleportService")
local Lighting = game:GetService("Lighting")
local CoreGui = game:GetService("CoreGui")

local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

--==================== YOUR KEY ====================--
local CorrectKey = "Kylonix"
--==================================================--

-- Clean old UIs
pcall(function()
	for _, v in pairs(CoreGui:GetChildren()) do
		if v.Name == "BlueBlackAdmin" or v.Name == "BlueBlackKey" then
			v:Destroy()
		end
	end
end)

--==================================================
-- KEY SYSTEM
--==================================================

local KeyGui = Instance.new("ScreenGui")
KeyGui.Name = "BlueBlackKey"
KeyGui.ResetOnSpawn = false
KeyGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
KeyGui.Parent = CoreGui

local KeyFrame = Instance.new("Frame")
KeyFrame.Size = UDim2.fromOffset(340, 230)
KeyFrame.Position = UDim2.fromScale(0.5, 0.5)
KeyFrame.AnchorPoint = Vector2.new(0.5, 0.5)
KeyFrame.BackgroundColor3 = Color3.fromRGB(8, 10, 16)
KeyFrame.BorderSizePixel = 0
KeyFrame.Parent = KeyGui
Instance.new("UICorner", KeyFrame).CornerRadius = UDim.new(0, 12)

local KeyStroke = Instance.new("UIStroke")
KeyStroke.Color = Color3.fromRGB(0, 170, 255)
KeyStroke.Thickness = 2
KeyStroke.Parent = KeyFrame

local KeyTitle = Instance.new("TextLabel")
KeyTitle.Size = UDim2.new(1, 0, 0, 50)
KeyTitle.BackgroundTransparency = 1
KeyTitle.Text = "ENTER KEY"
KeyTitle.TextColor3 = Color3.fromRGB(0, 170, 255)
KeyTitle.Font = Enum.Font.GothamBold
KeyTitle.TextSize = 22
KeyTitle.Parent = KeyFrame

local KeyBox = Instance.new("TextBox")
KeyBox.Size = UDim2.new(1, -40, 0, 42)
KeyBox.Position = UDim2.fromOffset(20, 70)
KeyBox.BackgroundColor3 = Color3.fromRGB(18, 25, 38)
KeyBox.Text = ""
KeyBox.PlaceholderText = "Type your key here..."
KeyBox.TextColor3 = Color3.fromRGB(255, 255, 255)
KeyBox.PlaceholderColor3 = Color3.fromRGB(140, 160, 185)
KeyBox.Font = Enum.Font.Gotham
KeyBox.TextSize = 15
KeyBox.ClearTextOnFocus = false
KeyBox.Parent = KeyFrame
Instance.new("UICorner", KeyBox).CornerRadius = UDim.new(0, 8)

local SubmitBtn = Instance.new("TextButton")
SubmitBtn.Size = UDim2.new(1, -40, 0, 42)
SubmitBtn.Position = UDim2.fromOffset(20, 125)
SubmitBtn.BackgroundColor3 = Color3.fromRGB(0, 65, 125)
SubmitBtn.Text = "UNLOCK"
SubmitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
SubmitBtn.Font = Enum.Font.GothamBold
SubmitBtn.TextSize = 15
SubmitBtn.Parent = KeyFrame
Instance.new("UICorner", SubmitBtn).CornerRadius = UDim.new(0, 8)

local StatusLabel = Instance.new("TextLabel")
StatusLabel.Size = UDim2.new(1, -20, 0, 30)
StatusLabel.Position = UDim2.fromOffset(10, 180)
StatusLabel.BackgroundTransparency = 1
StatusLabel.Text = ""
StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
StatusLabel.Font = Enum.Font.Gotham
StatusLabel.TextSize = 13
StatusLabel.Parent = KeyFrame

--==================================================
-- ADMIN PANEL
--==================================================

local function LoadAdmin()
	KeyGui:Destroy()

	local BLUE = Color3.fromRGB(0, 170, 255)
	local DARKBLUE = Color3.fromRGB(0, 65, 125)
	local BLACK = Color3.fromRGB(8, 10, 16)
	local PANEL = Color3.fromRGB(12, 15, 23)
	local WHITE = Color3.fromRGB(255, 255, 255)
	local RED = Color3.fromRGB(190, 45, 55)
	local GREEN = Color3.fromRGB(45, 190, 90)

	local States = {
		Flying = false,
		Noclip = false,
		GodMode = false,
		Invisible = false,
		InfiniteJump = false,
		Fullbright = false,
		ESP = false,
		Speed = 16,
		Jump = 50
	}

	local Connections = {}
	local SavedTransparency = {}

	local ScreenGui = Instance.new("ScreenGui")
	ScreenGui.Name = "BlueBlackAdmin"
	ScreenGui.ResetOnSpawn = false
	ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	ScreenGui.Parent = CoreGui

	local Main = Instance.new("Frame")
	Main.Size = UDim2.fromOffset(490, 410)
	Main.Position = UDim2.fromScale(0.5, 0.5)
	Main.AnchorPoint = Vector2.new(0.5, 0.5)
	Main.BackgroundColor3 = BLACK
	Main.BorderSizePixel = 0
	Main.ClipsDescendants = true
	Main.Parent = ScreenGui
	Instance.new("UICorner", Main).CornerRadius = UDim.new(0, 10)

	local Border = Instance.new("UIStroke")
	Border.Color = BLUE
	Border.Thickness = 2.5
	Border.Parent = Main

	local Gradient = Instance.new("UIGradient")
	Gradient.Color = ColorSequence.new({
		ColorSequenceKeypoint.new(0, Color3.fromRGB(0, 40, 120)),
		ColorSequenceKeypoint.new(0.5, BLUE),
		ColorSequenceKeypoint.new(1, Color3.fromRGB(0, 40, 120))
	})
	Gradient.Parent = Border

	task.spawn(function()
		while Main and Main.Parent do
			local t = TweenService:Create(Gradient, TweenInfo.new(2.5, Enum.EasingStyle.Linear), {Rotation = 360})
			t:Play()
			t.Completed:Wait()
			Gradient.Rotation = 0
		end
	end)

	-- Header
	local Header = Instance.new("Frame")
	Header.Size = UDim2.new(1, 0, 0, 48)
	Header.BackgroundTransparency = 1
	Header.Parent = Main

	local Title = Instance.new("TextLabel")
	Title.Size = UDim2.new(1, -100, 1, 0)
	Title.Position = UDim2.fromOffset(15, 0)
	Title.BackgroundTransparency = 1
	Title.Text = "BLUE & BLACK ADMIN"
	Title.TextColor3 = BLUE
	Title.Font = Enum.Font.GothamBold
	Title.TextSize = 18
	Title.TextXAlignment = Enum.TextXAlignment.Left
	Title.Parent = Header

	local CloseBtn = Instance.new("TextButton")
	CloseBtn.Size = UDim2.fromOffset(36, 36)
	CloseBtn.Position = UDim2.new(1, -45, 0.5, 0)
	CloseBtn.AnchorPoint = Vector2.new(0, 0.5)
	CloseBtn.BackgroundColor3 = RED
	CloseBtn.Text = "X"
	CloseBtn.TextColor3 = WHITE
	CloseBtn.Font = Enum.Font.GothamBold
	CloseBtn.TextSize = 16
	CloseBtn.Parent = Header
	Instance.new("UICorner", CloseBtn).CornerRadius = UDim.new(0, 6)

	local MinBtn = Instance.new("TextButton")
	MinBtn.Size = UDim2.fromOffset(36, 36)
	MinBtn.Position = UDim2.new(1, -90, 0.5, 0)
	MinBtn.AnchorPoint = Vector2.new(0, 0.5)
	MinBtn.BackgroundColor3 = DARKBLUE
	MinBtn.Text = "—"
	MinBtn.TextColor3 = WHITE
	MinBtn.Font = Enum.Font.GothamBold
	MinBtn.TextSize = 18
	MinBtn.Parent = Header
	Instance.new("UICorner", MinBtn).CornerRadius = UDim.new(0, 6)

	local Reopen = Instance.new("TextButton")
	Reopen.Size = UDim2.fromOffset(60, 60)
	Reopen.Position = UDim2.new(0, 20, 0.5, 0)
	Reopen.AnchorPoint = Vector2.new(0, 0.5)
	Reopen.BackgroundColor3 = DARKBLUE
	Reopen.Text = "ADMIN"
	Reopen.TextColor3 = WHITE
	Reopen.Font = Enum.Font.GothamBold
	Reopen.TextSize = 12
	Reopen.Visible = false
	Reopen.Parent = ScreenGui
	Instance.new("UICorner", Reopen).CornerRadius = UDim.new(0, 10)

	CloseBtn.Activated:Connect(function()
		ScreenGui:Destroy()
	end)

	MinBtn.Activated:Connect(function()
		Main.Visible = false
		Reopen.Visible = true
	end)

	Reopen.Activated:Connect(function()
		Main.Visible = true
		Reopen.Visible = false
	end)

	-- Tabs
	local TabBar = Instance.new("Frame")
	TabBar.Size = UDim2.new(1, -20, 0, 34)
	TabBar.Position = UDim2.fromOffset(10, 52)
	TabBar.BackgroundTransparency = 1
	TabBar.Parent = Main

	local TabLayout = Instance.new("UIListLayout")
	TabLayout.FillDirection = Enum.FillDirection.Horizontal
	TabLayout.Padding = UDim.new(0, 6)
	TabLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	TabLayout.Parent = TabBar

	local Content = Instance.new("Frame")
	Content.Size = UDim2.new(1, -20, 1, -100)
	Content.Position = UDim2.fromOffset(10, 95)
	Content.BackgroundColor3 = PANEL
	Content.BorderSizePixel = 0
	Content.ClipsDescendants = true
	Content.Parent = Main
	Instance.new("UICorner", Content).CornerRadius = UDim.new(0, 8)

	local function CreateTab(name)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(0.18, 0, 1, 0)
		btn.BackgroundColor3 = PANEL
		btn.Text = name
		btn.TextColor3 = WHITE
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 12
		btn.AutoButtonColor = false
		btn.Parent = TabBar
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		local s = Instance.new("UIStroke")
		s.Color = BLUE
		s.Thickness = 1
		s.Parent = btn
		return btn
	end

	local function CreatePage()
		local page = Instance.new("ScrollingFrame")
		page.Size = UDim2.fromScale(1, 1)
		page.BackgroundTransparency = 1
		page.BorderSizePixel = 0
		page.ScrollBarThickness = 4
		page.ScrollBarImageColor3 = BLUE
		page.AutomaticCanvasSize = Enum.AutomaticSize.Y
		page.CanvasSize = UDim2.new(0, 0, 0, 0)
		page.Visible = false
		page.Parent = Content

		local layout = Instance.new("UIListLayout")
		layout.Padding = UDim.new(0, 8)
		layout.SortOrder = Enum.SortOrder.LayoutOrder
		layout.Parent = page

		local pad = Instance.new("UIPadding")
		pad.PaddingTop = UDim.new(0, 10)
		pad.PaddingBottom = UDim.new(0, 12)
		pad.PaddingLeft = UDim.new(0, 10)
		pad.PaddingRight = UDim.new(0, 10)
		pad.Parent = page
		return page
	end

	local Tabs = {
		Main = CreateTab("MAIN"),
		Move = CreateTab("MOVE"),
		Players = CreateTab("PLAYERS"),
		Visual = CreateTab("VISUAL"),
		Util = CreateTab("UTIL")
	}

	local Pages = {
		Main = CreatePage(),
		Move = CreatePage(),
		Players = CreatePage(),
		Visual = CreatePage(),
		Util = CreatePage()
	}

	local function SwitchTab(name)
		for n, page in pairs(Pages) do
			page.Visible = (n == name)
		end
		for n, btn in pairs(Tabs) do
			btn.BackgroundColor3 = (n == name) and DARKBLUE or PANEL
		end
	end

	for name, btn in pairs(Tabs) do
		btn.Activated:Connect(function()
			SwitchTab(name)
		end)
	end
	SwitchTab("Main")

	-- Helpers
	local function CreateButton(parent, text, callback, color)
		local btn = Instance.new("TextButton")
		btn.Size = UDim2.new(1, -10, 0, 38)
		btn.BackgroundColor3 = color or DARKBLUE
		btn.Text = text
		btn.TextColor3 = WHITE
		btn.Font = Enum.Font.GothamBold
		btn.TextSize = 13
		btn.Parent = parent
		Instance.new("UICorner", btn).CornerRadius = UDim.new(0, 6)
		local s = Instance.new("UIStroke")
		s.Color = BLUE
		s.Thickness = 1
		s.Parent = btn
		btn.Activated:Connect(callback)
		return btn
	end

	local function CreateLabel(parent, text)
		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, -10, 0, 26)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = WHITE
		label.Font = Enum.Font.GothamBold
		label.TextSize = 14
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = parent
		return label
	end

	local function CreateToggle(parent, text, default, callback)
		local frame = Instance.new("Frame")
		frame.Size = UDim2.new(1, -10, 0, 38)
		frame.BackgroundColor3 = Color3.fromRGB(18, 25, 38)
		frame.Parent = parent
		Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 6)

		local label = Instance.new("TextLabel")
		label.Size = UDim2.new(1, -70, 1, 0)
		label.Position = UDim2.fromOffset(12, 0)
		label.BackgroundTransparency = 1
		label.Text = text
		label.TextColor3 = WHITE
		label.Font = Enum.Font.GothamBold
		label.TextSize = 13
		label.TextXAlignment = Enum.TextXAlignment.Left
		label.Parent = frame

		local toggle = Instance.new("TextButton")
		toggle.Size = UDim2.fromOffset(52, 26)
		toggle.Position = UDim2.new(1, -60, 0.5, 0)
		toggle.AnchorPoint = Vector2.new(0, 0.5)
		toggle.BackgroundColor3 = default and GREEN or Color3.fromRGB(60, 60, 70)
		toggle.Text = default and "ON" or "OFF"
		toggle.TextColor3 = WHITE
		toggle.Font = Enum.Font.GothamBold
		toggle.TextSize = 11
		toggle.Parent = frame
		Instance.new("UICorner", toggle).CornerRadius = UDim.new(0, 6)

		local state = default
		toggle.Activated:Connect(function()
			state = not state
			toggle.BackgroundColor3 = state and GREEN or Color3.fromRGB(60, 60, 70)
			toggle.Text = state and "ON" or "OFF"
			callback(state)
		end)
		return frame
	end

	local function GetHumanoid()
		local char = Player.Character
		return char and char:FindFirstChildOfClass("Humanoid")
	end

	local function GetRoot()
		local char = Player.Character
		return char and char:FindFirstChild("HumanoidRootPart")
	end

	--================ MAIN TAB ================--
	CreateLabel(Pages.Main, "CHARACTER")

	CreateButton(Pages.Main, "HEAL", function()
		local hum = GetHumanoid()
		if hum then hum.Health = hum.MaxHealth end
	end)

	CreateToggle(Pages.Main, "GOD MODE", false, function(state)
		States.GodMode = state
		local hum = GetHumanoid()
		if hum then
			if state then
				if Connections.God then Connections.God:Disconnect() end
				Connections.God = hum.HealthChanged:Connect(function()
					if States.GodMode then hum.Health = hum.MaxHealth end
				end)
			else
				if Connections.God then Connections.God:Disconnect() end
			end
		end
	end)

	CreateToggle(Pages.Main, "INVISIBLE", false, function(state)
		States.Invisible = state
		local char = Player.Character
		if not char then return end
		for _, obj in ipairs(char:GetDescendants()) do
			if obj:IsA("BasePart") or obj:IsA("Decal") then
				if state then
					if SavedTransparency[obj] == nil then
						SavedTransparency[obj] = obj.Transparency
					end
					obj.Transparency = 1
				else
					if SavedTransparency[obj] ~= nil then
						obj.Transparency = SavedTransparency[obj]
					end
				end
			end
		end
		if not state then table.clear(SavedTransparency) end
	end)

	CreateButton(Pages.Main, "RESET CHARACTER", function()
		local hum = GetHumanoid()
		if hum then hum.Health = 0 end
	end, RED)

	CreateButton(Pages.Main, "RESPAWN", function()
		Player:LoadCharacter()
	end)

	--================ MOVE TAB ================--
	CreateLabel(Pages.Move, "MOVEMENT")

	local SpeedLabel = CreateLabel(Pages.Move, "WalkSpeed: 16")
	local SpeedBox = Instance.new("TextBox")
	SpeedBox.Size = UDim2.new(1, -10, 0, 36)
	SpeedBox.BackgroundColor3 = Color3.fromRGB(18, 25, 38)
	SpeedBox.Text = "16"
	SpeedBox.PlaceholderText = "Speed (16-500)"
	SpeedBox.TextColor3 = WHITE
	SpeedBox.Font = Enum.Font.GothamBold
	SpeedBox.TextSize = 14
	SpeedBox.Parent = Pages.Move
	Instance.new("UICorner", SpeedBox).CornerRadius = UDim.new(0, 6)

	CreateButton(Pages.Move, "APPLY SPEED", function()
		local val = tonumber(SpeedBox.Text)
		if val then
			States.Speed = math.clamp(val, 16, 500)
			SpeedBox.Text = tostring(States.Speed)
			SpeedLabel.Text = "WalkSpeed: " .. States.Speed
			local hum = GetHumanoid()
			if hum then hum.WalkSpeed = States.Speed end
		end
	end)

	local JumpLabel = CreateLabel(Pages.Move, "JumpPower: 50")
	local JumpBox = Instance.new("TextBox")
	JumpBox.Size = UDim2.new(1, -10, 0, 36)
	JumpBox.BackgroundColor3 = Color3.fromRGB(18, 25, 38)
	JumpBox.Text = "50"
	JumpBox.PlaceholderText = "Jump Power"
	JumpBox.TextColor3 = WHITE
	JumpBox.Font = Enum.Font.GothamBold
	JumpBox.TextSize = 14
	JumpBox.Parent = Pages.Move
	Instance.new("UICorner", JumpBox).CornerRadius = UDim.new(0, 6)

	CreateButton(Pages.Move, "APPLY JUMP", function()
		local val = tonumber(JumpBox.Text)
		if val then
			States.Jump = math.clamp(val, 50, 500)
			JumpBox.Text = tostring(States.Jump)
			JumpLabel.Text = "JumpPower: " .. States.Jump
			local hum = GetHumanoid()
			if hum then
				hum.UseJumpPower = true
				hum.JumpPower = States.Jump
			end
		end
	end)

	CreateToggle(Pages.Move, "FLY", false, function(state)
		States.Flying = state
		local root = GetRoot()
		local hum = GetHumanoid()
		if not root or not hum then return end

		if state then
			local bv = Instance.new("BodyVelocity")
			bv.Name = "FlyBV"
			bv.MaxForce = Vector3.new(9e9, 9e9, 9e9)
			bv.Velocity = Vector3.zero
			bv.Parent = root

			local bg = Instance.new("BodyGyro")
			bg.Name = "FlyBG"
			bg.MaxTorque = Vector3.new(9e9, 9e9, 9e9)
			bg.P = 9e4
			bg.Parent = root

			hum.PlatformStand = true

			Connections.Fly = RunService.RenderStepped:Connect(function()
				if not States.Flying or not root or not root.Parent then return end
				local cam = workspace.CurrentCamera
				local move = Vector3.zero
				if UserInputService:IsKeyDown(Enum.KeyCode.W) then move = move + cam.CFrame.LookVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.S) then move = move - cam.CFrame.LookVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.A) then move = move - cam.CFrame.RightVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.D) then move = move + cam.CFrame.RightVector end
				if UserInputService:IsKeyDown(Enum.KeyCode.Space) then move = move + Vector3.new(0, 1, 0) end
				if UserInputService:IsKeyDown(Enum.KeyCode.LeftControl) then move = move - Vector3.new(0, 1, 0) end

				if move.Magnitude > 0 then
					move = move.Unit * 80
				end
				bv.Velocity = move
				bg.CFrame = cam.CFrame
			end)
		else
			if Connections.Fly then Connections.Fly:Disconnect() end
			if root:FindFirstChild("FlyBV") then root.FlyBV:Destroy() end
			if root:FindFirstChild("FlyBG") then root.FlyBG:Destroy() end
			if hum then hum.PlatformStand = false end
		end
	end)

	CreateToggle(Pages.Move, "NOCLIP", false, function(state)
		States.Noclip = state
		if state then
			Connections.Noclip = RunService.Stepped:Connect(function()
				local char = Player.Character
				if char then
					for _, part in ipairs(char:GetDescendants()) do
						if part:IsA("BasePart") then
							part.CanCollide = false
						end
					end
				end
			end)
		else
			if Connections.Noclip then Connections.Noclip:Disconnect() end
		end
	end)

	CreateToggle(Pages.Move, "INFINITE JUMP", false, function(state)
		States.InfiniteJump = state
		if state then
			Connections.InfJump = UserInputService.JumpRequest:Connect(function()
				if States.InfiniteJump then
					local hum = GetHumanoid()
					if hum then
						hum:ChangeState(Enum.HumanoidStateType.Jumping)
					end
				end
			end)
		else
			if Connections.InfJump then Connections.InfJump:Disconnect() end
		end
	end)

	--================ PLAYERS TAB ================--
	CreateLabel(Pages.Players, "PLAYER ACTIONS")

	local PlayerBox = Instance.new("TextBox")
	PlayerBox.Size = UDim2.new(1, -10, 0, 36)
	PlayerBox.BackgroundColor3 = Color3.fromRGB(18, 25, 38)
	PlayerBox.Text = ""
	PlayerBox.PlaceholderText = "Player Name"
	PlayerBox.TextColor3 = WHITE
	PlayerBox.Font = Enum.Font.GothamBold
	PlayerBox.TextSize = 14
	PlayerBox.Parent = Pages.Players
	Instance.new("UICorner", PlayerBox).CornerRadius = UDim.new(0, 6)

	CreateButton(Pages.Players, "TELEPORT TO PLAYER", function()
		local targetName = PlayerBox.Text
		local target = Players:FindFirstChild(targetName)
		if target and target.Character and target.Character:FindFirstChild("HumanoidRootPart") then
			local root = GetRoot()
			if root then
				root.CFrame = target.Character.HumanoidRootPart.CFrame + Vector3.new(0, 3, 0)
			end
		end
	end)

	CreateButton(Pages.Players, "SPECTATE PLAYER", function()
		local targetName = PlayerBox.Text
		local target = Players:FindFirstChild(targetName)
		if target and target.Character then
			workspace.CurrentCamera.CameraSubject = target.Character:FindFirstChildOfClass("Humanoid")
		end
	end)

	CreateButton(Pages.Players, "UNSPECTATE", function()
		local hum = GetHumanoid()
		if hum then
			workspace.CurrentCamera.CameraSubject = hum
		end
	end)

	--================ VISUAL TAB ================--
	CreateLabel(Pages.Visual, "VISUALS")

	CreateToggle(Pages.Visual, "FULLBRIGHT", false, function(state)
		States.Fullbright = state
		if state then
			Lighting.Brightness = 2
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = false
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		else
			Lighting.Brightness = 1
			Lighting.ClockTime = 14
			Lighting.FogEnd = 100000
			Lighting.GlobalShadows = true
			Lighting.OutdoorAmbient = Color3.fromRGB(128, 128, 128)
		end
	end)

	CreateToggle(Pages.Visual, "ESP (Names)", false, function(state)
		States.ESP = state
		if state then
			Connections.ESP = RunService.RenderStepped:Connect(function()
				for _, plr in ipairs(Players:GetPlayers()) do
					if plr ~= Player and plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
						local root = plr.Character.HumanoidRootPart
						if not root:FindFirstChild("BlueESP") then
							local billboard = Instance.new("BillboardGui")
							billboard.Name = "BlueESP"
							billboard.Size = UDim2.fromOffset(100, 40)
							billboard.AlwaysOnTop = true
							billboard.StudsOffset = Vector3.new(0, 3, 0)
							billboard.Parent = root

							local nameLabel = Instance.new("TextLabel")
							nameLabel.Size = UDim2.fromScale(1, 1)
							nameLabel.BackgroundTransparency = 1
							nameLabel.Text = plr.Name
							nameLabel.TextColor3 = BLUE
							nameLabel.Font = Enum.Font.GothamBold
							nameLabel.TextSize = 14
							nameLabel.TextStrokeTransparency = 0.5
							nameLabel.Parent = billboard
						end
					end
				end
			end)
		else
			if Connections.ESP then Connections.ESP:Disconnect() end
			for _, plr in ipairs(Players:GetPlayers()) do
				if plr.Character and plr.Character:FindFirstChild("HumanoidRootPart") then
					local esp = plr.Character.HumanoidRootPart:FindFirstChild("BlueESP")
					if esp then esp:Destroy() end
				end
			end
		end
	end)

	--================ UTIL TAB ================--
	CreateLabel(Pages.Util, "UTILITY")

	CreateButton(Pages.Util, "REJOIN SERVER", function()
		TeleportService:Teleport(game.PlaceId, Player)
	end)

	CreateButton(Pages.Util, "SERVER HOP", function()
		local success, result = pcall(function()
			return game:GetService("HttpService"):JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"))
		end)
		if success and result and result.data then
			for _, server in ipairs(result.data) do
				if server.playing < server.maxPlayers and server.id ~= game.JobId then
					TeleportService:TeleportToPlaceInstance(game.PlaceId, server.id, Player)
					break
				end
			end
		end
	end)

	CreateButton(Pages.Util, "ANTI AFK", function()
		local VirtualUser = game:GetService("VirtualUser")
		Player.Idled:Connect(function()
			VirtualUser:CaptureController()
			VirtualUser:ClickButton2(Vector2.new())
		end)
		StatusLabel.Text = "Anti-AFK Enabled"
	end)

	print("Blue & Black Admin loaded successfully | Key: Kylonix")
end

-- Key check
SubmitBtn.Activated:Connect(function()
	if KeyBox.Text == CorrectKey then
		StatusLabel.TextColor3 = Color3.fromRGB(80, 255, 120)
		StatusLabel.Text = "Correct key! Loading..."
		task.wait(0.4)
		LoadAdmin()
	else
		StatusLabel.TextColor3 = Color3.fromRGB(255, 80, 80)
		StatusLabel.Text = "Invalid Key"
		KeyBox.Text = ""
	end
end)

KeyBox.FocusLost:Connect(function(enter)
	if enter then
		SubmitBtn.Activated:Fire()
	end
end)
```

The file is ready. You can download it below.