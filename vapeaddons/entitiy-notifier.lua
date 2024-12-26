--[[
module from abyss vape
]]

repeat task.wait() until game:IsLoaded()
repeat task.wait() until shared.GuiLibrary
local GuiLibrary = shared.GuiLibrary
local ScriptSettings = {}
local UIS = game:GetService("UserInputService")
local LIB = function(tab, argstable) 
    return GuiLibrary["ObjectsThatCanBeSaved"][tab.."Window"]["Api"].CreateOptionsButton(argstable)
end

function infonotify(title, content, duration)
	local frame = GuiLibrary["CreateNotification"](title or "Vape", content or "nil", duration or 5, "assets/InfoNotification.png")
	frame.Frame.Frame.ImageColor3 = Color3.fromRGB(255, 64, 64)
end

local EntityNotifier = LIB("World", {
        Name = "EntityNotifier",
        HoverText = "When an entity spawns, Vape notifies you the entities name. [CREDS TO ABYSS VAPE & GODCLUTCHER]",
        Function = function(callback)  
            if callback then
            local CollectionService = game:GetService("CollectionService")

                CollectionService:GetInstanceAddedSignal("GolemBoss"):Connect(function()
                    infonotify("pkvxpe", "Entity: GolemBoss has spawned.", 5) 
                end)
                
                CollectionService:GetInstanceAddedSignal("DiamondGuardian"):Connect(function()
                    infonotify("pkvxpe", "Entity: Diamond Guardian has spawned.", 5)
                end)
                
                CollectionService:GetInstanceAddedSignal("Monster"):Connect(function()
                    infonotify("pkvxpe", "Entity: Monster has spawned.", 5)
                end)

                CollectionService:GetInstanceAddedSignal("GuardianOfDream"):Connect(function()
                    infonotify("pkvxpe", "Entity: Guardian of Dream has spawned.", 5)
                end)
            end
        end
    })
