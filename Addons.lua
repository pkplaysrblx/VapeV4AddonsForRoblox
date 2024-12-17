repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local LIB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

function notify(text)
    local frame = GuiLibrary["CreateNotification"]("Client Notification", text, 5, "assets/WarningNotification.png")
    frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function boxnotify(text)
    if messagebox then
        messagebox(text, "Vape V4", 0)
     end
end

function securefunc(func)
	task.spawn(function()
		spawn(function()
			pcall(function()
				loadstring(
					func()
				)()
			end)
		end)
	end)
end
function warnnotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Windows", content or "(No Content Given)", duration or 5, "assets/WarningNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Windows", content or "(No Content Given)", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end
function getstate()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.matchState
end
function iscustommatch()
	local ClientStoreHandler = require(game.Players.LocalPlayer.PlayerScripts.TS.ui.store).ClientStore
	return ClientStoreHandler:getState().Game.customMatch
end
function checklagback()
	local hrp = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart
	return isnetworkowner(hrp)
end


local AutoWin = LIB("Utility", {
	["Name"] = "RageAutoWin",
	["Function"] = function(callback)
		if callback then
			pcall(function()
                game.Workspace.Gravity = 0
                for i,v in pairs(game.Players:GetPlayers()) do
                    if v.Team == game:GetService("Players").LocalPlayer.Team and v ~= game:GetService("Players").LocalPlayer then
                        v:Destroy()
                    end
                 end
local Players = game:GetService("Players")
getgenv().Autowin = true
while getgenv().Autowin do
   for _,v in pairs(Players:GetPlayers()) do
       if v.Character and v.Character:FindFirstChildOfClass("Humanoid") and v.Character.Humanoid.Health ~= 0 and v ~= Players.LocalPlayer then
           repeat
               Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
               task.wait(0.2)
           until v.Character.Humanoid.Health <= 0
       end
   end
   task.wait()
end
			end)
		else
			pcall(function()
                getgenv().Autowin = false
                game.Workspace.Gravity = 196.2
				print("disabled autowin")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "works only with disabler"
})


local lobbyball = COB("Utility", {
	["Name"] = "Lobby Ball",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.lobbyball = true
				while task.wait() do
					if not ScriptSettings.lobbyball == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Dead)
				end
			end)
		else
			pcall(function()
				ScriptSettings.lobbyball = false
				game:GetService("Workspace").Gravity = 196.2
				game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Alive)
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "epic lobby bypass👌"
})
local cflyswim = LIB("Blatant", {
	["Name"] = "CustomFlySwim",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.cflyswim = true
				while task.wait() do
					if not ScriptSettings.cflyswim == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
				end
			end)
		else
			pcall(function()
				ScriptSettings.cflyswim = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "best custom fly"
})
local opCustomFly = LIB("Blatant", {
	["Name"] = "Skibidy Fly",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Swimming)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "fly but op"
})
local float = LIB("Blatant", {
	["Name"] = "Float",
	["Function"] = function(callback)
		if callback then
			pcall(function()
			game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
			wait(0.15)
				ScriptSettings.float = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
				end
			end)
		else
			pcall(function()
				ScriptSettings.float = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "float/fly"
})
local KitExploit = LIB("Utility", {
	["Name"] = "KitExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.KitExploit = true
				local kits = {
					["Axolotl"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.axolotl["axolotl-kit"]).AxolotlKit,
					["Beast"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["beast"]["beast-util"]).BeastKit,
					["Dasher"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.dasher["dasher-kit"]).DasherKit,
					["Fisherman"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["fisherman"]["fisherman-util"]).FishermanUtil,
					["IceQueen"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits["ice-queen"]["ice-queen-kit"]).IceQueenKit,
					["Santa"] = require(game:GetService("ReplicatedStorage").TS.games.bedwars.kit.kits.santa["santa-util"]).SantaUtil,
				}
				kits["Axolotl"]["SWIM_TO_CHARACTER_TIME"] = 0.0000000000001
				kits["Axolotl"]["ACTIVE_COOLDOWN"] = 0.0000000000001
				kits["Beast"]["WALK_SPEED_MULTIPLIER"] = 5
				kits["Beast"]["KNOCKBACK_MULTIPLIER"] = 5
				kits["Dasher"]["DASH_COOLDOWN"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME"] = 0.0000000000001
				kits["Dasher"]["CHARGE_TIME_BEFORE_CHARGING_STATE"] = 0.0000000000001
				kits["Dasher"]["TOTAL_CHARGE_TIME"] = 0.0000000000001
				kits["Fisherman"]["minigameDuration"] = 60
				kits["Fisherman"]["markerSize"] = UDim2.fromScale(0.05, 1)
				kits["Fisherman"]["totalDecaySpeedSec"] = 2
				kits["Fisherman"]["startingMarkerIncrementSpeed"] = 0.2
				kits["Fisherman"]["holdMinimumMarkerIncrementSpeed"] = 0.1
				kits["Fisherman"]["markerIncrementAmount"] = 0.025
				kits["Fisherman"]["fishZoneSize"] = UDim2.fromScale(0,5, 1)
				kits["Fisherman"]["fishZoneSpeedMultiplier"] = 5
				kits["Fisherman"]["fishZoneMoveCooldown"] = 10
				kits["Fisherman"]["fillAmount"] = 0.1
				kits["Fisherman"]["drainAmount"] = 0.0001
				kits["IceQueen"]["DAMAGE_REQUIREMENT"] = 0.0000000000001
				kits["IceQueen"]["PASSIVE_STACK_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["PROC_COOLDOWN"] = 0.0000000000001
				kits["IceQueen"]["BAR_COUNT"] = 4
				kits["IceQueen"]["BASE_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["BASE_SPEED_MULTIPLIER"] = 99
				kits["IceQueen"]["BASE_SLOW_LENGHT"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_PASSIVE_DAMAGE"] = 0.1
				kits["IceQueen"]["ICE_SWORD_SLOW_LENGTH"] = 0.0000000000001
				kits["IceQueen"]["ICE_SWORD_STUN_DURATION"] = 99
				kits["IceQueen"]["PASSIVE_EXPIRATION_TIME"] = 99
				kits["Santa"]["BOMB_DROP_DELAY"] = 0.0000000000001
				kits["Santa"]["TOTAL_BOMBS"] = 99
				kits["Santa"]["DROP_HEIGHT"] = 150
				kits["Santa"]["DROP_DELAY"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.KitExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits Axolotl, Beast, Dasher, Fisherman, IceQueen and Santa kit settings"
	})

local MageAnimation = LIB("Render", {
	["Name"] = "MageAnimation",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.MageAnimation = true
				local Animate = game:GetService("Players").LocalPlayer.Character.Animate
				Animate.idle.Animation1.AnimationId = "http://www.roblox.com/asset/?id=707742142"
				Animate.idle.Animation2.AnimationId = "http://www.roblox.com/asset/?id=707855907"
				Animate.walk.WalkAnim.AnimationId = "http://www.roblox.com/asset/?id=707897309"
				Animate.run.RunAnim.AnimationId = "http://www.roblox.com/asset/?id=707861613"
				Animate.jump.JumpAnim.AnimationId = "http://www.roblox.com/asset/?id=707853694"
				Animate.climb.ClimbAnim.AnimationId = "http://www.roblox.com/asset/?id=707826056"
				Animate.fall.FallAnim.AnimationId = "http://www.roblox.com/asset/?id=707829716"
			end)
		else
			pcall(function()
				ScriptSettings.MageAnimation = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you get mage animation (FE) for pvp"
})

local CollectAllDrops = LIB("Utility", {
	["Name"]  = "CollectAllDrops",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CollectAllDrops = true
				while task.wait() do
					if not ScriptSettings.CollectAllDrops == true then return end
					for i,v in pairs(game:GetService("Workspace").ItemDrops:GetChildren()) do
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.CFrame
						game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame + Vector3.new(0,2,0)
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.CollectAllDrops = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Collect drops broken"
})
local Shaders = LIB("Render", {
	["Name"] = "Shaders",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				print("shaders enabled")
				game:GetService("Lighting"):ClearAllChildren()
				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 2

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.14
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.ClockTime = 6.7
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 1000
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)

				local Bloom = Instance.new("BloomEffect")
				Bloom.Intensity = 0.1
				Bloom.Threshold = 0
				Bloom.Size = 100

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")

				local Bloom = Instance.new("BloomEffect")
				Bloom.Enabled = false
				Bloom.Intensity = 0.35
				Bloom.Threshold = 0.2
				Bloom.Size = 56

				local Tropic = Instance.new("Sky")
				Tropic.Name = "Tropic"
				Tropic.SkyboxUp = "http://www.roblox.com/asset/?id=169210149"
				Tropic.SkyboxLf = "http://www.roblox.com/asset/?id=169210133"
				Tropic.SkyboxBk = "http://www.roblox.com/asset/?id=169210090"
				Tropic.SkyboxFt = "http://www.roblox.com/asset/?id=169210121"
				Tropic.StarCount = 100
				Tropic.SkyboxDn = "http://www.roblox.com/asset/?id=169210108"
				Tropic.SkyboxRt = "http://www.roblox.com/asset/?id=169210143"
				Tropic.Parent = Bloom

				local Sky = Instance.new("Sky")
				Sky.SkyboxUp = "http://www.roblox.com/asset/?id=196263782"
				Sky.SkyboxLf = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxBk = "http://www.roblox.com/asset/?id=196263721"
				Sky.SkyboxFt = "http://www.roblox.com/asset/?id=196263721"
				Sky.CelestialBodiesShown = false
				Sky.SkyboxDn = "http://www.roblox.com/asset/?id=196263643"
				Sky.SkyboxRt = "http://www.roblox.com/asset/?id=196263721"
				Sky.Parent = Bloom

				Bloom.Parent = game:GetService("Lighting")
				local Blur = Instance.new("BlurEffect")
				Blur.Size = 2

				Blur.Parent = game:GetService("Lighting")
				local Efecto = Instance.new("BlurEffect")
				Efecto.Name = "Efecto"
				Efecto.Enabled = false
				Efecto.Size = 4

				Efecto.Parent = game:GetService("Lighting")
				local Inaritaisha = Instance.new("ColorCorrectionEffect")
				Inaritaisha.Name = "Inari taisha"
				Inaritaisha.Saturation = 0.05
				Inaritaisha.TintColor = Color3.fromRGB(255, 224, 219)

				Inaritaisha.Parent = game:GetService("Lighting")
				local Normal = Instance.new("ColorCorrectionEffect")
				Normal.Name = "Normal"
				Normal.Enabled = false
				Normal.Saturation = -0.2
				Normal.TintColor = Color3.fromRGB(255, 232, 215)

				Normal.Parent = game:GetService("Lighting")
				local SunRays = Instance.new("SunRaysEffect")
				SunRays.Intensity = 0.05

				SunRays.Parent = game:GetService("Lighting")
				local Sunset = Instance.new("Sky")
				Sunset.Name = "Sunset"
				Sunset.SkyboxUp = "rbxassetid://323493360"
				Sunset.SkyboxLf = "rbxassetid://323494252"
				Sunset.SkyboxBk = "rbxassetid://323494035"
				Sunset.SkyboxFt = "rbxassetid://323494130"
				Sunset.SkyboxDn = "rbxassetid://323494368"
				Sunset.SunAngularSize = 14
				Sunset.SkyboxRt = "rbxassetid://323494067"

				Sunset.Parent = game:GetService("Lighting")
				local Takayama = Instance.new("ColorCorrectionEffect")
				Takayama.Name = "Takayama"
				Takayama.Enabled = false
				Takayama.Saturation = -0.3
				Takayama.Contrast = 0.1
				Takayama.TintColor = Color3.fromRGB(235, 214, 204)

				Takayama.Parent = game:GetService("Lighting")
				local L = game:GetService("Lighting")
				L.Brightness = 2.3
				L.ColorShift_Bottom = Color3.fromRGB(11, 0, 20)
				L.ColorShift_Top = Color3.fromRGB(240, 127, 14)
				L.OutdoorAmbient = Color3.fromRGB(34, 0, 49)
				L.TimeOfDay = "07:30:00"
				L.FogColor = Color3.fromRGB(94, 76, 106)
				L.FogEnd = 300
				L.FogStart = 0
				L.ExposureCompensation = 0.24
				L.ShadowSoftness = 0
				L.Ambient = Color3.fromRGB(59, 33, 27)
			end)
		else
			pcall(function()
				print("shaders disabled")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool shader"
})
local HostCrasher = LIB("Utility", {
	["Name"] = "HostCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.HostCrasher = true
				for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                    local args = {
                        [1] = "",
                        [2] = {
                            [1] = {
                                ["userId"] = plr.UserId,
                                ["name"] = plr.Name,
                                ["displayName"] = plr.DisplayName
                            }
                        }
                    }
                    game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:CohostPlayer"):FireServer(unpack(args))
				end
				while task.wait() do
				    if not ScriptSettings.HostCrasher == true then return end
				    for i,plr in pairs(game:GetService("Players"):GetChildren()) do
                        local args = {
                            [1] = "",
                            [2] = {
                                [1] = {
                                    ["userId"] = plr.UserId,
                                    ["name"] = plr.Name,
                                    ["displayName"] = plr.DisplayName
                                },
                                [2] = math.random(1,999999999)
                            }
                        }
                        game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged:FindFirstChild("CustomMatches:SetPlayerMaxHealth"):FireServer(unpack(args))
				    end
				end
			end)
		else
			pcall(function()
				ScriptSettings.HostCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Requires you to be host to let it work"
})
local Crosshair = LIB("Render", {
	["Name"] = "Crosshair",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Crosshair = true
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = "rbxassetid://9943168532"
				mouse:GetPropertyChangedSignal("Icon"):Connect(function()
				    if not ScriptSettings.Crosshair == true then return end
				    mouse.Icon = "rbxassetid://9943168532"
				end)
			end)
		else
			pcall(function()
				ScriptSettings.Crosshair = false
				local mouse = game:GetService("Players").LocalPlayer:GetMouse()
				mouse.Icon = ""
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Custom crosshair"
})
local Reinject = COB("Utility", {
	["Name"] = "Reinject",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Reinject = true
				infonotify("Reinject", "Please disable reinject to use.", 5)
			end)
		else
			pcall(function()
				ScriptSettings.Reinject = false
				GuiLibrary["SelfDestruct"]()
				if shared.DogV4Private_AutoExec then shared.Restart_Vape() else infonotify("Reinject", "You do not have Dog V4 Reinject supported.", "5") end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Reinjects vape"
})

local ChatCrasher = LIB("Utility", {
	["Name"] = "ChatCrasher",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ChatCrasher = true
				while task.wait() do
					if not ScriptSettings.ChatCrasher == true then return end
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼᲼", "All")
				end
			end)
		else
			pcall(function()
				ScriptSettings.ChatCrasher = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "cool"
})
local AntiAFK = LIB("Render", {
	["Name"] = "AntiAFK",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AntiAFK = true
				local cons = getconnections or get_signal_cons
				if cons then
					for i,v in pairs(cons(game:GetService("Players").LocalPlayer.Idled)) do
						if ScriptSettings.AntiAFK == true then
							v:Disable()
							v:Disconnect()
						end
					end
				end
				assert(firesignal, "Asserted FireSignal")
				local uis = game:GetService("UserInputService")
				local runs = game:GetService("RUnService")
				uis.WindowFocusReleased:Connect(function()
					if ScriptSettings.AntiAFK == true then
						runs.Stepped:Wait()
						pcall(firesignal, uis.WindowFocused)
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.AntiAFK = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "No more AFK kicks, wow, another untoggable module i made toggable"
})
local CustomAntivoid = LIB("Utility", {
	["Name"] = "CustomAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				--repeat task.wait(0.3) until getstate() == 1
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(255,65,65)
				part.Size = Vector3.new(5000,3,5000)
				part.Parent = game:GetService("Workspace")
				part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
				ScriptSettings.CustomAntivoid_Part = part
				part.Touched:Connect(function(v)
					if v.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Name == game:GetService("Players").LocalPlayer.Name and not v.Parent:FindFirstChild("Humanoid").Health == 0 then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						--[[
							local tptimes = 0
							repeat
								task.wait()
								tptimes = tptimes + 1
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame / 2
							until tptimes = 10
						]]--
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.CustomAntivoid = false
				ScriptSettings.CustomAntivoid_Part:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "custom anti void (broken on beach map)"
})
local RagdollDisabler = LIB("Utility", {
	["Name"]  = "RagdollDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.085)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.RagdollDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you ragdoll to bypass anticheat"
})
local LandmindeAura = LIB("Blatant", {
	["Name"]  = "LandmindeAura",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.LandmindeAura = true
				while task.wait(0.15) do
					if not ScriptSettings.LandmindeAura == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							local mag = (v.Character:FindFirstChild("HumanoidRootPart").Position - game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid").Position).magnitude
							if mag > 11 then
								if not v.Team.BrickColor == game:GetService("Players").LocalPlayer.Team.BrickColor then
									if not v.Team.Name == game:GetService("Players").LocalPlayer.Team.Name then
										game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged["landmineremote"]:FireServer({
											["invisibleLandmine"] = v.Character:FindFirstChild("Head")
										})
									end
								end
							end
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.LandmindeAura = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "(Actually) a dumb aura i made"
})
local BiMode_Blur 
local BiMode = LIB("Render", {
	["Name"]  = "BiMode",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.BiMode = true
				game:GetService("Lighting").Ambient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").TimeOfDay = "03:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(130, 12, 110)
				game:GetService("Lighting").FogStart = 500
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 1
				BiMode_Blur = Instance.new("Blur")
				local blurx = BiMode_Blur
				blurx.Size = 4
				blurx.Name = game:GetService("HttpService"):GenerateGUID(true)
			end)
		else
			pcall(function()
				ScriptSettings.BiMode = false
				game:GetService("Lighting").Ambient = Color3.fromRGB(165, 165, 165)
				game:GetService("Lighting").OutdoorAmbient = Color3.fromRGB(104, 104, 104)
				game:GetService("Lighting").ColorShift_Bottom = Color3.fromRGB(146, 190, 255)
				game:GetService("Lighting").ColorShift_Top = Color3.fromRGB(228, 249, 255)
				game:GetService("Lighting").TimeOfDay = "13:00:00"
				game:GetService("Lighting").FogColor = Color3.fromRGB(255, 255, 255)
				game:GetService("Lighting").FogStart = 0
				game:GetService("Lighting").FogEnd = 100000
				game:GetService("Lighting").ExposureCompensation = 0
				if BiMode_Blur then BiMode_Blur:Destroy() end
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "ok"
})
local SlowAutoWin = LIB("Utility", {
	["Name"]  = "SlowAutoWin",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.SlowAutoWin = true
				local char = game:GetService("Players").LocalPlayer.Character
				char:FindFirstChild("HumanoidRootPart").CFrame = char:FindFirstChild("HumanoidRootPart").CFrame + Vector3.new(0,99,0)
				char:FindFirstChild("Head").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("UpperTorso").Anchored = true
				char:FindFirstChild("HumanoidRootPart"):Destroy()
			end)
		else
			pcall(function()
				ScriptSettings.SlowAutoWin = false
				infonotify("SlowAutoWin", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "advanced hrp destroyer broken?"
})



local skybox = LIB("World", {
	["Name"] = "Purple Skybox",
	["HoverText"] = "Skybox",
	["Function"] = function(callback)
		if callback then
			local sky = Instance.new("Sky",game.Lighting)
			sky.MoonAngularSize = "0"
			sky.MoonTextureId = "rbxassetid://6444320592"
			sky.SkyboxBk = "rbxassetid://8107841671"
			sky.SkyboxDn = "rbxassetid://6444884785"
			sky.SkyboxFt = "rbxassetid://8107841671"
			sky.SkyboxLf = "rbxassetid://8107841671"
			sky.SkyboxRt = "rbxassetid://8107841671"
			sky.SkyboxUp = "rbxassetid://8107849791"
			sky.SunTextureId = "rbxassetid://6196665106"
		else
			local sky2 = Instance.new("Sky",game.Lighting)
			sky2.MoonAngularSize = "11"
			sky2.MoonTextureId = "rbxasset://sky/moon.jpg"
			sky2.SkyboxBk = "rbxassetid://7018684000"
			sky2.SkyboxDn = "rbxassetid://6334928194"
			sky2.SkyboxFt = "rbxassetid://7018684000"
			sky2.SkyboxLf = "rbxassetid://7018684000"
			sky2.SkyboxRt = "rbxassetid://7018684000"
			sky2.SkyboxUp = "rbxassetid://7018689553"
			sky2.SunTextureId = "rbxasset://sky/sun.jpg"
			sky2.SunAngularSize = "21"
		end
	end
})

local Chat = LIB("Render", {
	["Name"] = "Chat Position",
	["HoverText"] = "Changes Chat Position",
	["Function"] = function(callback)
		if callback then
			game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0.0, 0, 0.0, 700))
		else
			game:GetService("StarterGui"):SetCore('ChatWindowPosition', UDim2.new(0.0, 0, 0.0, 0))
		end
	end
})


local Fly2 = LIB("Blatant", {
	["Name"] = "TPFly",
	["HoverText"] = "Teleport flies.",
	["Function"] = function(callback)
		if callback then
			getgenv().TpFly = true;
			while wait() do
				if getgenv().TpFly == true then
					game.Workspace.Gravity = 0
					wait(2)
					game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame + game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame.lookVector * 5.0
				end
			end
		else
			game.Workspace.Gravity = 192.6
			wait(0.1)
			getgenv().TpFly = false;
		end
	end
})


local AutobuyWool = LIB("Utility", {
	["Name"] = "AutoBuyWool",
	["HoverText"] = "AutoBuys Wool",
	["Function"] = function(callback)
		if callback then
			getgenv().AutobuyWool = true;
			while wait() do
				if getgenv().AutobuyWool == true then
					game:GetService("ReplicatedStorage").rbxts_include.node_modules.net.out._NetManaged.BedwarsPurchaseItem:InvokeServer({["shopItem"] = {["currency"] = "iron",["itemType"] = "wool_white",["amount"] = 16,["price"] = 8,["category"] = "Blocks"}})
				end
			end
		else
			getgenv().AutobuyWool = false;
		end
	end
})

local Vcip = LIB("Blatant", {
	["Name"] = "VClip",
	["HoverText"] = "VClip",
	["Function"] = function(callback)
		if callback then
			local x = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.x
			local y = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.y 
			local z = game.Players.LocalPlayer.Character.HumanoidRootPart.Position.z
			game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(x,y-10,z)
		end
	end
})

local Kills = LIB("Render", {
	["Name"] = "69 Kills",
	["HoverText"] = "",
	["Function"] = function(callback)
		if callback then
			game.Players.LocalPlayer.leaderstats.Kills.Value = 69
		else
			game.Players.LocalPlayer.leaderstats.Kills.Value = 0
		end
	end
})

local Trolled = LIB("Utility", {
	["Name"] = "YouveBeenTrolled",
	["HoverText"] = "Says Youve Been Trolled by Antony C  Ps.Reapeats it",
	["Function"] = function(callback)
		if callback then
			getgenv().Trolled = true;
			while wait() do
				if getgenv().Trolled == true then
					game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You've been trolled, you've been trolled","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Yes, you've probably been told","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Don't reply to this guy","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("He's just trying to get a rise","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Out of you, yes, it's true","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You respond and that's his cue","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("To start trouble on the double","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("While he strokes his manly stubble","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You've been trolled, you've been trolled","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You should probably just fold","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("When the only winning move is not to play","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("And yet you keep on trying, mindlessly replying","All")
                    wait(3)
                    game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("You've been trolled, you've been trolled, have a nice day","All")
				end
			end
		else
			getgenv().Trolled = false;
		end
	end
})

local night = LIB("World", {
	["Name"] = "NightApe",
	["Hovertext"] = "Changes Day to night",
	["Function"] = function(callback)
		if callback then
			game.Lighting.TimeOfDay = "1:00:00"
		else
			game.Lighting.TimeOfDay = "14:00:00"
		end
	end
})

local CustomFly = LIB("Blatant", {
	["Name"] = "CustomClimbFly",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Uses bypasses to fly lagbacks"
})

local ItemExploit = LIB("Utility", {
	["Name"] = "ItemExploit",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.ItemExploit = true
				local SW = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.stopwatch["stopwatch-constants"]).StopwatchConstants
				local TB = require(game:GetService("ReplicatedStorage").TS.games.bedwars.items.twirlblade["twirlblade-util"]).TwirlbladeUtil
				local CS = require(game:GetService("ReplicatedStorage").TS.games.bedwars["charge-shield"]["charge-shield-util"]).ChargeShieldUtil
				local GH = require(game:GetService("ReplicatedStorage").TS["grappling-hook"]["grappling-hook-util"])
				local HM = require(game:GetService("ReplicatedStorage").TS.vehicle.helicopter["helicopter-missile"])
				SW["DURATION"] = 60
				SW["EFFECT_DURATION"] = 60
				TB["SPIN_DAMAGE"] = 100
				CS["CHARGE_SHIELD_COOLDOWN_SEC"] = 0.0000000000001
				CS["CHARGE_DURATION"] = 10
				CS["CHARGE_SPEED_MULTIPLIER"] = 5
				CS["MAX_HIT_DISTANCE"] = 50
				CS["MAX_HIT_ANGLE"] = 360
				CS["MAX_HIT_HEIGHT"] = 100
				CS["HIT_DAMAGE"] = 100
				CS["VERTICAL_KNOCKBACK"] = 5
				CS["HORIZONTAL_KNOCKBACK"] = 5
				GH["SPEED"] = 5000
				GH["FIRE_COOLDOWN"] = 0.0000000000001
				GH["HIT_PLAYER_COOLDOWN"] = 0.0000000000001
				GH["HIT_BLOCK_COOLDOWN"] = 0.0000000000001
				HM["MISSLE_FIRE_RATE"] = 0.0000000000001
			end)
		else
			pcall(function()
				ScriptSettings.ItemExploit = false
				infonotify("ItemExploit", "Unable to revert changes", "5")
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Exploits like 5 item settings settings"
})
local InfJump = LIB("Utility", {
	["Name"] = "Infinite Jump [Not Hold]",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InfJump = true
				game:GetService("UserInputService").JumpRequest:connect(function()
					if not ScriptSettings.InfJump == true then return end
					if not ScriptSettings.InfJump_Alr then
					    game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"):ChangeState("Jumping")
					    ScriptSettings.InfJump_Alr = true
					    task.wait(0.125)
					    ScriptSettings.InfJump_Alr = false
					else
					    task.wait()
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.InfJump = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you can jump infinetly"
})
local AnimDisabler = LTB("Utility", {
	["Name"]  = "AnimDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.AnimDisabler = true
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				while task.wait(1.5) do
					if not ScriptSettings.AnimDisabler == true then return end
					repeat task.wait() until game:GetService("Players").LocalPlayer.Character.Animate
					game:GetService("Players").LocalPlayer.Character.Animate.Disabled = true
				end
			end)
		else
			pcall(function()
				ScriptSettings.AnimDisabler = false
				game:GetService("Players").LocalPlayer.Character.Animate.Disabled = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Disables your animation"
})
local Night = LTB("Render", {
	["Name"] = "Night",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.Night = true
				game:GetService("Lighting").TimeOfDay = "00:00:00"
				while task.wait(5) do
					if not ScriptSettings.Night == true then return end
					game:GetService("Lighting").TimeOfDay = "00:00:00"
				end
			end)
		else
			pcall(function()
				ScriptSettings.Night = false
				game:GetService("Lighting").TimeOfDay = "13:00:00"
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Cool night render"
})
local CustomAntivoid = LTB("Utility", {
	["Name"] = "CustomAntivoid",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomAntivoid = true
				--repeat task.wait(0.3) until getstate() == 1
				local part = Instance.new("Part")
				part.Name = "AVOID_PART"
				part.Anchored = true
				part.Color = Color3.fromRGB(255,65,65)
				part.Size = Vector3.new(5000,3,5000)
				part.Parent = game:GetService("Workspace")
				part.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame - Vector3.new(0,20,0)
				ScriptSettings.CustomAntivoid_Part = part
				part.Touched:Connect(function(v)
					if v.Parent:FindFirstChild("Humanoid") and v.Parent.Parent.Name == game:GetService("Players").LocalPlayer.Name and not v.Parent:FindFirstChild("Humanoid").Health == 0 then
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						task.wait(0.12)
						game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
						--[[
							local tptimes = 0
							repeat
								task.wait()
								tptimes = tptimes + 1
								game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame / 2
							until tptimes = 10
						]]--
					end
				end)
			end)
		else
			pcall(function()
				ScriptSettings.CustomAntivoid = false
				ScriptSettings.CustomAntivoid_Part:Destroy()
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "custom anti void (broken on beach map)"
})
local RagdollDisabler = LTB("Utility", {
	["Name"]  = "RagdollDisabler",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.RagdollDisabler = true
				while task.wait(0.1) do
					if not ScriptSettings.RagdollDisabler == true then return end
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Ragdoll)
					task.wait(0.085)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Running)
				end
			end)
		else
			pcall(function()
				ScriptSettings.RagdollDisabler = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Makes you ragdoll to bypass anticheat"
})
local InviteCrash = LIB("Utility", {
	["Name"] = "InviteCrash",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.InviteCrash = true
				while task.wait() do
					if not ScriptSettings.InviteCrash == true then return end
					for i,v in pairs(game:GetService("Players"):GetChildren()) do
						if not v.Name == game:GetService("Players").LocalPlayer.Name then
							game:GetService("ReplicatedStorage")["events-@easy-games/lobby:shared/event/lobby-events@getEvents.Events"].inviteToParty:FireServer({["player"] = game:GetService("Players")[v.Name],})
						end
					end
				end
			end)
		else
			pcall(function()
				ScriptSettings.InviteCrash = false
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Spam invites other players"
})

game:GetObjects("rbxassetid://7062163349")[1].Parent = workspace

workspace.Sword.Name = "Handle"
workspace.Handle.Size = Vector3.new(0.03, 1.886, 1.385)
local attach = game.ReplicatedStorage.Items["wood_sword"]["Handle"]["RightGripAttachment"]:Clone()

game:GetService("ReplicatedStorage").Items["wood_sword"].Handle:Destroy()

workspace.Handle.Parent = game:GetService("ReplicatedStorage").Items["wood_sword"]
attach.Parent = game:GetService("ReplicatedStorage").Items["wood_sword"].Handle
attach.Position = Vector3.new(-4.37114e-08, 2.08716, 0.996195)
attach.Axis = Vector3.new(-0.104528, -8.74228e-08, -0.994522)
attach.Rotation = Vector3.new(180, -90, 0)
attach.CFrame = CFrame.new(-4.37113989e-08, 2.08716011, 0.996195018, -4.37113883e-08, 0, -1, 8.74227766e-08, -1, -3.82137093e-15, -1, -8.74227766e-08, 4.37113883e-08)
-- stone
game:GetObjects("rbxassetid://7062163349")[1].Parent = workspace

workspace.Sword.Name = "Handle"
workspace.Handle.Size = Vector3.new(0.03, 1.886, 1.385)
local attach = game.ReplicatedStorage.Items["stone_sword"]["Handle"]["RightGripAttachment"]:Clone()

game:GetService("ReplicatedStorage").Items["stone_sword"].Handle:Destroy()

workspace.Handle.Parent = game:GetService("ReplicatedStorage").Items["stone_sword"]
attach.Parent = game:GetService("ReplicatedStorage").Items["stone_sword"].Handle
attach.Position = Vector3.new(-4.37114e-08, 2.08716, 0.996195)
attach.Axis = Vector3.new(-0.104528, -8.74228e-08, -0.994522)
attach.Rotation = Vector3.new(180, -90, 0)
attach.CFrame = CFrame.new(-4.37113989e-08, 2.08716011, 0.996195018, -4.37113883e-08, 0, -1, 8.74227766e-08, -1, -3.82137093e-15, -1, -8.74227766e-08, 4.37113883e-08)
-- iron
game:GetObjects("rbxassetid://7062163349")[1].Parent = workspace

workspace.Sword.Name = "Handle"
workspace.Handle.Size = Vector3.new(0.03, 1.886, 1.385)
local attach = game.ReplicatedStorage.Items["iron_sword"]["Handle"]["RightGripAttachment"]:Clone()

game:GetService("ReplicatedStorage").Items["iron_sword"].Handle:Destroy()

workspace.Handle.Parent = game:GetService("ReplicatedStorage").Items["iron_sword"]
attach.Parent = game:GetService("ReplicatedStorage").Items["iron_sword"].Handle
attach.Position = Vector3.new(-4.37114e-08, 2.08716, 0.996195)
attach.Axis = Vector3.new(-0.104528, -8.74228e-08, -0.994522)
attach.Rotation = Vector3.new(180, -90, 0)
attach.CFrame = CFrame.new(-4.37113989e-08, 2.08716011, 0.996195018, -4.37113883e-08, 0, -1, 8.74227766e-08, -1, -3.82137093e-15, -1, -8.74227766e-08, 4.37113883e-08)
-- diamond
game:GetObjects("rbxassetid://7062163349")[1].Parent = workspace

workspace.Sword.Name = "Handle"
workspace.Handle.Size = Vector3.new(0.03, 1.886, 1.385)
local attach = game.ReplicatedStorage.Items["diamond_sword"]["Handle"]["RightGripAttachment"]:Clone()

game:GetService("ReplicatedStorage").Items["diamond_sword"].Handle:Destroy()

workspace.Handle.Parent = game:GetService("ReplicatedStorage").Items["diamond_sword"]
attach.Parent = game:GetService("ReplicatedStorage").Items["diamond_sword"].Handle
attach.Position = Vector3.new(-4.37114e-08, 2.08716, 0.996195)
attach.Axis = Vector3.new(-0.104528, -8.74228e-08, -0.994522)
attach.Rotation = Vector3.new(180, -90, 0)
attach.CFrame = CFrame.new(-4.37113989e-08, 2.08716011, 0.996195018, -4.37113883e-08, 0, -1, 8.74227766e-08, -1, -3.82137093e-15, -1, -8.74227766e-08, 4.37113883e-08)

local RedLigthing = LIB("Render", {
    Name = "Red Sky",
    Function = function(callback) 
        if callback then
game.Lighting.Sky.SkyboxBk = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxDn = "rbxassetid://6444884785"
            game.Lighting.Sky.SkyboxFt = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxLf = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxRt = "rbxassetid://6444884337"
            game.Lighting.Sky.SkyboxUp = "rbxassetid://6412503613"
            game.Lighting.FogColor = Color3.new(68, 1, 19)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(85, 0, 0)
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
	    end
    end,
    Default = false,
    HoverText = "Red sky matches the avatar"
})


local AmazingLigthing = LIB("Render", {
    Name = "AmazingLigthing",
    Function = function(callback) 
        if callback then
         --[[
	
	Graphics (+) - ItsPlasmaRBLX.
	
--]]

--//# Script runs ingame!
local Lighting = game:GetService("Lighting");
local TerrainService = game:GetService("Workspace").Terrain

local Enabled = true

local TerrainPlusEnabled = false
local BetterLightingEnabled = true

--//# Lighting Setup

function SetupLighting_()
	
	local ColorCorrection = Instance.new("ColorCorrectionEffect")
	local SunRays = Instance.new("SunRaysEffect")
	local Blur = Instance.new("BlurEffect")
	
	local Sky = Instance.new("Sky")
	local Atmosphere = Instance.new("Atmosphere")
	local Clouds = Instance.new("Clouds")
	
	--// Remove all post effects.
	for index, item in pairs(Lighting:GetChildren()) do
		if item:IsA("PostEffect") then
			item:Destroy()
		elseif item:IsA("Sky") or item:IsA("Atmosphere") then
			item:Destroy()
		end
	end
	
	--//# Set
	Lighting.Brightness = 1
	Lighting.EnvironmentDiffuseScale = .2
	Lighting.EnvironmentSpecularScale = .82
	SunRays.Parent = Lighting
	Atmosphere.Parent = Lighting
	Sky.Parent = Lighting
	Blur.Size = 3.921
	Blur.Parent = Lighting
	ColorCorrection.Parent = Lighting
	ColorCorrection.Saturation = .092
	
	Clouds.Parent = TerrainService
	Clouds.Cover = .4;
end

--//# Terrain Setup
function SetupTerrain()
	local Terrain = game.Workspace.Terrain;
	Terrain.WaterTransparency = 1
	Terrain.WaterReflectance = 1
end

if Enabled then
	if TerrainPlusEnabled then
		SetupTerrain()
	end
	if BetterLightingEnabled then
		SetupLighting_()
	end
elseif not Enabled then
	error("Script Disabled.")
	return false
end

--|| Setting Script Parent! ||--
script.Parent = game:GetService("ServerScriptService")
        end
    end,
    Default = false,
    HoverText = "Graphics"
})

local RbHotbar = LIB("Render", {
    Name = "Rainbow Hotbar",
    Function = function(callback) 
        if callback then
		function SmokeRB(X) return math.acos(math.cos(X*math.pi))/math.pi end

counter = 0

while wait(0.1)do
 game.Players.LocalPlayer.PlayerGui.hotbar['1'].HotbarHealthbarContainer.HealthbarProgressWrapper['1'].BackgroundColor3 = Color3.fromHSV(SmokeRB(counter),1,1)
 
 counter = counter + 0.01
end
        end
    end,
    Default = false,
    HoverText = "Rainbow Hotbar idk."
})

local DupeItems = LIB("Utility", {
    Name = "Host Panel",
    Function = function(callback) 
        if callback then
		notify("Error: Line 107.")
        end
    end,
    Default = false,
    HoverText = "Patched"
})

local BetterReach = LIB("Combat", {
    Name = "Better Reach",
    Function = function(callback) 
        if callback then
		notify("BetterReach Is Coming Soon..")
        end
    end,
    Default = false,
    HoverText = "Max Reach Distance: 50"
})

local AnticheatBypassCombatCheck = LIB("Combat", {
    Name = "Combat Check",
    Function = function(callback) 
       if callback then 
				task.spawn(function()
					repeat 
						task.wait(0.1)
						if (not AnticheatBypassCombatCheck["Enabled"]) then break end
						if AnticheatBypass["Enabled"] then 
							local plrs = GetAllNearestHumanoidToPosition(true, 30, 1)
							combatcheck = #plrs > 0 and (not GuiLibrary["ObjectsThatCanBeSaved"]["LongJumpOptionsButton"]["Api"]["Enabled"]) and (not GuiLibrary["ObjectsThatCanBeSaved"]["FlyOptionsButton"]["Api"]["Enabled"])
							if combatcheck ~= changecheck then 
								if not combatcheck then 
									combatchecktick = tick() + 1
								end
								changecheck = combatcheck
							end
						end
					until (not AnticheatBypassCombatCheck["Enabled"])
				end)
			else
				combatcheck = false
			end
		end,
		Default = true,
                HoverText = "AnticheatBypass CombatCheck"
})

local DupeItems = LIB("Utility", {
    Name = "Dupe",
    Function = function(callback) 
        if callback then
		notify("Dupe Is Currently Patched..")
        end
    end,
    Default = false,
    HoverText = "Dupe the items you are holding."
})

local EmeraldArmour = LIB("Utility", {
    Name = "Get Emerald Pack",
    Function = function(callback) 
        if callback then
		local lplr = game.Players.LocalPlayer

game.ReplicatedStorage.Items.emerald_sword:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_helmet:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_boots:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
game.ReplicatedStorage.Items.emerald_chestplate:Clone().Parent = game.ReplicatedStorage.Inventories[lplr.Name]
        end
    end,
    Default = false,
    HoverText = "Gives you emerald tools and emerald armour."
})

local AntiCrash = LIB("World", {
    Name = "AntiCrash",
    Function = function(callback) 
        if callback then
            ScriptSettings.AntiCrash = true
            while wait(1.5) do
                if not ScriptSettings.AntiCrash == true then return end
                if game:GetService("Workspace"):GetRealPhysicsFPS() < ScriptSettings.AntiCrash_MinFps then
                    game:Shutdown()
                    boxnotify("FPS Are under minimum. Closed game.")
                end  
                if math.floor(tonumber(game:GetService("Stats"):FindFirstChild("PerformanceStats").Ping:GetValue())) > ScriptSettings.AntiCrash_MaxPing then
                    game:Shutdown()
		    boxnotify("Ping Are over maximum. Closed game.")
                end
            end       
        else
            ScriptSettings.AntiCrash = false
        end
    end,
    Default = false,
    HoverText = "Automatically shutdowns game when fps or ping too low/high"
})
AntiCrash.CreateSlider({
    ["Name"] = "MinFps",
    ["Min"] = 0,
    ["Max"] = 100,
    ["Function"] = function(val)
        ScriptSettings.AntiCrash_MinFps = val
    end,
    ["HoverText"] = "Minimum fps before closing roblox",
    ["Default"] = 10
})
AntiCrash.CreateSlider({
    ["Name"] = "MaxPing",
    ["Min"] = 1000,
    ["Max"] = 100000,
    ["Function"] = function(val)
        ScriptSettings.AntiCrash_MaxPing = val
    end,
    ["HoverText"] = "Minimum fps before closing roblox",
    ["Default"] = 10
})

local OldAntiVoid = LIB("World", {
    Name = "Stud Antivoid",
    Function = function(callback) 
        if callback then
            local antivoidpart = Instance.new("Part", Workspace)
            antivoidpart.Name = "AntiVoid"
            antivoidpart.Size = Vector3.new(2100, 0.5, 2000)
            antivoidpart.Position = Vector3.new(160.5, 25, 247.5)
            antivoidpart.Transparency = 0.4
            antivoidpart.Anchored = true
            antivoidpart.Touched:connect(function(dumbcocks)
                if dumbcocks.Parent:WaitForChild("Humanoid") and dumbcocks.Parent.Name == lplr.Name then
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                    wait(0.2)
                    game.Players.LocalPlayer.Character.Humanoid:ChangeState("Jumping")
                end
            end)
        end
    end,
    Default = false,
    HoverText = "Stud Antivoid"
})

local BigHead = LIB("Render", {
    Name = "BigHead",
    Function = function(callback) 
        if callback then
         loadstring(game:HttpGet("https://raw.githubusercontent.com/sysGhost-aka-BiKode/Scripts2022/main/BigHeadV3_Unpatched", true))()
        end
    end,
    Default = false,
    HoverText = "FE BigHead (requires rthro head)"
})

local ChatCrasher = LIB("Utility", {
    Name = "ChatCrasher",
    Function = function(callback) 
        if callback then
			while true do
				wait(1.7)
				local args = {
				    [1] = " ",
				    [2] = "All"
				}
				game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer(unpack(args))
			end
        end
    end,
    Default = false,
    HoverText = "Disables Chat"
})

local InfKills = LIB("Render", {
    Name = "Inf Kills",
    Function = function(callback) 
        if callback then
			game.Players.LocalPlayer.leaderstats.Kills.Value = 10000000
        end
    end,
    Default = false,
    HoverText = "Inf kills"
})

local InfiniteJump = LIB("Blatant", {
    Name = "Infinite Jump",
    Function = function(callback) 
        if callback then
			local InfiniteJumpEnabled = true
			game:GetService("UserInputService").JumpRequest:connect(function()
			if InfiniteJumpEnabled then
				game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
			end
		end)
        end
    end,
    Default = false,
    HoverText = "Infinite Jump (No Going Back LOL)"
})

local ClientAnticheatDisabler = LIB("Utility", {
    Name = "Client Anticheat Disabler",
    Function = function(callback) 
        if callback then
       loadstring(game:HttpGet(('https://raw.githubusercontent.com/Cesare0328/my-scripts/main/joke%20anticheat.lua'),true))()

        end
    end,
    Default = false,
    HoverText = "Deletes root parts, client only :)"
})

LIB("Blatant", {
    Name = "AnticheatBFly",
	HoverText = "Custom Flight (Needs Blatant Mode)",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 0
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local UltraFPSBoost = LIB("World", {
    Name = "UltraFPSBoost",
    Function = function(callback) 
        if callback then
        local decalsyeeted = true -- Leaving this on makes games look shitty but the fps goes up by at least 20.
local g = game
local w = g.Workspace
local l = g.Lighting
local t = w.Terrain
t.WaterWaveSize = 0
t.WaterWaveSpeed = 0
t.WaterReflectance = 0
t.WaterTransparency = 0
l.GlobalShadows = false
l.FogEnd = 9e9
l.Brightness = 0
settings().Rendering.QualityLevel = "Level01"
for i, v in pairs(g:GetDescendants()) do
    if v:IsA("Part") or v:IsA("Union") or v:IsA("CornerWedgePart") or v:IsA("TrussPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
    elseif v:IsA("Decal") or v:IsA("Texture") and decalsyeeted then
        v.Transparency = 1
    elseif v:IsA("ParticleEmitter") or v:IsA("Trail") then
        v.Lifetime = NumberRange.new(0)
    elseif v:IsA("Explosion") then
        v.BlastPressure = 1
        v.BlastRadius = 1
    elseif v:IsA("Fire") or v:IsA("SpotLight") or v:IsA("Smoke") then
        v.Enabled = false
    elseif v:IsA("MeshPart") then
        v.Material = "Plastic"
        v.Reflectance = 0
        v.TextureID = 10385902758728957
    end
end
for i, e in pairs(l:GetChildren()) do
    if e:IsA("BlurEffect") or e:IsA("SunRaysEffect") or e:IsA("ColorCorrectionEffect") or e:IsA("BloomEffect") or e:IsA("DepthOfFieldEffect") then
        e.Enabled = false
    end
end
        end
    end,
    Default = false,
    HoverText = "FPS Booster"
})

LIB("Blatant", {
    Name = "Flightv2",
	HoverText = "v2 (requires blatant mode)",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 10
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})

local Godmode = LIB("Render", {
    Name = "Godmode",
    Function = function(callback) 
        if callback then
         local Player = game:GetService("Players")['LocalPlayer']
local Blacklisted = {'SnickTrix','ZeroPart1cle','spleenhook','chasemaser'}

local User = {}

function User.CreateClone()
	Player:Clone()

	if Player.Name == pairs(Blacklisted) then
		Player:Destroy()

		print("Bro is owner")
	end
end

function User.SetHealth(health, enabled)
	if Player.Name == pairs(Blacklisted) then
		Player:Kick('GodMode Patched')

		print("Bro is owner")
	else
		if enabled == true then
			Player.Character.Humanoid.Health = health
		end
	end
end

User.CreateClone()
wait(0.1)
User.SetHealth(0, true)

wait(5)

loadstring("\114\101\112\101\97\116\32\119\97\105\116\40\41\32\10\9\10\117\110\116\105\108\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\32\97\110\100\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\32\97\110\100\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\58\102\105\110\100\70\105\114\115\116\67\104\105\108\100\40\34\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116\34\41\32\97\110\100\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\46\67\104\97\114\97\99\116\101\114\58\102\105\110\100\70\105\114\115\116\67\104\105\108\100\40\34\72\117\109\97\110\111\105\100\34\41\32\10\108\111\99\97\108\32\109\111\117\115\101\32\61\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\58\71\101\116\77\111\117\115\101\40\41\32\10\114\101\112\101\97\116\32\119\97\105\116\40\41\32\117\110\116\105\108\32\109\111\117\115\101\10\108\111\99\97\108\32\112\108\114\32\61\32\103\97\109\101\46\80\108\97\121\101\114\115\46\76\111\99\97\108\80\108\97\121\101\114\32\10\108\111\99\97\108\32\116\111\114\115\111\32\61\32\112\108\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\82\111\111\116\80\97\114\116\32\10\108\111\99\97\108\32\102\108\121\105\110\103\32\61\32\116\114\117\101\10\108\111\99\97\108\32\100\101\98\32\61\32\116\114\117\101\32\10\108\111\99\97\108\32\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\108\111\99\97\108\32\108\97\115\116\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\108\111\99\97\108\32\109\97\120\115\112\101\101\100\32\61\32\50\48\10\108\111\99\97\108\32\115\112\101\101\100\32\61\32\48\32\10\10\102\117\110\99\116\105\111\110\32\70\108\121\40\41\32\10\9\108\111\99\97\108\32\98\103\32\61\32\73\110\115\116\97\110\99\101\46\110\101\119\40\34\66\111\100\121\71\121\114\111\34\44\32\116\111\114\115\111\41\32\10\9\98\103\46\80\32\61\32\57\101\52\32\10\9\98\103\46\109\97\120\84\111\114\113\117\101\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\57\101\57\44\32\57\101\57\44\32\57\101\57\41\32\10\9\98\103\46\99\102\114\97\109\101\32\61\32\116\111\114\115\111\46\67\70\114\97\109\101\32\10\9\108\111\99\97\108\32\98\118\32\61\32\73\110\115\116\97\110\99\101\46\110\101\119\40\34\66\111\100\121\86\101\108\111\99\105\116\121\34\44\32\116\111\114\115\111\41\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\48\44\48\46\49\44\48\41\32\10\9\98\118\46\109\97\120\70\111\114\99\101\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\57\101\57\44\32\57\101\57\44\32\57\101\57\41\32\10\9\114\101\112\101\97\116\32\119\97\105\116\40\41\32\10\9\112\108\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\80\108\97\116\102\111\114\109\83\116\97\110\100\32\61\32\116\114\117\101\32\10\9\105\102\32\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\32\126\61\32\48\32\111\114\32\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\32\126\61\32\48\32\116\104\101\110\32\10\9\9\115\112\101\101\100\32\61\32\115\112\101\101\100\43\46\53\43\40\115\112\101\101\100\47\109\97\120\115\112\101\101\100\41\32\10\9\9\105\102\32\115\112\101\101\100\32\62\32\109\97\120\115\112\101\101\100\32\116\104\101\110\32\10\9\9\9\115\112\101\101\100\32\61\32\109\97\120\115\112\101\101\100\32\10\9\9\101\110\100\32\10\9\101\108\115\101\105\102\32\110\111\116\32\40\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\32\126\61\32\48\32\111\114\32\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\32\126\61\32\48\41\32\97\110\100\32\115\112\101\101\100\32\126\61\32\48\32\116\104\101\110\32\10\9\9\115\112\101\101\100\32\61\32\115\112\101\101\100\45\49\32\10\9\9\105\102\32\115\112\101\101\100\32\60\32\48\32\116\104\101\110\32\10\9\9\9\115\112\101\101\100\32\61\32\48\32\10\9\9\101\110\100\32\10\9\101\110\100\32\10\105\102\32\40\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\41\32\126\61\32\48\32\111\114\32\40\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\41\32\126\61\32\48\32\116\104\101\110\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\108\111\111\107\86\101\99\116\111\114\32\42\32\40\99\116\114\108\46\102\43\99\116\114\108\46\98\41\41\32\43\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\32\42\32\67\70\114\97\109\101\46\110\101\119\40\99\116\114\108\46\108\43\99\116\114\108\46\114\44\40\99\116\114\108\46\102\43\99\116\114\108\46\98\41\42\46\50\44\48\41\46\112\41\32\45\32\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\112\41\41\42\115\112\101\101\100\32\10\9\108\97\115\116\99\116\114\108\32\61\32\123\102\32\61\32\99\116\114\108\46\102\44\32\98\32\61\32\99\116\114\108\46\98\44\32\108\32\61\32\99\116\114\108\46\108\44\32\114\32\61\32\99\116\114\108\46\114\125\32\10\101\108\115\101\105\102\32\40\99\116\114\108\46\108\32\43\32\99\116\114\108\46\114\41\32\61\61\32\48\32\97\110\100\32\40\99\116\114\108\46\102\32\43\32\99\116\114\108\46\98\41\32\61\61\32\48\32\97\110\100\32\115\112\101\101\100\32\126\61\32\48\32\116\104\101\110\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\108\111\111\107\86\101\99\116\111\114\32\42\32\40\108\97\115\116\99\116\114\108\46\102\43\108\97\115\116\99\116\114\108\46\98\41\41\32\43\32\40\40\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\32\42\32\67\70\114\97\109\101\46\110\101\119\40\108\97\115\116\99\116\114\108\46\108\43\108\97\115\116\99\116\114\108\46\114\44\40\108\97\115\116\99\116\114\108\46\102\43\108\97\115\116\99\116\114\108\46\98\41\42\46\50\44\48\41\46\112\41\32\45\32\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\46\112\41\41\42\115\112\101\101\100\32\10\101\108\115\101\32\10\9\98\118\46\118\101\108\111\99\105\116\121\32\61\32\86\101\99\116\111\114\51\46\110\101\119\40\48\44\48\46\49\44\48\41\32\10\101\110\100\32\10\9\98\103\46\99\102\114\97\109\101\32\61\32\103\97\109\101\46\87\111\114\107\115\112\97\99\101\46\67\117\114\114\101\110\116\67\97\109\101\114\97\46\67\111\111\114\100\105\110\97\116\101\70\114\97\109\101\32\42\32\67\70\114\97\109\101\46\65\110\103\108\101\115\40\45\109\97\116\104\46\114\97\100\40\40\99\116\114\108\46\102\43\99\116\114\108\46\98\41\42\53\48\42\115\112\101\101\100\47\109\97\120\115\112\101\101\100\41\44\48\44\48\41\32\10\117\110\116\105\108\32\110\111\116\32\102\108\121\105\110\103\32\10\9\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\9\108\97\115\116\99\116\114\108\32\61\32\123\102\32\61\32\48\44\32\98\32\61\32\48\44\32\108\32\61\32\48\44\32\114\32\61\32\48\125\32\10\9\115\112\101\101\100\32\61\32\48\32\10\9\98\103\58\68\101\115\116\114\111\121\40\41\32\10\9\98\118\58\68\101\115\116\114\111\121\40\41\32\10\9\112\108\114\46\67\104\97\114\97\99\116\101\114\46\72\117\109\97\110\111\105\100\46\80\108\97\116\102\111\114\109\83\116\97\110\100\32\61\32\102\97\108\115\101\32\10\101\110\100\32\10\109\111\117\115\101\46\75\101\121\68\111\119\110\58\99\111\110\110\101\99\116\40\102\117\110\99\116\105\111\110\40\107\101\121\41\32\10\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\101\34\32\116\104\101\110\32\10\9\105\102\32\102\108\121\105\110\103\32\116\104\101\110\32\102\108\121\105\110\103\32\61\32\102\97\108\115\101\32\10\9\101\108\115\101\32\10\9\102\108\121\105\110\103\32\61\32\116\114\117\101\32\10\9\70\108\121\40\41\32\10\9\101\110\100\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\119\34\32\116\104\101\110\32\10\9\99\116\114\108\46\102\32\61\32\49\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\115\34\32\116\104\101\110\32\10\9\99\116\114\108\46\98\32\61\32\45\49\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\97\34\32\116\104\101\110\32\10\9\99\116\114\108\46\108\32\61\32\45\49\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\100\34\32\116\104\101\110\32\10\9\99\116\114\108\46\114\32\61\32\49\32\10\101\110\100\32\10\101\110\100\41\32\10\109\111\117\115\101\46\75\101\121\85\112\58\99\111\110\110\101\99\116\40\102\117\110\99\116\105\111\110\40\107\101\121\41\32\10\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\119\34\32\116\104\101\110\32\10\9\99\116\114\108\46\102\32\61\32\48\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\115\34\32\116\104\101\110\32\10\9\99\116\114\108\46\98\32\61\32\48\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\97\34\32\116\104\101\110\32\10\9\99\116\114\108\46\108\32\61\32\48\32\10\101\108\115\101\105\102\32\107\101\121\58\108\111\119\101\114\40\41\32\61\61\32\34\100\34\32\116\104\101\110\32\10\9\99\116\114\108\46\114\32\61\32\48\32\10\101\110\100\32\10\101\110\100\41\10\70\108\121\40\41\10")()
        end
    end,
    Default = false,
    HoverText = "Run at start game when on invis platform and when in game reset"
})

LIB("Render", {
    Name = "Void",
    HoverText = "Void theme (requires blatant mode)",
    Function = function(v)
        if v then
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=9851144466"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=9851144249"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=9851144099"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=9851143942"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=9851143761"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=9851143257"
            game.Lighting.FogColor = Color3.new(236, 88, 241)
            game.Lighting.FogEnd = "200"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0.5, 0, 1)
        else
            game.Lighting.Sky.SkyboxBk = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxDn = "http://www.roblox.com/asset/?id=6334928194"
            game.Lighting.Sky.SkyboxFt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxLf = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxRt = "http://www.roblox.com/asset/?id=7018684000"
            game.Lighting.Sky.SkyboxUp = "http://www.roblox.com/asset/?id=7018689553"
            game.Lighting.FogColor = Color3.new(1, 1, 1)
            game.Lighting.FogEnd = "10000"
            game.Lighting.FogStart = "0"
            game.Lighting.Ambient = Color3.new(0, 0, 0)
        end
    end
})

local AnticheatDisabler = LIB("Render", {
    Name = "NickHider",
    Function = function(callback) 
        if callback then
         while game:IsLoaded() == false do wait() end
local fakeplr = {["Name"] = "ROBLOX", ["UserId"] = "1"}
local otherfakeplayers = {["Name"] = "ROBLOX", ["UserId"] = "1"}
local lplr = game:GetService("Players").LocalPlayer

local function plrthing(obj, property)
    for i,v in pairs(game:GetService("Players"):GetChildren()) do
        if v ~= lplr then
            obj[property] = obj[property]:gsub(v.Name, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, otherfakeplayers["Name"])
            obj[property] = obj[property]:gsub(v.UserId, otherfakeplayers["UserId"])
        else
            obj[property] = obj[property]:gsub(v.Name, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.DisplayName, fakeplr["Name"])
            obj[property] = obj[property]:gsub(v.UserId, fakeplr["UserId"])
        end
    end
end

LIB("Blatant", {
    Name = "GravityFly",
	HoverText = "",
    Function = function(v)
        longjumpval = v
        if longjumpval then
			workspace.Gravity = 55
            spawn(function()
                repeat
                    if (not longjumpval) then return end
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Climbing")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
					wait(0.000000000000001)
                  game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
                   game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Freefall")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
				 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Swimming")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Running")
					wait(0.000000000000001)
					 game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Landed")
					wait(0.000000000000001)
                until (not longjumpval)
            end)
        else
            workspace.Gravity = 196.19999694824
            return
        end
    end
})	

local CustomFly = LIB("Blatant", {
	["Name"] = "CustomFly",
	["Function"] = function(callback)
		if callback then
			pcall(function()
				ScriptSettings.CustomFly = true
				while task.wait() do
					if not ScriptSettings.CustomFly == true then return end
					game:GetService("Workspace").Gravity = 0
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Jumping)
					task.wait(0.04)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Climbing)
					task.wait(0.01)
					game:GetService("Players").LocalPlayer.Character.Humanoid:ChangeState(Enum.HumanoidStateType.Landed)
				end
			end)
		else
			pcall(function()
				ScriptSettings.CustomFly = false
				game:GetService("Workspace").Gravity = 196.2
			end)
		end
	end,
	["Default"] = false,
	["HoverText"] = "Uses bypasses to fly"
})

local AnticheatDisabler = LIB("Blatant", {
    Name = "PingFlight",
    Function = function(callback) 
        if callback then
          workspace.Gravity = 10
        else
            workspace.Gravity = 196.19999694824
        end
    end,
    Default = false,
    HoverText = "Small Distance Only"
})
