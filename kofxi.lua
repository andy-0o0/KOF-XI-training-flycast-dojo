-- KOF XI training mode
-- author: andy_:)

-- This project aims to provide a more convenient and user-friendly way to do certain things.
-- Currently, there are buttons for

-- Gauges (Skill and stock)
-- Stun and guard stun
-- Infinite timer in character, position and battle
-- Infinite health for player 1
-- Infinite and fill health for player 2
-- player 2 Health information 


local menu = require '.data/training/kofxi_training/menus'
local cheats = require '.data/training/kofxi_training/cheats'
-- local train = require '.data/training/kofxi_training/training'


-- main / flycast
function Overlay()
    
    -- verify if we are in training mode
    if flycast.config.dojo.IsTraining == false then
        return
    end

    -- update ui, cheats and dummy 
    menu.update()
    cheats.update()

end



-- Callbacks 
flycast_callbacks = {
    overlay = Overlay
}