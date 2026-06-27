-- This file contain the game addresses
-- I used Demul and Cheat engine to find it

local addresses = {}

addresses.MEMORY_ADDRESSES = {
    -- Timer 99:99
    ["first_timer"] = 0x2C27CB78,
    ["second_timer"] = 0x2C27CB7A,

    -- Char Timer 20:99
    ["char_first_timer"] = 0x2C18EF28,
    ["char_second_timer"] = 0x2C18EF2A,

    -- select Timer 10:99
    ["select_first_timer"] = 0x2C18EF2C,
    ["select_second_timer"] = 0x2C18EF2E,

    -- Player 1
    [1] =  {
        ["lf_gauge_1"] = 0x2C27CCA8,
        ["lf_gauge_2"] = 0x2C27CCE8,
        ["lf_gauge_3"] = 0x2C27CCC8,
        ["stun_1"] = 0x2C27CCAC,
        ["stun_2"] = 0x2C27CCCC,
        ["stun_3"] = 0x2C27CCEC,
        ["grd_stun_1"] = 0x2C27CCAE,
        ["grd_stun_2"] = 0x2C27CCCE,
        ["grd_stun_3"] = 0x2C27CCEE,
        ["skill_gauge"] = 0x2C27CBE0,
        ["stock_gauge"] = 0x2C27CBDC,
        ["position_x"] = 0x2C27CD94,
        ["face_left"] = 0x2C2142BA,
    },

    -- Player 2
    [2] =  {
        ["lf_gauge_1"] = 0x2C27CEA0,
        ["lf_gauge_2"] = 0x2C27CEE0,
        ["lf_gauge_3"] = 0x2C27CEC0,
        ["stun_1"] = 0x2C27CEA4,
        ["stun_2"] = 0x2C27CEC4,
        ["stun_3"] = 0x2C27CEE4,
        ["grd_stun_1"] = 0x2C27CEA6,
        ["grd_stun_2"] = 0x2C27CEE6,
        ["grd_stun_3"] = 0x2C27CEC6,
        ["skill_gauge"] = 0x2C27CDD8,
        ["stock_gauge"] = 0x2C27CDD4,
        ["position_x"] = 0x2C27CF8C,
        ["face_left"] = 0x2C21408C,
    },
}


return addresses