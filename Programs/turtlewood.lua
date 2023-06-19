laser = peripheral.wrap("left")
sensor = peripheral.wrap("right")

block = "minecraft:jungle_log"

while true do
    for _,val in pairs(sensor.scan()) do
        if val.name == block then
            print(math.deg(math.atan(val.x/val.y))+180)
            print(math.deg(math.atan(val.x/val.y))-90)
            sleep(2)
            laser.fire(math.deg(math.atan(val.x/val.y))+180,math.deg(math.atan(val.x/val.y))-90,1)
        end
    end
end


