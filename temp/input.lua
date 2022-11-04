if syn then else
    loadstring(game:HttpGet('https://garfieldscripts.xyz/scripts/compat.lua'))()
end 
loadstring(game:HttpGet('https://garfieldscripts.xyz/resources/mt-api.lua'))()


local function loadScript()
    loadstring(game:HttpGet('https://garfieldscripts.xyz/unlisted-resources/countryjailroleplayUI.lua'))()
    

    -- Find valid gun locker
    local validGunLocker; for i,v in pairs(game:GetService("Workspace").Map:GetDescendants()) do -- Find valid guns 
        if v:IsA("ClickDetector") and v.Parent.Parent.Parent.Name == "Model" and v.Parent.Name == "M4A1" then 
            validGunLocker = v.Parent.Parent.Parent
            break 
        end
    end

    -- Respawn function 
    local function respawn()
        local char = game.Players.LocalPlayer.Character
        if char:FindFirstChildOfClass("Humanoid") then char:FindFirstChildOfClass("Humanoid"):ChangeState(15) end
        char:ClearAllChildren()
        local newChar = Instance.new("Model")
        newChar.Parent = workspace
    end 

    -- Notify function
    local function NotifyUser(message)
        game.StarterGui:SetCore("SendNotification", {
            Title = "Garfield";
            Text = message;
            Icon = "";
            Duration = 5;
        })
    end 
    local tweenService, tweenInfo = game:GetService("TweenService"), TweenInfo.new(2, Enum.EasingStyle.Sine)

    NotifyUser("Teleport-Bypass Created by garfield#9172")
    NotifyUser("Thank you Verified User "..game.Players.LocalPlayer.Name.." for using Garfieldwarez")
    local GlobalCooldownCountdown = false 
    local function GlobalCooldown()
        
    end 
    -- Proxo
    local function fireproximityprompt(Obj, Amount, Skip)
        if Obj.ClassName == "ProximityPrompt" then 
            Amount = Amount or 1
            local PromptTime = Obj.HoldDuration
            if Skip then 
                Obj.HoldDuration = 0
            end
            for i = 1, Amount do 
                Obj:InputHoldBegin()
                if not Skip then 
                    wait(Obj.HoldDuration)
                end
                Obj:InputHoldEnd()
            end
            Obj.HoldDuration = PromptTime
        else 
            error("userdata<ProximityPrompt> expected")
        end
    end
    for i,v in pairs(game.Workspace:GetDescendants()) do -- Take out anticheat walls. 
        if v:IsA("Part") and v.Name == "AAWall" then 
            print("[Script] Removed "..v.Name.." for being an anticheat wall. Detection averted.")
            v:Remove()
        end
    end
    for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Part") and v.Name ~= "Armory" and v:FindFirstChild("TouchInterest", true) then 
        v:Remove()
    end
    end
    local Playernoclip 

    -- TEleport Function
    local function teleport(pos)
        local CurrentPosition = game.Players.LocalPlayer.Character.HumanoidRootPart.Position 
        local CurrentCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
        local CFrameHook = game.Players.LocalPlayer.Character.HumanoidRootPart:AddGetHook("CFrame", CurrentCFrame)
        local PositionHook = game.Players.LocalPlayer.Character.HumanoidRootPart:AddGetHook("Position", CurrentPosition)
        local CFrameSethook  = game.Players.LocalPlayer.Character.HumanoidRootPart:AddSetHook("CFrame")
        local PositionSethook = game.Players.LocalPlayer.Character.HumanoidRootPart:AddSetHook("Position")
        tweenService:Create(game:GetService("Players")["LocalPlayer"].Character.HumanoidRootPart, tweenInfo, {CFrame = pos}):Play()
        task.wait(2.1)
        CFrameHook:Remove()
        PositionHook:Remove()
        CFrameSethook:Remove()
        PositionSethook:Remove()
    end 

    -- Find Keycard
    local ProperKeycard; for i,v in pairs(game.Workspace:GetDescendants()) do
        if v:IsA("Model") and v.Name == "Keycard" and v:FindFirstChild("ProximityPrompt", true) then
            ProperKeycard = v
        end
    end

    local MainTab = library:AddTab("Main"); 
    local ItemsColl1 = MainTab:AddColumn();
    local ItemsSection = ItemsColl1:AddSection("Items")

    local weaponGrabName; ItemsSection:AddList{text = "Get Weapon", skipflag=true, value = "M4A1", values = {"M4A1", "MP5","G36C","R870"}, callback = function(value)
        weaponGrabName = value 
    end};

    

    ItemsSection:AddButton{text = "Grab Weapon", callback = function()
        if not GlobalCooldown() then 
            local PlayerCoords = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            teleport(CFrame.new(-208.84100341796875, 55.140113830566406, -983.7052612304688)); NotifyUser("Teleporting to locker...")
            task.wait(1); NotifyUser("Grabbing!")
            local count = 0; while count ~= 30 do 
                fireclickdetector(validGunLocker.Weapons[tostring(weaponGrabName)]:FindFirstChild("ClickDetector",true)); count = count + 1; task.wait()
            end 
            teleport(PlayerCoords); NotifyUser("Completed gun grab!")
        end 
    end} 

    ItemsSection:AddSlider{text = "Keycards Amount", flag = "KeycardsAmount", min = 0, max = 150, value = 1, suffix = " Cards"}

    ItemsSection:AddButton{text = "Grab Keycard(s)", callback = function()
        if not GlobalCooldown() then
            local PlayerCoords = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; game:GetService("Workspace").Camera.CFrame = CFrame.new(-267.08374, 31.0741501, -1014.01318, 0.812557936, -0.23257038, 0.534472406, 0, 0.916950226, 0.399001777, -0.582880557, -0.324212074, 0.745075047)
            teleport(CFrame.new(-272.2189636230469, 26.5532283782959, -1021.5306396484375));  task.wait(1); local counter = 0; while counter ~= library.options["KeycardsAmount"].value do
                fireproximityprompt(ProperKeycard.Handle.Attachment.ProximityPrompt,1,true); counter = counter + 1; task.wait()
            end; NotifyUser("Completed keycard(s) grab!")
            teleport(PlayerCoords)
        end
    end} 

    

    ItemsSection:AddButton{text = "Refill Ammo", callback = function()
        if not GlobalCooldown() then
            local PlayerCoords = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame; game:GetService("Workspace").Camera.CFrame = CFrame.new(-220.290176, 59.1539383, -979.146057, 0.0124876956, 0.340226561, -0.940260649, 4.65661287e-10, 0.940333962, 0.340253085, 0.999922037, -0.00424897717, 0.011742604)
            teleport(CFrame.new(-213.20367431640625, 55.08953857421875, -979.2345581054688)) task.wait(1); fireproximityprompt(game:GetService("Workspace").Prox.Taser.InteractAttacment.ProximityPrompt, 1, true)
            NotifyUser("Compelted ammo refill");task.wait(0.5); teleport(PlayerCoords)
        end
    end}

    ItemsSection:AddDivider("Tool Dropping")

    ItemsSection:AddButton{text = "Drop All Tools", callback = function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") then
                v.Parent = game.Players.LocalPlayer.Character
                game.Players.LocalPlayer.Character.Script.DropTool:FireServer(); task.wait(0.3)
            end
        end
    end}

    ItemsSection:AddButton{text = "Drop All KeyCards", callback = function()
        for i,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
            if v:IsA("Tool") and v.Name == "Keycard" then
                v.Parent = game.Players.LocalPlayer.Character
                game.Players.LocalPlayer.Character.Script.DropTool:FireServer(); task.wait(0.3)
            end
        end
    end}

    local LocalPlayerSection = ItemsColl1:AddSection("Player")

    LocalPlayerSection:AddBind({text = "Respawn", flag = "LocalPlayerRespawn", nomouse = true, key = "none", callback = function()
        respawn(); NotifyUser("Please wait for the server to respawn you.")
    end});


    local playerNoClipLock; LocalPlayerSection:AddBind({text = "Noclip", flag = "LocalPlayerNoclip", nomouse = true, key = "none", callback = function()
        if playerNoClipLock then 
            Playernoclip = not Playernoclip
        end 
        playerNoClipLock = true
    end});
    local antiAFkLock, XPFARMTOGGLE, xpfarmlock; LocalPlayerSection:AddToggle{text = "Autofarm XP", skipflag = true, callback = function(value)
        if xpfarmlock then 
            if value then 
                teleport(CFrame.new(-248.273193359375, 38.08956527709961, -1033.3638916015625))
                if not antiAFkLock then 
                    for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
                        v:Disable()
                    end
                    NotifyUser("Enabled Anti-AFK")
                    antiAFkLock = true
                end 
                task.wait(3); NotifyUser("Autofarm enabled."); XPFARMTOGGLE = value 
            else
                NotifyUser("You may have to wait upwards of 15 seconds for the loop to completely stop.")
                XPFARMTOGGLE = value 
            end
        end 
        xpfarmlock = true
    end}

    spawn(function()
        while task.wait() do 
            pcall(function()
                if XPFARMTOGGLE then 
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(-219.3231201171875, 38.089569091796875, -1048.862548828125)); task.wait(5)
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(-238.2226104736328, 38.08956527709961, -1006.6663208007812)); task.wait(5)
                    game.Players.LocalPlayer.Character.Humanoid:MoveTo(Vector3.new(-276.3058166503906, 38.08956527709961, -1028.55859375)); task.wait(5)
                end 
            end)
        end 
    end)

    spawn(function()
        game:GetService('RunService').Stepped:connect(function()
            pcall(function()
                if Playernoclip then
                    if game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R6 then
                        game.Players.LocalPlayer.Character.Head.CanCollide = false
                        game.Players.LocalPlayer.Character.Torso.CanCollide = false
                        game.Players.LocalPlayer.Character["Left Leg"].CanCollide = false
                        game.Players.LocalPlayer.Character["Right Leg"].CanCollide = false
                    elseif game.Players.LocalPlayer.Character.Humanoid.RigType == Enum.HumanoidRigType.R15 then
                        game.Players.LocalPlayer.Character.Head.CanCollide = false
                        game.Players.LocalPlayer.Character.UpperTorso.CanCollide = false
                        game.Players.LocalPlayer.Character.LowerTorso.CanCollide = false
                        game.Players.LocalPlayer.Character.HumanoidRootPart.CanCollide = false
                    end
                end
            end) 
        end) 
    end)
    LocalPlayerSection:AddButton{text = "Respawn Manually", callback = function()
        respawn(); NotifyUser("Please wait for the server to respawn you.")
    end};

    LocalPlayerSection:AddButton{text = "Anti-AFK", callback = function()
        spawn(function()
            game.StarterGui:SetCore("SendNotification", {
            Title = "✅ Anti-AFK"; 
            Text = "Anti AFK has been enabled.";
            Icon = ""; 
            Duration = 5; 
        })
        end) 
        
        for i,v in pairs(getconnections(game.Players.LocalPlayer.Idled)) do
        v:Disable()
        end
    end} 


    local TeleportsColl1 = MainTab:AddColumn();
    local TeleportsSection = TeleportsColl1:AddSection("Teleports")
    TeleportsSection:AddButton{text = "Max Sec Block", callback = function()
        teleport(CFrame.new(-234.8805694580078, 27.227466583251953, -1041.3880615234375))
    end}
    TeleportsSection:AddButton{text = "Criminal Base", callback = function()
        teleport(CFrame.new(335.3301696777344, -6.599946022033691, -1388.0423583984375))
    end}
    TeleportsSection:AddButton{text = "Armory", callback = function()
        teleport(CFrame.new(-236.007080078125, 55.08953857421875, -982.4520263671875))
    end}
    TeleportsSection:AddButton{text = "Staff Hall", callback = function()
        teleport(CFrame.new(-258.9991760253906, 55.08953857421875, -1027.1658935546875))
    end}
    TeleportsSection:AddButton{text = "Cell Block A", callback = function()
        teleport(CFrame.new(-313.4588317871094, 55.08953857421875, -1103.89111328125))
    end}
    TeleportsSection:AddButton{text = "Cell Block B", callback = function()
        teleport(CFrame.new(-475.62628173828125, 55.08954620361328, -1097.0421142578125))
    end}
    TeleportsSection:AddButton{text = "Shower Room A", callback = function()
        teleport(CFrame.new(-345.3091125488281, 55.08953857421875, -1067.7685546875))
    end}
    TeleportsSection:AddButton{text = "Shower Room B", callback = function()
        teleport(CFrame.new(-452.5603332519531, 55.08953857421875, -1067.0770263671875))
    end}
    TeleportsSection:AddButton{text = "Yard", callback = function()
        teleport(CFrame.new(-395.7154846191406, 55.01561737060547, -1103.4844970703125))
    end}
    TeleportsSection:AddButton{text = "Canteen", callback = function()
        teleport(CFrame.new(-395.1101989746094, 55.08955001831055, -992.485107421875))
    end}
    TeleportsSection:AddButton{text = "Broom Closet", callback = function()
        teleport(CFrame.new(-403.64453125, 55.08953857421875, -1058.7445068359375))
    end}
    TeleportsSection:AddButton({text = "Solitary Confinement", callback = function()
        teleport(CFrame.new(-305.3085632324219, 26.1895694732666, -969.9143676757812))
    end})
    TeleportsSection:AddButton{text = "Keycard Room", callback = function()
        teleport(CFrame.new(-272.36376953125, 26.1895694732666, -1018.1090087890625))
    end}


    local espboxsection = TeleportsColl1:AddSection("ESP");
    local ESP = loadstring(game:HttpGet('https://garfieldscripts.xyz/resources/esp.lua'))()
    ESP:Toggle(true)
    ESP.Players = false
    ESP.Boxes = false
    ESP.Names = false
    ESP.Tracers = false
    ESP.TeamColor = false
    ESP.Color = Color3.new(1, 1, 1)

    espboxsection:AddToggle({text = "Master Switch", flag = "ESPEnabled", callback = function(value)
        ESP:Toggle(value)
    end})

    espboxsection:AddToggle({text = "Players", flag = "ESPPlayers", callback = function(value)
        ESP.Players = value
    end})

    espboxsection:AddToggle({text = "Boxes", flag = "ESPBoxes", callback = function(value)
        ESP.Boxes = value
    end})

    espboxsection:AddToggle({text = "Names", flag = "ESPNames", callback = function(value)
        ESP.Names = value
    end})

    espboxsection:AddToggle({text = "Tracers", flag = "ESPTracers", callback = function(value)
        ESP.Tracers = value
    end})

    espboxsection:AddToggle({text = "Use Team Color", flag = "ESPTeamColor", callback = function(value)
        ESP.TeamColor = value
    end})

    espboxsection:AddColor({text = "ESP Color", flag = "ESPColor", color = Color3.new(1, 1, 1), callback = function(color)
        ESP.Color = color
    end})

    espboxsection:AddDivider("Misc")

    espboxsection:AddButton{text = "Use Unnamed ESP", callback = function()
        loadstring(game:HttpGet('https://garfieldscripts.xyz/resources/unnamed-esp.lua'))()
    end}

    -- [Library Settings UI] -----------------------------------------------------------------------------------------------------------------------------------------------------
    local SettingsTab = library:AddTab("Settings"); 
    local SettingsColumn = SettingsTab:AddColumn(); 
    local SettingsColumn2 = SettingsTab:AddColumn(); 
    local SettingSection = SettingsColumn:AddSection("Menu"); 
    local ConfigSection = SettingsColumn2:AddSection("Configs");
    local Warning = library:AddWarning({type = "confirm"});

    SettingSection:AddBind({text = "Open / Close", flag = "UI Toggle", nomouse = true, key = "End", callback = function()
        library:Close();
    end});

    SettingSection:AddColor({text = "Accent Color", flag = "Menu Accent Color", color = Color3.new(0.599623620510101318359375, 0.447115242481231689453125, 0.97174417972564697265625), callback = function(color)
        if library.currentTab then
            library.currentTab.button.TextColor3 = color;
        end
        for i,v in pairs(library.theme) do
            v[(v.ClassName == "TextLabel" and "TextColor3") or (v.ClassName == "ImageLabel" and "ImageColor3") or "BackgroundColor3"] = color;
        end
    end});

    -- [Background List]
    local backgroundlist = {
        Floral = "rbxassetid://5553946656",
        Flowers = "rbxassetid://6071575925",
        Circles = "rbxassetid://6071579801",
        Hearts = "rbxassetid://6073763717"
    };

    -- [Background List]
    local back = SettingSection:AddList({text = "Background", max = 4, flag = "background", values = {"Floral", "Flowers", "Circles", "Hearts"}, value = "Floral", callback = function(v)
        if library.main then
            library.main.Image = backgroundlist[v];
        end
    end});

    -- [Background Color Picker]
    back:AddColor({flag = "backgroundcolor", color = Color3.new(), callback = function(color)
        if library.main then
            library.main.ImageColor3 = color;
        end
    end, trans = 1, calltrans = function(trans)
        if library.main then
            library.main.ImageTransparency = 1 - trans;
        end
    end});

    -- [Tile Size Slider]
    SettingSection:AddSlider({text = "Tile Size", min = 50, max = 500, value = 50, callback = function(size)
        if library.main then
            library.main.TileSize = UDim2.new(0, size, 0, size);
        end
    end});

    -- [Discord Button]
    SettingSection:AddButton({text = "Discord", callback = function()
        setclipboard("garfieldscripts.xyz/discord"); NotifyUser("Copied to clipboard!");
    end});

    -- [Config Box]
    ConfigSection:AddBox({text = "Config Name", skipflag = true});

    -- [Config List]
    ConfigSection:AddList({text = "Configs", skipflag = true, value = "", flag = "Config List", values = library:GetConfigs()});

    -- [Create Button]
    ConfigSection:AddButton({text = "Create", callback = function()
        library:GetConfigs();
        writefile(library.foldername .. "/" .. library.flags["Config Name"] .. library.fileext, "{}");
        library.options["Config List"]:AddValue(library.flags["Config Name"]);
    end});

    -- [Save Button]
    ConfigSection:AddButton({text = "Save", callback = function()
        local r, g, b = library.round(library.flags["Menu Accent Color"]);
        Warning.text = "Are you sure you want to save the current settings to config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
        if Warning:Show() then
            library:SaveConfig(library.flags["Config List"]);
        end
    end});

    -- [Load Button]
    ConfigSection:AddButton({text = "Load", callback = function()
        local r, g, b = library.round(library.flags["Menu Accent Color"]);
        Warning.text = "Are you sure you want to load config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
        if Warning:Show() then
            library:LoadConfig(library.flags["Config List"]);
        end
    end});

    -- [Delete Button]
    ConfigSection:AddButton({text = "Delete", callback = function()
        local r, g, b = library.round(library.flags["Menu Accent Color"]);
        Warning.text = "Are you sure you want to delete config <font color='rgb(" .. r .. "," .. g .. "," .. b .. ")'>" .. library.flags["Config List"] .. "</font>?";
        if Warning:Show() then
            local config = library.flags["Config List"];
            if table.find(library:GetConfigs(), config) and isfile(library.foldername .. "/" .. config .. library.fileext) then
                library.options["Config List"]:RemoveValue(config);
                delfile(library.foldername .. "/" .. config .. library.fileext);
            end
        end
    end});

    -- [Init] --------------------------------------------------------------------------------------------------------------------------------------------------------------------
    library:Init();
    library:selectTab(library.tabs[1]);
