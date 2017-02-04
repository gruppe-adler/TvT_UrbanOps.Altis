params ["_side"];

_canRespawn = switch (_side) do {
    case ("WEST"): {
        count deadPlayersBlu >= BLUFORWAVESIZE &&
        WAVERESPAWNTIMELEFTBLU <= 0 &&
        {_x getVariable ["uo_respawnObject_isActive", false]} count uo_cv_allCVs > 0
    };
    case ("EAST"): {
        count deadPlayersOpf >= OPFORWAVESIZE &&
        WAVERESPAWNTIMELEFTOPF <= 0 &&
        !uo_DEALERKILLED
    };
    default {
        false
    };
};

_canRespawn
