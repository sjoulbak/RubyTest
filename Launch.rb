#####################
#	9/12/2014		#
#	Created by:		#
#	Co [TBB]		#
#####################

### Needed ###
require './Core.rb'
Dir["./Map/*.rb"].each {|map| require map }

### Save System ###
puts 'Hello there!'
puts 
puts 'What would you like to do?'
puts '1. New game'
if !Dir.glob('./Save/*.cfg').empty? == true
	puts '2. Continue a game'
	puts	
	while true
		saveLoad = gets.chomp
	
		if saveLoad == '1'
			#Create new game#
			puts
			puts 'How do you want to name your save?'
			saveName = gets.chomp
			File.open("./Save/"+saveName+".cfg","w")
			break
		elsif saveLoad == '2'
			#Load game#
			i = 0
			saves = Array.[]
			saves.push 'nil'
			puts 'Please select a number: '
			puts 
			Dir["./Save/*.cfg"].each {|save| puts "#{i+=1}. #{File.basename(save).match(/(.*)\.cfg/)}"[0...-4]}
			Dir["./Save/*.cfg"].each {|save| saves.push save}
			while true
				input = gets.chomp
 
				if input =~ /\A\d+\z/
					slot = input.to_i
 
					if item = saves[slot]
						load "#{item}"
						break
					end
				end
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
			File.open("./Save/"+saveName+".cfg","w")
			break
		end
	end
end
puts b
# show all saves! Dir["./Save/*.save"].each {|save| puts "Load "+save }
