local UIConfig = CreateFrame("Frame", "MTDC", UIParent, "UIPanelDialogTemplate")

SLASH_MTDC1 = "/mtdc"
SLASH_RESET1 = "/mtdcreset"
SlashCmdList["MTDC"] = function(arg)
    for i, v in pairs(MageTowerDeathCounterSV) do
        print(i, 'Death :', v)
    end
end

SlashCmdList["RESET"] = function(arg)
    MageTowerDeathCounterSV = {
        -- REPLACE BY ID
        ['An impossible Foe'] = 0,
        ['Closing the Eye'] = 0,
        ['End of the Risen Threat'] = 0,
        ['Feltotem\'s Fall'] = 0,
        ['The God Queen\'s Fury'] = 0,
        ['The Highlord\'s Return'] = 0,
        ['Thwarting the Twins'] = 0,
    }
    print("Mage tower death counter successfully reseted")
end

UIConfig:SetScript("OnEvent", function(self, event, ...)
    if event == "PLAYER_LOGIN" then
        if (LoggingCombat() == false) then
            LoggingCombat(1);
        end
        if MageTowerDeathCounterSV == nil then
            MageTowerDeathCounterSV = {
                -- REPLACE BY ID
                ['An impossible Foe'] = 0,
                ['Closing the Eye'] = 0,
                ['End of the Risen Threat'] = 0,
                ['Feltotem\'s Fall'] = 0,
                ['The God Queen\'s Fury'] = 0,
                ['The Highlord\'s Return'] = 0,
                ['Thwarting the Twins'] = 0,
            }
        end
    end
    if event == "PLAYER_DEAD" then
        encounter = C_Scenario.GetInfo()
        -- print(encounter)
        for i, v in pairs(MageTowerDeathCounterSV) do
            if encounter == i then
                MageTowerDeathCounterSV[encounter] = MageTowerDeathCounterSV[encounter] + 1
            end
        end
    end
end)

UIConfig:RegisterEvent("PLAYER_LOGIN")
UIConfig:RegisterEvent("PLAYER_DEAD")