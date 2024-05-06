
local Workspace = game:GetService("Workspace")

local storedFolder = Workspace:FindFirstChild("Stored")

if storedFolder then
else
-- انشاء ملف مخزن
local part = Instance.new("Folder")
part.Parent = workspace
part.Name = "Stored"
wait(.2)
local part = Instance.new("Folder")
part.Parent = workspace.Stored
part.Name = "Items"
-- انشاء ملف مخزن المكان
local part = Instance.new("Folder")
part.Parent = workspace.Stored
part.Name = "building"
wait(.2)
local part = Instance.new("Model")
part.Parent = workspace.Stored.building
part.Name = "Place Stored "
-- بناء مخزن
local part = Instance.new("Part")
part.Parent = workspace.Stored.building["Place Stored "]
part.Anchored  = true
part.Size = Vector3.new(101, 1, 93)
part.CFrame = CFrame.new(78.8746033, 117.800079, 8723.18066)
part.Name = "Part "
Wait(0.1)
local part = Instance.new("Part")
part.Parent = workspace.Stored.building["Place Stored "]
part.Anchored  = true
part.Size = Vector3.new(2, 17, 93)
part.CFrame = CFrame.new(128.374603, 126.800079, 8723.18066, 1, 0, 0, 0, 1, 0, 0, 0, 1)
part.Name = "Part "
Wait(0.1)
local part = Instance.new("Part")
part.Parent = workspace.Stored.building["Place Stored "]
part.Anchored  = true
part.Size = Vector3.new(2, 17, 102)
part.CFrame = CFrame.new(79.8745956, 126.800079, 8677.68066, 0, 0, 0.99999994, 0, 0.999999881, 0, -0.99999994, 0, 0)
part.Name = "Part "
Wait(0.1)
local part = Instance.new("Part")
part.Parent = workspace.Stored.building["Place Stored "]
part.Anchored  = true
part.Size = Vector3.new(2, 17, 102)
part.CFrame = CFrame.new(76.3746033, 126.800079, 8768.68066, 0, 0, 0.99999994, 0, 0.999999881, 0, -0.99999994, 0, 0)
part.Name = "Part "
Wait(0.1)
local part = Instance.new("Part")
part.Parent = workspace.Stored.building["Place Stored "]
part.Anchored  = true
part.Size = Vector3.new(2, 17, 102)
part.CFrame = CFrame.new(27.8745995, 126.800079, 8721.18066, 1, 0, 0, 0, 1, 0, 0, 0, 1)
part.Name = "Part "
Wait(0.1)
local part = Instance.new("Part")
part.Parent = workspace.Stored.building["Place Stored "]
part.Anchored  = true
part.Size = Vector3.new(101, 1, 93)
part.CFrame = CFrame.new(78.374588, 135.800079, 8723.18066, 1, 0, 0, 0, 1, 0, 0, 0, 1)
part.Transparency = "1"
part.Name = "Part "
end

local Fluent = loadstring(game:HttpGet("https://github.com/dawid-scripts/Fluent/releases/latest/download/main.lua"))()
local SaveManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/SaveManager.lua"))()
local InterfaceManager = loadstring(game:HttpGet("https://raw.githubusercontent.com/dawid-scripts/Fluent/master/Addons/InterfaceManager.lua"))()

local Window = Fluent:CreateWindow({
    Title = "7yd7  Hub",
    SubTitle = "a dusty trip v0.0.2",
    TabWidth = 160,
    Size = UDim2.fromOffset(580, 460),
    Acrylic = true, -- The blur may be detectable, setting this to false disables blur entirely
    Theme = "Dark",
    MinimizeKey = Enum.KeyCode.LeftControl -- Used when theres no MinimizeKeybind
})

--Fluent provides Lucide Icons https://lucide.dev/icons/ for the tabs, icons are optional
local Tabs = {
    gamenew = Window:AddTab({ Title = "a dusty trip", Icon = "gamepad-2" }),
    Script = Window:AddTab({ Title = "Script", Icon = "scroll" }),
     game = Window:AddTab({ Title = "game", Icon = "usb" }),
    Settings = Window:AddTab({ Title = "Settings", Icon = "settings" })
}

