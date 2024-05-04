local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "7yd7  Hub",
    SubTitle = "",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    Script = Window:AddTab({ Title = "Script", Icon = "scroll" }),
     game = Window:AddTab({ Title = "game", Icon = "usb" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do
    Fluent:Notify({
        Title = "Notification",
        Content = "This is a notification",
        SubContent = "SubContent",
        Duration = 5 
    })


-- سكربت جميع مابات

		Tabs.Script:AddSection("player")

    local Slider = Tabs.Script:AddSlider("Slider", {
        Title = "WalkSpeed",
        Description = "Adjust the speed of a personal player",
        Default = 16,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
        end
    })

        Tabs.Script:AddButton({
        Title = "Reset WalkSpeed",
        Description = "Reset WalkSpeed normal",
        Callback = function()
            Window:Dialog({
                Title = "Reset WalkSpeed",
                Content = "Are you sure you want to reset the WalkSpeed?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                   game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
    })


    
    local Slider = Tabs.Script:AddSlider("Slider", {
        Title = "JumpPower",
        Description = "Adjust the JumpPower of a personal player",
        Default = 50,
        Min = 0,
        Max = 500,
        Rounding = 1,
        Callback = function(Value)
            game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
        end
    })

        Tabs.Script:AddButton({
        Title = "Reset JumpPower",
        Description = "Reset JumpPower normal",
        Callback = function()
            Window:Dialog({
                Title = "Reset JumpPower",
                Content = "Are you sure you want to reset the JumpPower?",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                   game.Players.LocalPlayer.Character.Humanoid.JumpPower = 50
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
    })

local Toggle = Tabs.Script:AddToggle("MyToggle", {Title = "InfiniteJump", Default = false })

    Toggle:OnChanged(function()

        getgenv().InfiniteJumpEnabled =  Options.MyToggle.Value
    end)

    Options.MyToggle:SetValue(false)

    coroutine.wrap(function()
game:GetService("UserInputService").JumpRequest:connect(function()
	if getgenv().InfiniteJumpEnabled == true  then		
        game:GetService"Players".LocalPlayer.Character:FindFirstChildOfClass'Humanoid':ChangeState("Jumping")
end
end)
end)
    

-- سكربت لذي موجوده العاب
		Tabs.game:AddSection("game works Script")

    Tabs.game:AddButton({
        Title = "a dusty trip",
        Description = "Game Script",
        Callback = function()
            Window:Dialog({
                Title = "Teleport",
                Content = "Teleport to game a dusty trip",
                Buttons = {
                    {
                        Title = "Confirm",
                        Callback = function()
                     game:GetService("TeleportService"):Teleport(16389395869, game:GetService("Players").LocalPlayer)
                        end
                    },
                    {
                        Title = "Cancel",
                        Callback = function()
                        end
                    }
                }
            })
        end
    })


-- نهايه



SaveManager:SetLibrary(Fluent)
InterfaceManager:SetLibrary(Fluent)


SaveManager:IgnoreThemeSettings()

SaveManager:SetIgnoreIndexes({})


InterfaceManager:SetFolder("FluentScriptHub")

InterfaceManager:BuildInterfaceSection(Tabs.Settings)


Window:SelectTab(1)

Fluent:Notify({
    Title = "Fluent",
    Content = "The script has been loaded.",
    Duration = 8
})


SaveManager:LoadAutoloadConfig()
end