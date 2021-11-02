-- ENABLE EVENTS
if EggonsMU then
    -- EggonsMU.config.enableHotbarItemAttachEvent()
    -- EggonsMU.config.enableHotbarItemUnattachEvent()
    -- print("Enabling events")
    EggonsMU.config.enableEvent("OnBeforeItemTransfer")
    EggonsMU.config.enableEvent("OnHotbarItemAttach")
    EggonsMU.config.enableEvent("OnHotbarItemUnattach")
else
    print("WARNING! Events not enabled!")
end

EHT = EHT or {}