local Options = Fluent.Options

do


-- سكربت الماب


Tabs.gamenew:AddSection("Stuff")

-- اخذ جميع اشياء
Tabs.gamenew:AddButton({
    Title = "Bring all Stuff",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "Bring all Stuff",
            Content = "You want it to come all purpose",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                    -- سكربت يتم تفعيله :
                    local Players = game:GetService("Players")
                    local Workspace = game:GetService("Workspace")
                    local ReplicatedStorage = game:GetService("ReplicatedStorage")
-- تحديد اللاعب المحلي وـ humanoidRootPart الخاص به
local localPlayer = Players.LocalPlayer
local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                    -- جمع الأسماء من ReplicatedStorage.items و ReplicatedStorage.Liquids
                        local targetNames = {}
                        for _, item in ipairs(ReplicatedStorage.items:GetChildren()) do
                            if item:IsA("Instance") then
                                table.insert(targetNames, item.Name)
                            end
                        end
    
                        for _, item in ipairs(ReplicatedStorage.Liquids:GetChildren()) do
                            if item:IsA("Instance") then
                                table.insert(targetNames, item.Name)
                            end
                        end
    
                        -- دالة للبحث عن النماذج داخل Workspace
                        local function searchForModels(model)
                            for _, name in ipairs(targetNames) do
                                if model.Name == name then
                                    -- البحث عن الـ MeshPart داخل النموذج
                                    for _, part in ipairs(model:GetChildren()) do
                                        if part:IsA("MeshPart") then
                                            -- تحديد الموقع الجديد
                                            local newPosition = humanoidRootPart.CFrame.Position + (humanoidRootPart.CFrame.LookVector * 5)
                                            -- تحريك الـ MeshPart إلى الموقع الجديد
                                            part.CFrame = CFrame.new(newPosition)
                                        end
                                    end
                                end
                            end
                            -- البحث عن النماذج الفرعية
                            for _, child in ipairs(model:GetChildren()) do
                                if child:IsA("Model") then
                                    searchForModels(child)
                                end
                            end
                        end
    
                        -- البحث عن النماذج وتحريك الأجزاء
                        local models = Workspace:GetDescendants()
                        for _, model in ipairs(models) do
                            if model:IsA("Model") and not model:IsDescendantOf(game.Workspace.Stored.Items) then
                                searchForModels(model)
                            end
                        end
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})


-- اخذ بنزين
Tabs.gamenew:AddButton({
    Title = "Bring Liquids",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "Bring Liquids",
            Content = "You want it to come Liquids purpose",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        -- سكربت يتم تفعيله :
                        local Players = game:GetService("Players")
                        local Workspace = game:GetService("Workspace")
                        local ReplicatedStorage = game:GetService("ReplicatedStorage")
                        -- تحديد اللاعب الشخصي
                        local localPlayer = Players.LocalPlayer
                        local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
                        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
                        
                        -- جمع الأسماء من ReplicatedStorage.Liquids
                        local targetNames = {}
                        for _, item in ipairs(ReplicatedStorage.Liquids:GetChildren()) do
                            if item:IsA("Instance") then
                                table.insert(targetNames, item.Name)
                            end
                        end
                        
                        -- دالة تقوم بالبحث داخل النموذج للأجزاء باسم معين
                        local function searchForParts(model)
                            if not model:IsDescendantOf(game.Workspace.Stored.Items) then
                                for _, part in ipairs(model:GetDescendants()) do
                                    if part:IsA("MeshPart") then
                                        -- التحقق مما إذا كان اسم النموذج موجود في قائمة الأسماء
                                        for _, name in ipairs(targetNames) do
                                            if model.Name == name then
                                                -- تحديد الموقع الجديد
                                                local newPosition = humanoidRootPart.CFrame.Position + (humanoidRootPart.CFrame.LookVector * 5)
                                                -- تحريك الـ MeshPart إلى الموقع الجديد
                                                part.CFrame = CFrame.new(newPosition)
                                            end
                                        end
                                    end
                                end
                            end
                        end
                        
                        -- البحث عن النماذج وتحريك الأجزاء
                        for _, model in ipairs(Workspace:GetDescendants()) do
                            if model:IsA("Model") then
                                searchForParts(model)
                            end
                        end
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})

