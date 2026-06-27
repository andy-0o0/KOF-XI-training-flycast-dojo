-- This file contains functions related to windows, 
-- enabling/disabling cheats, and displaying information 

local menu = {}

local STATE = flycast.state
local cheats = require '.data/training/kofxi_training/cheats'
local train = require '.data/training/kofxi_training/training'


-- verify for counter for multi-option buttons
local function verify_press(counter, counter_limit)
    if counter >= counter_limit then
        return 1
    end
    
    return counter + 1
end

-- on/off cheats
local function flag_cheat(counter)
    return counter ~= 1
end

-- Calculate position in x/y for player 1 and 2 sides

local function calculate_pos_x(player_number, window_width)
    return math.floor((STATE.display.width * (player_number - 1)) - (window_width * (player_number - 1)))
end

local function calculate_pos_y(part_of_window)
    if part_of_window == 0 then 
        return 0
    else 
        return math.floor(STATE.display.height / part_of_window)
    end
end

-- Overlays

local function health_overlay(player_number)
    local ui = flycast.ui
    local width = 250
    local height = 0
    local position_x = calculate_pos_x(player_number, width) --math.floor((STATE.display.width * (player_number - 1)) - (width * (player_number - 1)))
    local position_y = 0

    local health_name = {
        [true] = "infinite",
        [false] = "normal",
    }

    ui.beginWindow("Player " .. player_number .. " health ", position_x, position_y, width, height)
    
    ui.button(health_name[cheats.cheat_enabler.health[player_number]] .. " health",
        function()
            cheats.cheat_enabler.health[player_number] = not cheats.cheat_enabler.health[player_number]
        end 
    )

    ui.text("Health Char 1: " .. cheats.health[1])
    ui.text("Health Char 2: " .. cheats.health[2])
    ui.text("Health Char 3: " .. cheats.health[3])

    ui.endWindow()
end


local function gauges_overlay(player_number)
    local ui = flycast.ui
    local width = 250
    local height = 0
    local position_x = calculate_pos_x(player_number, width) --math.floor((STATE.display.width * (player_number - 1)) - (width * (player_number - 1)))
    local position_y = calculate_pos_y(8/2) --math.floor(STATE.display.height / 8)

    local gauges_names_sk = {
            "off",
            "0",
            "1",
            "2",
            "max",
        }

    local gauges_names_st = {
            "off",
            "0",
            "1",
            "2",
            "3",
            "max",
        } 

    local stun_names = {
            "off",
            "min",
            "max",
        }

   
    ui.beginWindow("Player " .. player_number .. " gauges: ", position_x, position_y, width, height)
    ui.button(
        "Skill: " ..  gauges_names_sk[cheats.gauge_counters["skill"][player_number]],
        function()
            cheats.gauge_counters["skill"][player_number] = verify_press(cheats.gauge_counters["skill"][player_number], 5)
            cheats.cheat_enabler["skill"][player_number] = flag_cheat(cheats.gauge_counters["skill"][player_number])
        end
    )

    ui.button(
        "Stock: " ..  gauges_names_st[cheats.gauge_counters["stock"][player_number]],
        function()
            cheats.gauge_counters["stock"][player_number] = verify_press(cheats.gauge_counters["stock"][player_number], 6)
            cheats.cheat_enabler["stock"][player_number] = flag_cheat(cheats.gauge_counters["stock"][player_number])
        end
    )

    ui.button(
        "Stun: " ..  stun_names[cheats.gauge_counters["stun"][player_number]],
        function()
            cheats.gauge_counters["stun"][player_number] = verify_press(cheats.gauge_counters["stun"][player_number], 3)
            cheats.cheat_enabler["stun"][player_number] = flag_cheat(cheats.gauge_counters["stun"][player_number])
        end
    )

    ui.button(
        "Guard Stun: " ..  stun_names[cheats.gauge_counters["grd_stun"][player_number]],
        function()
            cheats.gauge_counters["grd_stun"][player_number] = verify_press(cheats.gauge_counters["grd_stun"][player_number], 3)
            cheats.cheat_enabler["grd_stun"][player_number] = flag_cheat(cheats.gauge_counters["grd_stun"][player_number])
        end
    )
    
    ui.endWindow()

end


function menu.actions(player_number)
    local ui = flycast.ui
    local width = 250
    local height = 0
    local position_x = calculate_pos_x(player_number, width) --math.floor((STATE.display.width * (player_number - 1)) - (width * (player_number - 1)))
    local position_y = calculate_pos_y(8 / 3)

    local state = {
        "off",
        "on"
    }

    ui.beginWindow("Player " .. player_number .. " actions: ", position_x, position_y, width, height)

    ui.button(
        "jump ",
        function()
            train.enable_action.neutral_jump = not train.enable_action.neutral_jump
        end
    )

    ui.text(tostring(train.enable_action.neutral_jump))

    ui.endWindow()

end

-- Overlay version
local function version_overlay() 
    local ui = flycast.ui
    local width = 200
    local height = 100
    local x = 0
    local y = 0

    ui.beginWindow("Kof XI training mode", x, y, width, height)
    ui.text("Version 1")
    ui.endWindow()
end



-- Ovelays update
function menu.update()
    version_overlay()
    health_overlay(2)

    gauges_overlay(1)
    gauges_overlay(2)
end



-- Overlay test

function menu.testing()
    local ui = flycast.ui
    local width = 250 
    local height = 300
    local pos_x = 0
    local pos_y = 800


    ui.beginWindow("test menus.lua", pos_x, pos_y, width, height)
    ui.text("Hi, if you see this window. Nice")
    ui.text(STATE.display.height)
    ui.text(STATE.display.width)
    ui.endWindow()
end

return menu 