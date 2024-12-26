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

run(function()
    local AntiDeath: vapemodule = {Enabled = false}
    local AntiDeathMode: vapedropdown = {Value = 'Velocity'}
    local AntiDeathHealth: vapeslider = {Value = 50}
    local AntiDeathVelo: vapeslider = {Value = 600}
    local AntiDeathAuto: vapetoggle = {Enabled = true}
    local AntiDeathNot: vapetoggle = {Enabled = true}
    
    local function get_health()
        return entityLibrary.character.Humanoid.Health
    end
    
    local boost, info, sent = false, false, false
    
    AntiDeath = LIB("Blatant", {
        Name = 'AntiDeath',
        Function = function(call: boolean)
            if call then
                task.spawn(function()
                    repeat task.wait()
                        if entityLibrary.isAlive then
                            if get_health() < AntiDeathHealth.Value and get_health() > 0 then
                                if not boost then
                                    if AntiDeathMode.Value == 'Velocity' then
                                        entityLibrary.character.HumanoidRootPart.Velocity += Vector3.new(0, AntiDeathVelo.Value, 0)
                                    else
                                        if not GuiLibrary.ObjectsThatCanBeSaved.InfiniteFlyOptionsButton.Api.Enabled then
                                            GuiLibrary.ObjectsThatCanBeSaved.InfiniteFlyOptionsButton.Api.ToggleButton(true)
                                            info = true
                                        end
                                    end
                                end
                                boost = true
                                if not sent and AntiDeathNot.Enabled then
                                    notify('pkvxpe'..AntiDeathMode.Value, 'Successfully performed action. Method: ' .. AntiDeathMode.Value, 3)
                                end
                                sent = true
                            elseif get_health() >= AntiDeathHealth.Value then
                                if info and AntiDeathAuto.Enabled then
                                    if GuiLibrary.ObjectsThatCanBeSaved.InfiniteFlyOptionsButton.Api.Enabled then
                                        GuiLibrary.ObjectsThatCanBeSaved.InfiniteFlyOptionsButton.Api.ToggleButton(false)
                                    end
                                end
                                boost, info, sent = false, false, false
                            end
                        end
                    until not AntiDeath.Enabled
                end)
            else
                boost, info, sent = false, false, false
            end
        end,
        HoverText = 'Stops you from dying',
    })
    
    AntiDeathMode = AntiDeath.CreateDropdown({
        Name = 'Mode',
        List = {'Velocity', 'Infinite'},
        Function = function() end
    })
    
    AntiDeathHealth = AntiDeath.CreateSlider({
        Name = 'Health',
        Min = 10,
        Max = 99,
        Function = function() end,
        Default = 50
    })
    
    AntiDeathVelo = AntiDeath.CreateSlider({
        Name = 'Velocity',
        Min = 100,
        Max = 600,
        Function = function() end,
        Default = 600
    })
    
    AntiDeathAuto = AntiDeath.CreateToggle({
        Name = 'Auto Disable',
        Function = function() end,
        Default = true
    })
    
    AntiDeathNot = AntiDeath.CreateToggle({
        Name = 'Notification',
        Function = function() end,
        Default = true
    })
end)