-- اخذ محرك
Tabs.gamenew:AddButton({
    Title = "Bring radiator + Engine",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "Bring radiator + Engine",
            Content = "You want it to come radiator + Engine purpose",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
            -- سكربت لذي يتم تفعيله :
            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            -- تحديد اللاعب الشخصي
            local localPlayer = Players.LocalPlayer
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            
            -- قائمة أسماء الأنماط التي تريد تحريكها
            local targetNames = {
                "radiator",
                "Engine", 
            }
            
            -- دالة للبحث في النماذج داخل Workspace
            local function searchForModels(model)
                -- التحقق مما إذا كانت النموذج داخل game.Workspace.Stored.Items
                if not model:IsDescendantOf(game.Workspace.Stored.Items) then
                    for _, name in ipairs(targetNames) do
                        if model.Name == name then
                            -- البحث عن الـ MeshPart داخل النموذج
                            for _, part in ipairs(model:GetChildren()) do
                                if part:IsA("MeshPart") then
                                    -- تحديد الموقع الجديد
                                    local newPosition = humanoidRootPart.CFrame.Position + (humanoidRootPart.CFrame.LookVector * 5)
                                    -- تحريك الـ MeshPart إلى الموقع الجديد
                                    part.CFrame = CFrame.new(newPosition)
                                end
                            end
                        end
                    end
                end
                -- البحث عن النماذج الفرعية
                for _, child in ipairs(model:GetChildren()) do
                    if child:IsA("Model") then
                        searchForModels(child)
                    end
                end
            end
      
      -- البحث عن النماذج وتحريك الأجزاء
            local models = Workspace:GetDescendants()
            for _, model in ipairs(models) do
                if model:IsA("Model") then
                    searchForModels(model)
                end
            end
    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})

-- اخذ جميع اكل حاليا
Tabs.gamenew:AddButton({
    Title = "Bring food",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "Bring food",
            Content = "You want it to come food purpose",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
            -- سكربت لذي يتم تفعيله :
            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            
            -- تحديد اللاعب الشخصي
            local localPlayer = Players.LocalPlayer
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            
            -- قائمة أسماء الأنماط التي تريد تحريكها
            local targetNames = {}
            
            local allObjects = Workspace:GetDescendants()
            
            -- البحث عن الأنماط التي تحتوي على "hunger" في اسمها
            for _, obj in ipairs(allObjects) do
                if string.find(obj.Name, "hunger") then
                    table.insert(targetNames, obj.Parent.Name)
                end
            end
            
            -- دالة للبحث في النماذج داخل Workspace
            local function searchForModels(model)
                -- التحقق مما إذا كانت النموذج داخل game.Workspace.Stored.Items
                if not model:IsDescendantOf(game.Workspace.Stored.Items) then
                    for _, name in ipairs(targetNames) do
                        if model.Name == name then
                            -- البحث عن الـ MeshPart داخل النموذج
                            for _, part in ipairs(model:GetChildren()) do
                                if part:IsA("MeshPart") then
                                    -- تحديد الموقع الجديد
                                    local newPosition = humanoidRootPart.CFrame.Position + (humanoidRootPart.CFrame.LookVector * 5)
                                    -- تحريك الـ MeshPart إلى الموقع الجديد
                                    part.CFrame = CFrame.new(newPosition)
                                end
                            end
                        end
                    end
                end
                -- البحث عن النماذج الفرعية
                for _, child in ipairs(model:GetChildren()) do
                    if child:IsA("Model") then
                        searchForModels(child)
                    end
                end
            end
            
            -- البحث عن النماذج وتحريك الأجزاء
            local models = Workspace:GetDescendants()
            for _, model in ipairs(models) do
                if model:IsA("Model") then
                    searchForModels(model)
                end
            end            
    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})

