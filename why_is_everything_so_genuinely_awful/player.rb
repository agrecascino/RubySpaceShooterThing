require 'gosu'
require_relative 'projectile'
class Player
 attr_accessor :multipler
 attr_accessor :image
 attr_accessor :playerproj
 attr_accessor :x
 attr_accessor :y
 def initialize(window)
  @x = 200
  @y = 200
  @angle = 0
  @multipler = 1
  @image = Gosu::Image.new('ship.png')
  @window = window
  @radius = 50
  @playerproj = []
  @iskill = false
  @hull = 20
  @shield = 20
  @bulletcounter = 0
  @damagecounter = 0
 end
def turn_right
  @angle += 3
end
def take_dmg(dmg)
 if @damagecounter % 6 == 0
 @shield -= dmg unless @shield == 0
 if @shield < 0
   @hull += @shield
end
 @hull -= dmg if @shield == 0
if @hull < 0
 @iskill = true
end
end
@damagecounter += 1
end
def shootbullet
if @iskill == false
if @bulletcounter % 6 == 0 then @playerproj.push Projectile.new(@window,@angle,@x,@y) end
@bulletcounter += 1
end
end
def updatebullet
@playerproj.each { |bulletobject|
bulletobject.move
}
end
def drawbullets
 @playerproj.each { |obj| obj.draw}
end
def turn_left
@angle -= 3
end
def move_right
@image = Gosu::Image.new('shipright.png')
@x += 3 * @multipler
@multipler *= 1.002
if @multipler >= 2.2 then @multipler = 2.2 end
if @x > @window.width - @radius + 20 then @multipler = 1;@x = @window.width - @radius + 20 end
end
def move_left
@image = Gosu::Image.new('shipleft.png')
@multipler *= 1.002
if @multipler >= 2.2 then @multipler = 2.2 end
@x -= 3 * @multipler
if @x < @radius - 30 then @multipler = 1;@x = @radius - 30 end
end
def move_up
@image = Gosu::Image.new('ship.png')
@multipler *= 1.002
if @multipler >= 2.2 then @multipler = 2.2 end
@y -= 3 * @multipler

if @y < @radius - 20 then @y = @radius - 20;@multipler = 1  end
end
def move_down
@image = Gosu::Image.new('ship.png')
@multipler *= 1.002
if @multipler >= 2.2 then @multipler = 2.2 end
@y += 3 * @multipler
if @y > @window.height - @radius + 20 then @multipler = 1;@y = @window.height - @radius + 20 + 1 end
end
 def draw
   if @iskill == false
   @image.draw_rot(@x,@y,1,@angle)
   end
 end

end
