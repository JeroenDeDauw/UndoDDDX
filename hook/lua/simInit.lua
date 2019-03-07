local OldBeginSession = BeginSession

local function enableRas()
    LOG("enableRas - start")

    local ScenarioFramework = import('/lua/ScenarioFramework.lua')

    for _, Army in ListArmies() do
        ScenarioFramework.RemoveRestriction(Army, categories.ResourceAllocation)
    end

    LOG("enableRas - end")
end

function BeginSession()
    OldBeginSession()

    ForkThread(function()
        enableRas()
        WaitSeconds(10)
        enableRas()
    end)
end