-- اخذ الكوين
Tabs.gamenew:AddButton({
    Title = "Bring BottleCap",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "Bring BottleCap",
            Content = "You want it to come BottleCap purpose",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
            -- سكربت لذي يتم تفعيله :
            local Players = game:GetService("Players")
            local Workspace = game:GetService("Workspace")
            local ReplicatedStorage = game:GetService("ReplicatedStorage")
            
            -- تحديد اللاعب الشخصي
            local localPlayer = Players.LocalPlayer
            local character = localPlayer.Character or localPlayer.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")
            
            -- قائمة أسماء الأنماط التي تريد تحريكها
            local targetNames = {
                "BottleCap",
            }
            
            -- دالة للبحث في النماذج داخل Workspace
            local function searchForModels(model)
                -- التحقق مما إذا كانت النموذج داخل game.Workspace.Stored.Items
                if not model:IsDescendantOf(game.Workspace.Stored.Items) then
                    for _, name in ipairs(targetNames) do
                        if model.Name == name then
                            -- البحث عن الـ MeshPart داخل النموذج
                            for _, part in ipairs(model:GetChildren()) do
                                if part:IsA("MeshPart") then
                                    -- تحديد الموقع الجديد
                                    local newPosition = humanoidRootPart.CFrame.Position + (humanoidRootPart.CFrame.LookVector * 5)
                                    -- تحريك الـ MeshPart إلى الموقع الجديد
                                    part.CFrame = CFrame.new(newPosition)
                                end
                            end
                        end
                    end
                end
                -- البحث عن النماذج الفرعية
                for _, child in ipairs(model:GetChildren()) do
                    if child:IsA("Model") then
                        searchForModels(child)
                    end
                end
            end
      
      -- البحث عن النماذج وتحريك الأجزاء
            local models = Workspace:GetDescendants()
            for _, model in ipairs(models) do
                if model:IsA("Model") then
                    searchForModels(model)
                end
            end
    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})


Tabs.gamenew:AddSection("Tool Stored")

Tabs.gamenew:AddButton({
    Title = "add/delete Tool Stored",
    Description = "",
    Callback = function()
                    
  local Players = game:GetService("Players")
  local ReplicatedStorage = game:GetService("ReplicatedStorage")
  local Workspace = game:GetService("Workspace")
  local UserInputService = game:GetService("UserInputService")
  
  local toolName = "Stored" -- اسم الأداة التي تريد التحقق من وجودها
  
  local player = game.Players.LocalPlayer -- قم بتغيير هذا بـ UserId الخاص باللاعب
  local backpack = player and player.Backpack -- احصل على حقيبة اللاعب
  
  if backpack then
      -- التحقق مما إذا كانت حقيبة اللاعب تحتوي على الأداة
      local tool = backpack:FindFirstChild(toolName)
      if not tool then
-- نقل اغراض بل مخزن
local tool = Instance.new("Tool")
tool.Name = "Stored" -- ضع اسم اداه لذي تريده

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")
local UserInputService = game:GetService("UserInputService")

local mouse = game.Players.LocalPlayer:GetMouse()

UserInputService.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        if tool:IsDescendantOf(game.Players.LocalPlayer.Character) then
            -- الحصول على الكائن الذي تم النقر عليه
            local targetItem = mouse.Target
            if targetItem and targetItem:IsA("MeshPart") then
                -- الحصول على parentName للكائن
                local parentName = targetItem.Parent

                -- التحقق من وجود parentName في ReplicatedStorage.Liquids
                local liquidsFolder = ReplicatedStorage.Liquids
                local liquidObjectInLiquids = liquidsFolder and liquidsFolder:FindFirstChild(parentName.Name)

                -- التحقق من وجود parentName في ReplicatedStorage.Items
                local itemsFolder = ReplicatedStorage.items
                local liquidObjectInItems = itemsFolder and itemsFolder:FindFirstChild(parentName.Name)

                -- النقل فقط إذا تم العثور على مطابقة في أحد المجلدين
                if liquidObjectInLiquids or liquidObjectInItems then
                    -- نقل parentName إلى workspace.Stored.Items
                    parentName.Parent = Workspace.Stored.Items
                -- البحث عن MeshPart داخل الكائن الوالد وتحديث CFrame لكل واحدة منها
                for _, child in ipairs(parentName:GetDescendants()) do
                    if child:IsA("MeshPart") then
                        child.CFrame = CFrame.new(79.0788498, 134.300034, 8725.1416)
                    end
                end
            end
        end
    end
end
end)

-- اضافة الأداة إلى الانفنتوري
tool.Parent = game.Players.LocalPlayer.Backpack

  else

      tool:Destroy()
  end
end
        
    end
})

