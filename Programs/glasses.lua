perips = peripheral.wrap("back")



function glasses()
    glasses = perips.canvas()
    glasses.clear()

    text = glasses.addText({1,1},"Elytra Accel: False")
    text = glasses.addText({1,10},"Laser: False")
end

function elytra()
    if event == "key" and x == keys.leftCtrl and player.isElytraFlying then
        perips.launch(player.yaw,player.pitch,elytrapower)
    end
end

function laser()
    if event == "key" and x == keys.leftShift then
        perips.fire(player.yaw,player.pitch,laserpower)
    end
end

function glassesupdate(indicators)
    glasses.clear()

    text = glasses.addText({1,1},"Elytra Accel: ("..elytrapower..") "..tostring(indicators[1]))
    text = glasses.addText({1,10},"Laser: ("..laserpower..") "..tostring(indicators[2]))
end


indicators = {false,false}


function main()
    
    laserpower = 4
    elytrapower = 1
    
    
    while true do
        funcs = {}
        
        event = "websocket_message"
        while event == "websocket_message" do
            event, x, command, args = os.pullEvent()
        end
        player = perips.getMetaByName("Magicmaan")

        if event == "command" then
            command = string.lower(command)
            args[1] = string.lower(args[1])

            if command == "elytra" then
                if args[1] == "true" then
                    indicators[1] = true
                    print("elytra activated")
                elseif args[1] == "false" then
                    indicators[1] = false
                    print("elytra disabled")
                elseif tonumber(args[1]) then
                    if tonumber(args[1]) >= 0.5 and tonumber(args[1]) <= 4 then elytrapower = tonumber(args[1]) end
                end 

            elseif command == "laser" then
                if args[1] == "true" then
                    indicators[2] = true
                    print("Laser activated")
                elseif args[1] == "false" then
                    indicators[2] = false
                    print("Laser disabled")
                elseif tonumber(args[1]) then
                    if tonumber(args[1]) >= 0.5 and tonumber(args[1]) <= 4 then laserpower = tonumber(args[1]) end
                end 
            end
        end


        if indicators[1] then table.insert(funcs,elytra) end
        if indicators[2] then table.insert(funcs,laser) end

        parallel.waitForAll(table.unpack(funcs))
        glassesupdate(indicators)
        
    end
end

glasses()
main()