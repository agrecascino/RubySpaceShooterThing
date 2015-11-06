require 'gosu'

class WhackARuby < Gosu::Window
def initialize
super(1280,1024)
self.caption = 'Whack the Ruby!'
@image = Gosu::Image.new('sprite.png')
@hammerimage = Gosu::Image.new('sprite2.png')
@x = 200
@y = 200
@width = 50
@height = 43
@xvel = 5
@yvel = 5
@visible = 0
@hit = 0
@font = Gosu::Font.new(30)
@score = 0
@start_time = Gosu::milliseconds
@playing = true
end
def draw
if @playing == true
if @visible > 0
 @image.draw(@x - @width /2,@y - @height /2,1)
end
@hammerimage.draw(mouse_x - 40, mouse_y - 10 ,1)
if @hit == 0
 c = Gosu::Color::NONE
elsif @hit == 1
 c = Gosu::Color::GREEN

elsif @hit == -1
c = Gosu::Color::RED
end
draw_quad(0, 0, c, 1280, 0, c, 1280, 1024, c, 0, 1024, c)
@hit = 0
@font.draw(@score.to_s, 1180, 20 ,2)
@font.draw(@timeleft.to_s, 20 , 20 ,2)
else
@font.draw("Game over!",560,512,2)
@font.draw("Press space to try again.",540,476,2)
end
end
def button_down(id)
if @playing
if(id == Gosu::MsLeft)
if Gosu.distance(mouse_x, mouse_y, @x,@y) < 200  && @visible >= 0
@hit = 1
@score += 5
else
@hit = -1
@score -= 1
end

end
else
if(id == Gosu::KbSpace)
@playing = true
@start_time = Gosu::milliseconds
@score = 0
end
end
end
def update
@x += @xvel
@y += @yvel
@xvel *= -1 if @x + @width /2 > 1280 || @x - @width / 2 < 0
@yvel *= -1 if @y + @height /2 > 1024 || @y - @height / 2 < 0
@visible -= 1
@visible = 30 if @visible < -10 && rand < 0.01
@timeleft = ((@start_time / 1000) + 100 - (Gosu.milliseconds / 1000))
if @timeleft < 0
@playing = false
end
end
end
window = WhackARuby.new
window.show