Tabs.gamenew:AddButton({
    Title = "Teleport",
    Description = "",
    Callback = function()
        Window:Dialog({
            Title = "Teleport",
            Content = "Going to a place Stored ?",
            Buttons = {
                {
                    Title = "Yes",
                    Callback = function()
                        local player = game.Players.LocalPlayer
                        local rootPart = player.Character.HumanoidRootPart
                        
                        local lastPosition = rootPart.CFrame.Position
                        local lastRotation = rootPart.CFrame.Rotation
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(78.8835831, 139.300018, 8722.86035)
                        wait(5)
                        rootPart.CFrame = CFrame.fromEulerAngles(lastRotation.X, lastRotation.Y, lastRotation.Z) * CFrame.new(lastPosition)                           
                    end
                },
                {
                    Title = "No",
                    Callback = function()
                    end
                }
            }
        })
    end
})

Tabs.gamenew:AddSection("Stored")

-- دالة نقل العنصر
local function transferItem(itemName)
    local Player = game.Players.LocalPlayer -- إعادة تعريف المتغير Player
    -- التحقق مما إذا كان العنصر موجودًا
    local item = Workspace.Stored.Items:FindFirstChild(itemName)
    if item then
        local meshParts = item:GetDescendants()
        for _, meshPart in ipairs(meshParts) do
            if meshPart:IsA("MeshPart") then
                -- الحصول على موقع الشخصية وتحريك العنصر إليها
                local character = Player.Character
                local humanoidRootPart = character and character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    local forwardVector = humanoidRootPart.CFrame.LookVector
                    local newPosition = humanoidRootPart.Position + forwardVector * 5
                    meshPart.CFrame = CFrame.new(newPosition)
                end
            end
        end
        -- نقل العنصر إلى Workspace بعد تحديث موقعه
        item.Parent = Workspace
    else
    end
end


local Dropdown -- تعريف المتغير العام

-- دالة لتحديث قائمة المنسدلة
local function updateDropdownValues()
    local nameCounts = {}
    -- الحصول على عدد الأجزاء لكل عنصر
    for _, item in ipairs(Workspace.Stored.Items:GetChildren()) do
        if item:IsA("Instance") then
            local itemName = item.Name
            nameCounts[itemName] = (nameCounts[itemName] or 0) + 1
        end
    end

    -- تحديث القيم للقائمة المنسدلة
    local newDropdownValues = {}
    for itemName, count in pairs(nameCounts) do
        table.insert(newDropdownValues, itemName .. " x" .. count)
    end
    Dropdown:SetValues(newDropdownValues) -- تعيين القيم الجديدة للقائمة المنسدلة
end

