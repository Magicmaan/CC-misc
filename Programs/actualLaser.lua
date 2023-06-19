laser = peripheral.wrap("left")

while true do
    for x=1,8,1 do
        laser.fire(180,0,4)
    end
    turtle.forward()
end