mod = peripheral.wrap("right")
sleepcooldown = 10


while true do
    
    sense = mod.sense()

    for _,val in pairs(sense) do
        if val.key == "minecraft:slime" then
            if math.abs(val.x) < 2 and math.abs(val.y) < 2 and math.abs(val.y) < 2 then
                turtle.attackUp()
                
            end
            sleepcooldown = 1
        end
    end
    
    turtle.suckUp()
    inv = turtle.getItemCount(1)
    if inv then
        turtle.dropDown(inv)
    end
    sleep(sleepcooldown)
    sleepcooldown = 10
end