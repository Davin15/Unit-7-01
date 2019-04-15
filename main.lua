-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- simple touch code

local apple = display.newImageRect( "assets/apple.png",  100, 100 )
apple.x = 100
apple.y = 250
apple.id = "apple object"
 
local function onappleTouched( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. event.target.id )
    elseif ( event.phase == "ended" ) then
        print( "Touch event ended on: " .. event.target.id )
    end
  
    return true
end

apple:addEventListener( "touch", onappleTouched )

-- Comprehensive touch code

local orange = display.newImageRect( "assets/orange.png", 100, 100 )
orange.x = 250
orange.y = 250
orange.id = "orange object"
 
function orange:touch( event )
    if ( event.phase == "began" ) then
        print( "Touch event began on: " .. self.id )
 
        -- Set touch focus
        display.getCurrentStage():setFocus( self )
        self.isFocus = true
     
    elseif ( self.isFocus ) then
        if ( event.phase == "moved" ) then
            print( "Moved phase of touch event detected." )
 
        elseif ( event.phase == "ended" or event.phase == "cancelled" ) then
            display.getCurrentStage():setFocus( nil )
            self.isFocus = nil
            print( "Touch event ended on: " .. self.id )
        end
    end

    return true
end

orange:addEventListener( "touch", orange )