end 

-- Key System
local EntryCodes = {"8186887228"}


--\\ Key check function 
local inputtedKey; local function askForKey()
    rconsoleclear(); rconsoleprint('@@LIGHT_RED@@')
    rconsoleprint("Key System Loaded")
    rconsoleprint('@@WHITE@@'); rconsoleprint("\nThe link to get your key has been copied to your clipboard."); setclipboard("https://link-hub.net/405696/keysystemjail")
    rconsoleprint("\nYou must complete [1] linkvertise challenges to get your key.")
    rconsoleprint("\nIf you need any help, join the Discord server at https://garfieldscripts.xyz/discord.")
    rconsoleprint('@@LIGHT_MAGENTA@@')
    rconsoleprint("\n\nPlease enter your key: ")
    inputtedKey = rconsoleinput()
    if table.find(EntryCodes, inputtedKey) then
        rconsoleclear()
        rconsoleprint('@@LIGHT_GREEN@@')
        rconsoleprint("Key accepted!")
        rconsoleprint('@@WHITE@@')
        rconsoleprint("\nLoading dependencies..."); task.wait(0.5)
        -- Make file with key 
        writefile("countryjailkey.txt", tostring(inputtedKey))
        -- Send webhook message
        spawn(function()
            local msg =
            {
                ["content"] = "",
                ["embeds"] = {{
                    ["title"] = "Key System completed | Country Jail Roleplay",
                    ["description"] = "A key has been inputted. Enjoy the penny.",
                    ["type"] = "rich",
                    ["color"] = tonumber(0xfff800),
                    ["fields"] = {
                        {
                            ["name"] = "Data",
                            ["value"] = "Key used: "..tostring(inputtedKey),
                        }
                    },
                }}
            }
        syn.request(
            {
                Url = "https://websec.services/send/62aa35aec4c2139f0bca3eb2",
                Method = "POST",
                Headers = {
                    ["Content-Type"] = "application/json"
                },
                Body = game:GetService("HttpService"):JSONEncode(msg)
            }
        )
        end) 
        rconsoleprint("\nSaved your key...")
        task.wait(3)
        rconsoleclear()
        rconsoleprint('@@LIGHT_GREEN@@')
        rconsoleprint("Authed")
        loadScript()  -- Load 
    else
        rconsoleclear()
        rconsoleprint('@@LIGHT_RED@@')
        rconsoleprint("Your key was denied! Please make sure that it was entered correctly."); task.wait(2)
        askForKey()
    end 
end 

-- \\ Check for saved key 

if isfile("countryjailkey.txt") then 
    -- Read the file 
    if table.find(EntryCodes, tostring(readfile("countryjailkey.txt"))) then 
        rconsoleclear(); rconsoleprint("@@LIGHT_GREEN@@")
        rconsoleprint("Your previous key, "..tostring(readfile("countryjailkey.txt"))..", was accepted!\nScript will now load..."); task.wait(0.5); rconsoleprint("\nLoading dependencies..."); task.wait(0.5)
        rconsoleprint("@@WHITE@@"); rconsoleprint("\n\nFully Loaded: Thanks for supporting me.")
        loadScript() 
    else
        rconsoleclear(); rconsoleprint("@@LIGHT_RED@@")
        rconsoleprint("We found a key stored, but it was invalid. Please get another key.\nIf you think that this is false, an update to the Keys Database may have occured."); task.wait(3)
        askForKey()
    end 
else
    askForKey()
end

