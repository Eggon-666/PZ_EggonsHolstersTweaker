EHT = EHT or {}
EHT.holsterWeightReduction = EHT.holsterWeightReduction or 75 -- support legacy
EHT.beltsWeightReduction = 30

local function setCustomValues()
    getSandboxOptions():load()
    local SV = SandboxVars.eggonsHolstersTweaker
    EHT.holsterWeightReduction = SV.HolstersWeightReduction
    -- EHT.holsterWeightReduction   = AvailableReductions[SETTINGS.options.dropdown1]
    -- print("Holster red set to: ", EHT.holsterWeightReduction)
    EHT.beltsWeightReduction = SV.BeltsWeightReduction
    -- EHT.beltsWeightReduction = AvailableReductions[SETTINGS.options.dropdown2]
    -- print("Belts set to: ", EHT.beltsWeightReduction)
end

Events.OnPreMapLoad.Add(setCustomValues)
