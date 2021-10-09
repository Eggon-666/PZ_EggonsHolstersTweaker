-- ENABLE EVENTS
if EggonsMU then
    print("Enabling events")
    EggonsMU.config.enableEvent("OnBeforeItemTransfer")
    EggonsMU.config.enableEvent("OnHotbarItemAttach")
    EggonsMU.config.enableEvent("OnHotbarItemUnattach")
    -- EggonsMU.config.enableHotbarItemAttachEvent()
    -- EggonsMU.config.enableHotbarItemUnattachEvent()
else
    print("WARNING! Events not enabled!")
end

if EHT then
    EHT.performClothingCheck = false
else
    EHT = {
        performClothingCheck = false,
        -- holsterWeightReduction = 75
    }
end
