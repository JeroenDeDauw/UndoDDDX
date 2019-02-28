local OldBeginSession = BeginSession

function BeginSession()
    OldBeginSession()
    ScenarioFramework.RemoveRestriction(Army, categories.ResourceAllocation)

    ForkThread(function()
        WaitSeconds(10)
        ScenarioFramework.RemoveRestriction(Army, categories.ResourceAllocation)
    end)
end