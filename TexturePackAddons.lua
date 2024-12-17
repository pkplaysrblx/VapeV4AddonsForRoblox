function LoadTexturePackAddons()
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

function loadlink(link)
  loadstring(game:HttpGet(link))()
end

local Acidic = LIB("TexturePack", {
    Name = "Acidic",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Acidic.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Devourer = LIB("TexturePack", {
    Name = "Devourer",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Devourer.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Enlightened = LIB("TexturePack", {
    Name = "Enlightened",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Enlightened.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local FatCat = LIB("TexturePack", {
    Name = "FatCat",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/FatCat.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Fury = LIB("TexturePack", {
    Name = "Fury",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Fury.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Makima = LIB("TexturePack", {
    Name = "Makima",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Makima.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Marin_Kitsawaba = LIB("TexturePack", {
    Name = "Marin Kitsawaba",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Marin-Kitsawaba.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Moon4Real = LIB("TexturePack", {
    Name = "Moon4Real",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Moon4Real.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Nebula = LIB("TexturePack", {
    Name = "Nebula",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Nebula.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Onyx = LIB("TexturePack", {
    Name = "Onyx",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Onyx.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Prime = LIB("TexturePack", {
    Name = "Prime",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Prime.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Simply = LIB("TexturePack", {
    Name = "Simply",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Simply.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Vile = LIB("TexturePack", {
    Name = "Vile",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Vile.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local VioletDreams = LIB("TexturePack", {
    Name = "Fury",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/VioletDreams.lua")
        end
    end,
    Default = false,
    HoverText = ""
})

local Wichtiger = LIB("TexturePack", {
    Name = "Wichtiger",
    Function = function(callback) 
        if callback then
          loadlink("https://raw.githubusercontent.com/qwertyui-is-back/TexturePacks/refs/heads/main/Wichtiger.lua")
        end
    end,
    Default = false,
    HoverText = ""
})
                              end

local StarterGui = game:GetService("StarterGui")

StarterGui:SetCore("SendNotification", {
    Title = "Warning",
    Text = "You have to run the custom vape loadstring.\nDid you run it?",
    Duration = 5,
    Button1 = "Yes",
    Button2 = "No",
    Callback = function(buttonClicked)
        if buttonClicked == "Yes" then
            LoadTexturePackIcons()
        elseif buttonClicked == "No" then

            StarterGui:SetCore("SendNotification", {
            Title = "Ok", -- The title of the notification
            Text = "The loadstring has been copied to the clipboard.", -- The content/text of the notification
            Duration = 5 -- Duration in seconds
            })
            setclipboard("loadstring(game:HttpGet('https://raw.githubusercontent.com/pkplaysrblx/VapeV4ForRoblox/refs/heads/main/NewMainScript.lua'))()")

        end
    end
})