-- دالة إنشاء الأزرار وتعيين القيم للقائمة المنسدلة
local function createButtons()
    local nameCounts = {}
    -- الحصول على عدد الأجزاء لكل عنصر
    for _, item in ipairs(Workspace.Stored.Items:GetChildren()) do
        if item:IsA("Instance") then
            local itemName = item.Name
            nameCounts[itemName] = (nameCounts[itemName] or 0) + 1
        end
    end

    -- إنشاء القيم للقائمة المنسدلة
    local dropdownValues = {}
    for itemName, count in pairs(nameCounts) do
        table.insert(dropdownValues, itemName .. " x" .. count)
    end

    -- إضافة القائمة المنسدلة والاستماع لتغييراتها
    Dropdown = Tabs.gamenew:AddDropdown("Dropdown", {
        Title = "Stuff Stored",
        Values = dropdownValues,
        Multi = false,
        Default = "nothing",
    })
    
    -- استماع لتغييرات القيم وتنفيذ دالة نقل العنصر
    Dropdown:OnChanged(function(selectedValue)
        if selectedValue then -- التحقق مما إذا كانت القيمة غير فارغة
            local itemName = selectedValue:match("^([^%s]+)") -- استخراج اسم العنصر
            transferItem(itemName) -- نقل العنصر
        end
    end)
end

-- استدعاء دالة إنشاء الأزرار وتعيين القيم للقائمة المنسدلة
createButtons()

-- تحديث قائمة المنسدلة
Tabs.gamenew:AddButton({
    Title = "Refresh Stored",
    Description = "",
    Callback = function()

                updateDropdownValues()
    end
})

    -- ذهاب مواقع طريق

    Tabs.gamenew:AddSection("Journey")

    Tabs.gamenew:AddButton({
        Title = "Teleport is the highest site Journey",
        Description = "It will be moved to the last location you can reach Journey",
        Callback = function()
local Players = game:GetService("Players")

local roadsFolder = Workspace.models.roads
local highestNumber = 0
local highestRoadPosition = Vector3.new()

-- تحديد أعلى رقم وموقعه
for _, road in ipairs(roadsFolder:GetChildren()) do
    local roadNumber = tonumber(road.Name)
    if roadNumber and roadNumber > highestNumber then
        highestNumber = roadNumber
        highestRoadPosition = road.Position
    end
end

-- إضافة ارتفاع لتجنب أي تعارض محتمل مع الأشياء في الطريق
highestRoadPosition = highestRoadPosition + Vector3.new(0, 5, 0)


-- الحصول على اللاعب الشخصي
local player = Players.LocalPlayer
if player then
    -- نقل موقع اللاعب إلى موقع الطريق
    player.Character:SetPrimaryPartCFrame(CFrame.new(highestRoadPosition))
end
        end
    })



    local Toggle = Tabs.gamenew:AddToggle("MyToggle", {Title = "Auto Teleport is the highest site Journey", Default = false })

    Toggle:OnChanged(function()

        getgenv().AutoJourney = Options.MyToggle.Value
    end)

    Options.MyToggle:SetValue(false)

    coroutine.wrap(function()
	if getgenv().AutoJourney == true  then		
        local Players = game:GetService("Players")

        local roadsFolder = Workspace.models.roads
        local highestNumber = 0
        local highestRoadPosition = Vector3.new()
        
        -- تحديد أعلى رقم وموقعه
        for _, road in ipairs(roadsFolder:GetChildren()) do
            local roadNumber = tonumber(road.Name)
            if roadNumber and roadNumber > highestNumber then
                highestNumber = roadNumber
                highestRoadPosition = road.Position
            end
        end
        
        -- إضافة ارتفاع لتجنب أي تعارض محتمل مع الأشياء في الطريق
        highestRoadPosition = highestRoadPosition + Vector3.new(0, 5, 0)
        
        
        -- الحصول على اللاعب الشخصي
        local player = Players.LocalPlayer
        if player then
            -- نقل موقع اللاعب إلى موقع الطريق
            player.Character:SetPrimaryPartCFrame(CFrame.new(highestRoadPosition))
        end
    end
end)

Tabs.gamenew:AddSection("weapon")

local Workspace = game:GetService("Workspace")

local namesToCheck = {"AK47", "RPG", "PumpShotgun", "Mac10", "GOLDAK47"} -- الأسماء التي تريد التحقق من وجودها في ملفات Workspace

local foundNames = {} -- جدول لتخزين الأسماء التي تم العثور عليها

