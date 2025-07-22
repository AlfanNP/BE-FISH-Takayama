local Rayfield = loadstring(game:HttpGet("https://raw.githubusercontent.com/shlexware/Rayfield/main/source.lua"))()

local Window = Rayfield:CreateWindow({
   Name = "[🐠] Be Fish - TakayamaZhou GUI",
   LoadingTitle = "Be Fish GUI",
   LoadingSubtitle = "by TakayamaZhou",
   ConfigurationSaving = {
      Enabled = false
   },
   Discord = {
      Enabled = false
   },
   KeySystem = false,
})

-- Main Tab
local MainTab = Window:CreateTab("🐟 Main", 4483362458)

-- Speed Slider
MainTab:CreateSlider({
   Name = "Speed Ikan",
   Range = {16, 200},
   Increment = 5,
   Suffix = "WalkSpeed",
   CurrentValue = 16,
   Flag = "SpeedSlider",
   Callback = function(Value)
      game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
   end,
})

-- Tracer
MainTab:CreateButton({
   Name = "Tracer ke Ikan Lain",
   Callback = function()
      for _,v in pairs(game.Players:GetPlayers()) do
         if v ~= game.Players.LocalPlayer and v.Character then
            local tracer = Instance.new("Beam", v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Torso"))
            local att1 = Instance.new("Attachment", v.Character:FindFirstChild("HumanoidRootPart") or v.Character:FindFirstChild("Torso"))
            local att2 = Instance.new("Attachment", game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"))
            tracer.Attachment0 = att1
            tracer.Attachment1 = att2
            tracer.Color = ColorSequence.new(Color3.new(1, 0, 0))
            tracer.Width0 = 0.1
            tracer.Width1 = 0.1
         end
      end
   end,
})

-- No Clip
MainTab:CreateToggle({
   Name = "No Clip (Tembus Tembok)",
   CurrentValue = false,
   Flag = "NoClipToggle",
   Callback = function(state)
      noclip = state
      game:GetService("RunService").Stepped:Connect(function()
         if noclip then
            for _,v in pairs(game.Players.LocalPlayer.Character:GetDescendants()) do
               if v:IsA("BasePart") then
                  v.CanCollide = false
               end
            end
         end
      end)
   end,
})

-- Anti Lag
MainTab:CreateButton({
   Name = "Anti Lag (Hapus Partikel, Efek, Suara)",
   Callback = function()
      for _, obj in pairs(workspace:GetDescendants()) do
         if obj:IsA("ParticleEmitter") or obj:IsA("Trail") or obj:IsA("Sound") or obj:IsA("Decal") then
            obj:Destroy()
         end
      end
   end,
})
