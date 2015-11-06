class Enemy
 attr_reader :x
 attr_reader :y
 attr_reader :radius
 attr_reader :health
 def initialize(window, filename ,x,y) 
 file = File.new(filename,"r")
 line = file.gets
  
 
 line = line.split(",")
 
 @speed = line[0].to_f
 @radius = 30
 @x = x
 @y = y
 @health = line[2].to_f
 @enemy = Gosu::Image.new(line[1].chomp)
 @loopthings = 0
 end
 def draw
 @enemy.draw(@x - @radius,@y - @radius,1)
 end
 def updatepos
 @loopthings += 1 * @speed
 @y += 2
 if @loopthings == 1 then  end
 if @loopthings == 25 then @loopthings = 0 end
 end
 def take_dmg(dmg)
 @health -= dmg
 end
end
