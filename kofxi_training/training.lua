-- Functions, variables releated to dummy
-- At the moment this file is unused, need more time to implement a correct dummy behaviour

training = {}

local INPUTS = flycast.input
local cheats = require '.data/training/kofxi_training/cheats'


local BUTTONS = {
    DPAD_UP = 1 << 4,
    DPAD_DOWN = 1 << 5,
    DPAD_LEFT = 1 << 6,
    DPAD_RIGHT = 1 << 7,
    BTN_B = 1 << 1, -- sp
    BTN_A = 1 << 2, -- lp
    BTN_Y = 1 << 9, -- sk
    BTN_X = 1 << 10, -- lk
    BTN_START = 1 << 3, -- start
    BTN_RB = 1 << 0, -- E
}

-- turn on/off dummy actions
training.enable_action = {
    neutral_jump = false,
}

--- only for testing purposes 
function training.test()
    INPUTS.pressButtons(2, BUTTONS.DPAD_DOWN)
end
---

-- Dummy actions 

function training.release_all_buttons(player_number)
    INPUTS.releaseButtons(player_number, 0xFFF) -- bit 0 to bit 11 
end


function training.neutral_jump(player_number, enable_action)
    if enable_action == true then 
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_DOWN)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_UP)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_UP)
        return
    end
end


function training.forward_jump(player_number)

    if cheats.read_face_left(player_number) == 1 then
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_LEFT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_RIGHT | BUTTONS.DPAD_UP)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_RIGHT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_LEFT | BUTTONS.DPAD_UP)
    end


end


function training.back_jump(player_number)

    if cheats.read_face_left(player_number) == 1 then
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_RIGHT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_LEFT | BUTTONS.DPAD_UP)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_LEFT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_RIGHT | BUTTONS.DPAD_UP)
    end

end

function training.walk_backward(player_number) 

    if cheats.read_face_left(player_number) == 1 then
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_RIGHT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_LEFT)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_LEFT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_RIGHT)
    end

end

function training.walk(player_number)  

    if cheats.read_face_left(player_number) == 1 then
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_LEFT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_RIGHT)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_RIGHT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_LEFT)
    end
end

function training.crouch(player_number)

    INPUTS.releaseButtons(player_number, BUTTONS.DPAD_UP)
    INPUTS.pressButtons(player_number, BUTTONS.DPAD_DOWN)

end

function training.block(player_number) 

    if cheats.read_face_left(player_number) == 1 then
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_RIGHT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_LEFT)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_LEFT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_RIGHT)
    end

end

function training.crouch_block(player_number)

    if cheats.read_face_left(player_number) == 1 then
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_RIGHT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_LEFT | BUTTONS.DPAD_DOWN)
    else
        INPUTS.releaseButtons(player_number, BUTTONS.DPAD_LEFT)
        INPUTS.pressButtons(player_number, BUTTONS.DPAD_RIGHT | BUTTONS.DPAD_DOWN)
    end
    

end

-- Update dummy actions 

function training.update_dummy()
    -- neutral_jump(2, training.enable_action.neutral_jump)
end

return training