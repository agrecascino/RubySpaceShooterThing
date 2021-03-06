require 'gosu'
require_relative 'enemy'
require_relative 'player'
require_relative 'event'
class MapLoader
 attr_accessor :mapenemies
 attr_accessor :mapevents
 def initialize(window,filename)
 file = File.new(filename,"r")
 map = file.gets
 map = map.split(",")
 @window = window
 puts "Map = #{map}"
 if map[0] == "mapstart:"
 puts "Map ident detected"
 @startx = 0
 @starty = 0
 @eventprocessor = 0
 @mapenemies = []
 @mapevents = []
 for numtimes in 1..map.size
  if map[numtimes].to_s.chomp == "test" then puts "test" end
  if map[numtimes].to_s.chomp == "mapend:" then puts "map ended"; break end
  if map[numtimes].to_s.chomp =~ /eventload:/
  split_eventload = map[numtimes].to_s.chomp.split(':')
  puts split_eventload[1].to_s.chomp
  tempobject = Event.new(@window,split_eventload[1].to_s.chomp)
  @mapevents.push(tempobject)
  end
  if map[numtimes].to_s.chomp == "createenemy:" then end# @mapenemies.push(Enemy.new(window,"enemy.txt",20,20)) end
 end
 end
 end
 def EventLoop
  if (@mapevents[@eventprocessor].milliseconds - 50  <= Gosu.milliseconds ) && (@mapevents[@eventprocessor].milliseconds + 50 >= Gosu.milliseconds)
  if @mapevents[mapevents.size - 1].eventtype == "enemytype" 
  @mapenemies.push(Enemy.new(@window,@mapevents[mapevents.size - 1].enemytocreate,@mapevents[mapevents.size - 1].x,@mapevents[mapevents.size - 1].y))
  end
  end
 end
end
