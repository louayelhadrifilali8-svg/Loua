
--// JOB ID COPIER GUI

local Players = game:GetService("Players")
local player = Players.LocalPlayer

if not player then
    warn("Player not found. Run this on the client.")
    return
end

local old = player:WaitForChild("PlayerGui"):FindFirstChild("JobIDCopier")
if old then old:Destroy() end

local gui = Instance.new("ScreenGui")
gui.Name = "JobIDCopier"
gui.ResetOnSpawn = false
gui.DisplayOrder = 999
gui.Parent = player:WaitForChild("PlayerGui")

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 320, 0, 150)
frame.Position = UDim2.new(0.5, -160, 0.5, -75)
frame.BackgroundColor3 = Color3.fromRGB(25, 27, 38)
frame.BorderSizePixel = 0
frame.Active = true
frame.Draggable = true
frame.Parent = gui

Instance.new("UICorner", frame).CornerRadius = UDim.new(0, 12)

local title = Instance.new("TextLabel")
title.Size = UDim2.new(1, -20, 0, 35)
title.Position = UDim2.new(0, 10, 0, 5)
title.BackgroundTransparency = 1
title.Text = "SERVER JOB ID COPIER"
title.TextColor3 = Color3.new(1, 1, 1)
title.Font = Enum.Font.GothamBold
title.TextSize = 17
title.Parent = frame

local id = Instance.new("TextLabel")
id.Size = UDim2.new(1, -20, 0, 35)
id.Position = UDim2.new(0, 10, 0, 45)
id.BackgroundColor3 = Color3.fromRGB(42, 45, 58)
id.TextColor3 = Color3.fromRGB(220, 225, 255)
id.Font = Enum.Font.Code
id.TextSize = 12
id.TextWrapped = true
id.Text = game.JobId ~= "" and game.JobId or "No Job ID available"
id.Parent = frame

Instance.new("UICorner", id).CornerRadius = UDim.new(0, 6)

local button = Instance.new("TextButton")
button.Size = UDim2.new(1, -20, 0, 38)
button.Position = UDim2.new(0, 10, 0, 95)
button.BackgroundColor3 = Color3.fromRGB(75, 105, 255)
button.TextColor3 = Color3.new(1, 1, 1)
button.Font = Enum.Font.GothamBold
button.TextSize = 14
button.Text = "COPY JOB ID"
button.Parent = frame

Instance.new("UICorner", button).CornerRadius = UDim.new(0, 7)

button.Activated:Connect(function()
    local clipboard = setclipboard or toclipboard

    if game.JobId == "" then
        button.Text = "JOB ID UNAVAILABLE"
    elseif typeof(clipboard) == "function" then
        local ok = pcall(clipboard, game.JobId)
        button.Text = ok and "COPIED!" or "COPY FAILED"
    else
        button.Text = "CLIPBOARD UNSUPPORTED"
    end

    task.delay(2, function()
        if button.Parent then
            button.Text = "COPY JOB ID"
        end
    end)
end)

print("Job ID Copier GUI created successfully")
