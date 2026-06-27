
-- constants for kof xi
local constants = {}

constants.GAME_CONSTANTS =  {
    ["timer"] = {
        max_seconds = 99,
        min_seconds = 0,
        max_mseconds = 99,
        min_mseconds = 0,
    },
    ["char_timer"] = {
        max_seconds = 20,
        min_mseconds = 0,
        max_mseconds = 99,
        min_mseconds = 0,
    },
    ["select_timer"] = {
        max_seconds = 10,
        min_mseconds = 0,
        max_mseconds = 99,
        min_mseconds = 0,
    },
    ["health"] = {
        min = 0,
        max = 112,
    },
    ["stun"] = {
        min = 0,
        max = 112,
    },
    ["grd_stun"] = {
        min = 0,
        max = 112,
    },
    ["skill_gauge"] = {
        min = 0,
        max = 112,
    },
    ["stock_gauge"] = {
        min = 0,
        max = 112,
    },

}

return constants