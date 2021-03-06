 require 'gosu'
require_relative 'player'
require_relative 'enemy'
require_relative 'mapterpreter'
class SectorFive < Gosu::Window
attr_accessor :inertiax
attr_accessor :inertiay
def initialize
 super(1280,1024)
 self.caption = "Sector Five"
 @player = Player.new(self)
@bool1 = false
@bool2 = false
@bool3 = false
@bool4 = false
@inertiax = 0
@inertiay = 0
@movecounter = 0
@maploader = MapLoader.new(self,"map.map")
end


def docollidechecks
@maploader.mapenemies.each { |enemy| 
@player.playerproj.each { |projectile|
 distance = Gosu.distance(enemy.x + 25,enemy.y + 25,projectile.x,projectile.y)
 if distance < enemy.radius + projectile.radius
 enemy.take_dmg(2)
  @player.playerproj.delete projectile
 end
 if enemy.health < 1 then @maploader.mapenemies.delete enemy end

 }
  edistance = Gosu.distance(enemy.x + 25,enemy.y + 25,@player.x,@player.y)
  if edistance < 52 
 if enemy.x < @player.x 
 @player.move_right
  @player.move_right
 @player.move_right
  @player.move_right
 @player.move_right
  @player.move_right
 @player.move_right
  @player.move_right
 end
 if enemy.x > @player.x 
 @player.move_left
  @player.move_left
 @player.move_left
  @player.move_left
 @player.move_left
  @player.move_left
 @player.move_left
  @player.move_left
 end
 if enemy.y < @player.y
 @player.move_up
  @player.move_up
 @player.move_up
  @player.move_up
 @player.move_up
  @player.move_up
 @player.move_up
  @player.move_up
 end
 if enemy.y > @player.y
 @player.move_down
 @player.move_down
 @player.move_down
 @player.move_down
 @player.move_down
 @player.move_down
 @player.move_down
 @player.move_down
 end
 @player.take_dmg(4)
 end
  
}
end
def draw
@player.draw
@maploader.mapenemies.each { |enemy|
enemy.draw
}
@player.drawbullets
end
def update
@maploader.EventLoop
docollidechecks
@maploader.mapenemies.each { |enemy|
enemy.updatepos
}
@player.updatebullet
if button_down?(Gosu::KbLeft)
@player.move_left 
 @inertiax -= 1.5 if @inertiax > -45
 bool1 = false
 else
 bool1 = true
 end
if button_down?(Gosu::KbSpace)
@player.shootbullet
end
if button_down?(Gosu::KbRight)
 @player.move_right
 @inertiax += 1.5 if @inertiax < 45
bool2 = false
  else
 bool2 = true
 end
if button_down?(Gosu::KbUp)
 @inertiay += 1.5 if @inertiay < 45
 @player.move_up 
 bool3 = false
 else 
 bool3 = true
 end
  if button_down?(Gosu::KbDown)
  @player.move_down
  @inertiay -= 1.5 if @inertiay > -45
  bool4 = false
  else
  bool4 = true
 end
  if bool1 && @inertiax < 0 
   @player.move_left
  end
if bool2 && @inertiax > 0
   @player.move_right
  end
if bool3 && @inertiay > 0
   @player.move_up
  end
if bool4 && @inertiay < 0
   @player.move_down
  end
  if bool1 && bool2 && bool3 && bool4
  @player.image = Gosu::Image.new('ship.png')
  if @player.multipler > 1 && @player.multipler < 2
  @player.multipler -= 0.07
elsif @player.multipler > 2
   @player.multipler -= 0.09
  end
  
  end
 @inertiax -= 0.75 if @inertiax > 0
 @inertiax += 0.75 if @inertiax < 0
 @inertiay -= 0.75 if @inertiay > 0
 @inertiay += 0.75 if @inertiay < 0
end
end
thing = SectorFive.new
thing.show
