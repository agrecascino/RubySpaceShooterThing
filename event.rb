class Event
 attr_accessor :enemytocreate
 attr_accessor :x
 attr_accessor :y
 attr_accessor :eventtype
 attr_accessor :milliseconds
 def initialize(window,filename)
 @file = File.new(filename, "r")
 @data = @file.gets
 @data = @data.split(",")
 @windowobject = window
 @x = 0
 @enemytype = ""
 @milliseconds = 0
 @y = 0
 @eventtype = ""
 if @data[0].to_s.chomp == "EventStart:"
 puts "Found event indent!"
 for iteratenum in 1..@data.size
 if @data[iteratenum].to_s.chomp =~ /x:/
 splitter = @data[iteratenum].split(":")
 @x = splitter[1].to_i 
 end
 if @data[iteratenum].to_s.chomp =~ /y:/
 splitter = @data[iteratenum].split(":")
 @y = splitter[1].to_i 
 end
 if @data[iteratenum].to_s.chomp =~ /enemycreate:/
 splitter = @data[iteratenum].split(":")
 @eventtype = "enemytype"
 @enemytocreate = splitter[1].to_s.chomp
 end
 if @data[iteratenum].to_s.chomp =~ /milliseconds:/
 splitter = @data[iteratenum].split(":")
 @milliseconds = splitter[1].to_i
 end
 if @data[iteratenum].to_s.chomp == "EventEnd:"
 break
 end
 end
 else
 puts "Invalid map file #{filename}"
 end
   end
end