-- استكشاف الملفات في Workspace
local allFiles = Workspace:GetDescendants()
for _, file in ipairs(allFiles) do
    -- التحقق مما إذا كان اسم الملف موجودًا في القائمة المحددة ولم يتم العثور عليه بالفعل
    for _, name in ipairs(namesToCheck) do
        if file.Name == name and not foundNames[name] then
            foundNames[name] = true -- قم بتعيين القيمة إلى true للإشارة إلى أن الاسم تم العثور عليه
        end
    end
end

-- تحويل قيم الجدول من بوليانية إلى نص
local dropdownValues = {}
for name, _ in pairs(foundNames) do
    table.insert(dropdownValues, name)
end

local selectedValue -- قم بتحديد متغير لتخزين القيمة المحددة في الـ Dropdown

local Dropdown = Tabs.gamenew:AddDropdown("Dropdown", {
    Title = "Dropdown",
    Values = dropdownValues, -- استخدام الأسماء التي تم التحقق منها
    Multi = false,
    Default = 1,
})

Dropdown:SetValue(dropdownValues[1]) -- تعيين قيمة افتراضية لأول اسم تم العثور عليه

Dropdown:OnChanged(function(Value)
    -- قم بتحديث قيمة المتغير المحددة
    selectedValue = Value
end)

Tabs.gamenew:AddButton({
    Title = "kill NPC",
    Description = "",
    Callback = function()
        -- استخدم الملف المحدد في السكربت هنا
        if selectedValue then
            -- تنفيذ البحث الثانوي
            local selectedInstance = nil
            local allFiles = game.Workspace:GetDescendants()
            for _, file in ipairs(allFiles) do
                if file.Name == selectedValue and not selectedInstance then
                    -- استخدام الملف الأول الذي تم العثور عليه
                    selectedInstance = file
                elseif file.Name == selectedValue then
                end
            end
            -- تنفيذ السكربت الخاص بك هنا باستخدام الملف المحدد
            if selectedInstance then
                local objectNames = {"mutant", "Bandit"}

                -- Function to check if an object name matches the search criteria
                local function isObjectNameMatching(objectName)
                  for _, name in ipairs(objectNames) do
                    if name == objectName then
                      return true
                    end
                  end
                  return false
                end

                -- Function to repeatedly attack the object until its health reaches zero
                local function attackObjectRepeatedly(instance)
                    while instance and instance:FindFirstChild("Humanoid") and instance.Humanoid.Health > 0 do
                        instance.Humanoid.Health = 0
                        local ohInstance1 = selectedInstance
                        local ohInstance2 = instance
                        game:GetService("ReplicatedStorage").Network.GunFramework_RequestDamage:FireServer(ohInstance1, ohInstance2)
                        wait(0.3)  -- تنتظر لثانية قبل إعادة الهجوم
                    end
                end

                for _, object in ipairs(game.Workspace:GetDescendants()) do
                    -- Check if object name matches the search criteria
                    if isObjectNameMatching(object.Name) then
                        -- Check if object's humanoid health is greater than zero
                        if object:FindFirstChild("Humanoid") and object.Humanoid.Health > 0 then
                            -- Start attacking the object repeatedly
                            attackObjectRepeatedly(object)
                        end
                    end
                end
            else
            end
        else
        end
    end
})



    
    Tabs.gamenew:AddSection("automatic")

Tabs.gamenew:AddButton({
    Title = "Eat",
    Description = "Eat all the map",
    Callback = function()

        local Workspace = game:GetService("Workspace")

        -- الحصول على جميع الكائنات داخل Workspace
        local allObjects = Workspace:GetDescendants()
        
        -- البحث عن الكائنات التي تحتوي على "hunger" في اسمها
        for _, obj in ipairs(allObjects) do
            if string.find(obj.Name, "hunger") then
        
        
        local ohInstance1 = obj.Parent
        
        game:GetService("ReplicatedStorage").eat:InvokeServer(ohInstance1)
        
            end
        end        
    end
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

