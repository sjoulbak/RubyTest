#####################
#	9/12/2014		#
#	Created by:		#
#	Remco Meinen	#
#####################

### Needed ###
require './Core.rb'
Dir["./Map/*.rb"].each {|map| require map }

### Save System ###
puts 'Hello there!'
puts 
puts 'What would you like to do?'
puts '1. New game'
if !Dir.glob('./Save/*.save').empty? == true
	puts '2. Continue a game'
	puts	
	while true
		saveLoad = gets.chomp
	
		if saveLoad == '1'
			#Create new game#
			puts
			puts 'How do you want to name your save?'
			saveName = gets.chomp
			File.open("./Save/"+saveName+".save","w")
			break
		elsif saveLoad == '2'
			#Load game#
			i = 0
			saves = Array.[]
			saves.push 'nil'
			Dir["./Save/*.save"].each {|save| puts "#{i+=1}. #{File.basename(save).match(/(.*)\.save/)}"[0...-5]}
			Dir["./Save/*.save"].each {|save| saves.push save}
			puts saves[1]
			if saves[2] == true
				puts 'hijs true'
			end
			break
		end
	end
else
	puts
	while true
		saveLoad = gets.chomp
	
		if saveLoad == '1'
			#Create new game#
			puts
			puts 'How do you want to name your save?'
			saveName = gets.chomp
			File.open("./Save/"+saveName+".save","w")
			break
		end
	end
end
# show all saves! Dir["./Save/*.save"].each {|save| puts "Load "+save }
