EHT = EHT or {}
EHT.holsterWeightReduction = 75
EHT.beltsWeightReduction = 30

local AvailableReductions = {
    [1] = 0, -- 1
    [2] = 5,
    [3] = 10,
    [4] = 15,
    [5] = 20,
    [6] = 25,
    [7] = 30,
    [8] = 35,
    [9] = 40,
    [10] = 45,
    [11] = 50,
    [12] = 55,
    [13] = 60,
    [14] = 65,
    [15] = 70,
    [16] = 75,
    [17] = 80,
    [18] = 85,
    [19] = 90,
    [20] = 95,
    [21] = 100
}

local SETTINGS = {
    options = {},
    names = {},
    mod_fullname = "Eggon's Weapons Durability Tweaker"
}

SETTINGS.names.dropdown1 = "Holsters' weight reduction"
SETTINGS.options.dropdown1 = 16
SETTINGS.names.dropdown2 = "Belts' weight reduction"
SETTINGS.options.dropdown1 = 7

if ModOptions and ModOptions.getInstance then
    local settings = ModOptions:getInstance(SETTINGS)
    ModOptions:loadFile()

    for i, v in pairs(SETTINGS.options) do
        local ddown = settings:getData(i)
        for d, value in pairs(AvailableReductions) do
            ddown[d] = tostring(value)
        end
    end

    local dropdown1 = settings:getData("dropdown1")
    function dropdown1:onUpdate(val)
        EHT.holsterWeightReduction = AvailableReductions[val]
    end
    local dropdown2 = settings:getData("dropdown2")
    function dropdown2:onUpdate(val)
        EHT.beltsWeightReduction = AvailableReductions[val]
    end
end

local function setCustomValues()
    EHT.holsterWeightReduction = AvailableReductions[SETTINGS.options.dropdown1]
    EHT.beltsWeightReduction = AvailableReductions[SETTINGS.options.dropdown2]
end

Events.OnPreMapLoad.Add(setCustomValues)
