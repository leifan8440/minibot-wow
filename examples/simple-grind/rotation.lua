return {
    -- Define rotation.
    rotations = {
      combat = function(env, is_pulling)
        -- called when a target unit is selected to engage.
        if (UnitExists("target")) then
            RunMacroText("/startattack");
            if (UnitPower("player") > 15) then
                RunMacroText("/cast Heroic Strike");
            end
        end
      end,
      prepare = function(env)
        -- called to check and run the preparation rotation, such as summon and feeding pets, buffing, conjuring and etc.
        -- Return true if preparation is still ongoing.
        return false;
      end,
    }
  };