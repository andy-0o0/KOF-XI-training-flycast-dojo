-- This file contain functions and variables releated with cheats 

local cheats = {}

local MEMORY = flycast.memory

local kof_mem = require '.data/training/kofxi_training/adresses'
local kof_const = require '.data/training/kofxi_training/constants'

-- turn on/off gauges
cheats.cheat_enabler = {
    ["skill"] = {
        [1] = false,
        [2] = false,
    },
    ["stock"] = {
        [1] = false,
        [2] = false,
    },
    ["stun"] = {
        [1] = false,
        [2] = false,
    },
    ["grd_stun"] = {
        [1] = false,
        [2] = false,
    },
    ["health"] = {
        [1] = true,
        [2] = false,
    }
}

-- gauges level
cheats.gauge_counters = {
    ["skill"] = {
        [1] = 1,
        [2] = 1,
    },
    ["stock"] = {
        [1] = 1,
        [2] = 1,
    },
    ["stun"] = {
        [1] = 1,
        [2] = 1,
    },
    ["grd_stun"] = {
        [1] = 1,
        [2] = 1,
    },
}

-- Player 2 health
cheats.health = {
    [1] = 1,
    [2] = 1,
    [3] = 1,
}

-- Timer-releated functions
local function freeze_round_timer()
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES["first_timer"], kof_const.GAME_CONSTANTS["timer"]["max_seconds"])
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES["second_timer"], kof_const.GAME_CONSTANTS["timer"]["max_mseconds"]) 
end

local function freeze_char_timer()
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES["char_first_timer"], kof_const.GAME_CONSTANTS["char_timer"]["max_seconds"])
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES["char_second_timer"], kof_const.GAME_CONSTANTS["char_timer"]["max_mseconds"]) 
end

local function freeze_select_timer()
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES["select_first_timer"], kof_const.GAME_CONSTANTS["select_timer"]["max_seconds"])
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES["select_second_timer"], kof_const.GAME_CONSTANTS["select_timer"]["max_mseconds"]) 
end


-- Health-releated functions
local function infinite_health(player_number)
    if cheats.cheat_enabler["health"][player_number] then
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["lf_gauge_1"], kof_const.GAME_CONSTANTS["health"]["max"])
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["lf_gauge_2"], kof_const.GAME_CONSTANTS["health"]["max"])
    MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["lf_gauge_3"], kof_const.GAME_CONSTANTS["health"]["max"]) 
    end
end

local function read_health(player_number)
    cheats.health[1] = MEMORY.read16(kof_mem.MEMORY_ADDRESSES[player_number]["lf_gauge_1"])
    cheats.health[2] = MEMORY.read16(kof_mem.MEMORY_ADDRESSES[player_number]["lf_gauge_2"])
    cheats.health[3] = MEMORY.read16(kof_mem.MEMORY_ADDRESSES[player_number]["lf_gauge_3"])
end


-- Gauges-releated functions
local function stun(player_number, value)
    if cheats.cheat_enabler["stun"][player_number] then
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["stun_1"], kof_const.GAME_CONSTANTS["stun"]["max"] * (value - 2))
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["stun_2"], kof_const.GAME_CONSTANTS["stun"]["max"] * (value - 2))
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["stun_3"], kof_const.GAME_CONSTANTS["stun"]["max"] * (value - 2))
    end 
end


local function guard_stun(player_number, value)   
    if cheats.cheat_enabler["grd_stun"][player_number] then
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["grd_stun_1"], kof_const.GAME_CONSTANTS["grd_stun"]["max"] * (value - 2))
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["grd_stun_2"], kof_const.GAME_CONSTANTS["grd_stun"]["max"] * (value - 2))
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["grd_stun_3"], kof_const.GAME_CONSTANTS["grd_stun"]["max"] * (value - 2))
    end    
end    


local function skill_gauge(player_number, gauge_number)    
    if cheats.cheat_enabler["skill"][player_number] then
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["skill_gauge"], kof_const.GAME_CONSTANTS["skill_gauge"]["max"] * (gauge_number - 2))

        if (gauge_number > 1) and (gauge_number < 5)  then 
            cheats.cheat_enabler["skill"][player_number] = false
        end

    end

end

local function stock_gauge(player_number, gauge_number)
    if cheats.cheat_enabler["stock"][player_number] then
        MEMORY.write16(kof_mem.MEMORY_ADDRESSES[player_number]["stock_gauge"], kof_const.GAME_CONSTANTS["stock_gauge"]["max"] * (gauge_number - 2))
        
        if (gauge_number > 2) and (gauge_number < 6)  then 
            cheats.cheat_enabler["stock"][player_number] = false
        end
    
    end
end

-- Checks if the character is on the player 1 or player 2 side
function cheats.read_face_left(player_number)
    return MEMORY.read8(kof_mem.MEMORY_ADDRESSES[player_number]["face_left"])
end


-- Player cheats 

local function update_player_cheats(player_number)
    infinite_health(player_number)
    skill_gauge(player_number, cheats.gauge_counters["skill"][player_number])
    stock_gauge(player_number, cheats.gauge_counters["stock"][player_number])
    guard_stun(player_number, cheats.gauge_counters["grd_stun"][player_number])
    stun(player_number, cheats.gauge_counters["stun"][player_number])

end


function cheats.update()
    freeze_round_timer()
    freeze_char_timer()
    freeze_select_timer()
    update_player_cheats(1)
    update_player_cheats(2)

    read_health(2)
end

return cheats