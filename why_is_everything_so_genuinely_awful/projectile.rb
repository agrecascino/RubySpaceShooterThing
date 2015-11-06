require 'gosu'
class Projectile
attr_reader :x
attr_reader :y
attr_reader :radius
def initialize(window,angle,x,y)
@speed = 5
@x = x 
@y = y - 30
@direction = angle
@window = window
@radius = 3
@image = Gosu::Image.new("bullet.png")
end
def setprojectileimage(filename)
@image = Gosu::Image.new(filename)
end
def draw
@image.draw(@x - @radius,@y - @radius,1)
end
def move
@x += Gosu.offset_x(@direction,@speed)
@y += Gosu.offset_y(@direction,@speed)
end
end
