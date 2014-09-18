#####################
#	9/12/2014		#
#	Created by:		#
#	Co [TBB]		#
#####################

### Needed ###
require './Core.rb'
Dir["./Map/*.rb"].each {|map| require map }

### Save System ###
clear
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
			clear
			puts 'How do you want to name your save?'
			saveName = gets.chomp
			saveNew = File.open("./Save/"+saveName+".cfg","w")
			load saveNew
			write_at_new(saveNew, 1, 'map = 00.rb')
			break
		elsif saveLoad == '2'
			#Load game#
			clear
			i = 0
			saves = Array.[]
			saves.push 'nil'
			puts 'Please select a number: '
			Dir["./Save/*.cfg"].each {|save| puts "#{i+=1}. #{File.basename(save).match(/(.*)\.cfg/)}"[0...-4]}
			Dir["./Save/*.cfg"].each {|save| saves.push save}
			puts
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
	while true
		saveLoad = gets.chomp
	
		if saveLoad == '1'
			#Create new game#
			clear
			puts 'How do you want to name your save?'
			saveName = gets.chomp
			saveNew = File.open("./Save/"+saveName+".cfg","w") 
			load saveNew
			write_at_new(saveNew, 1, 'map = 00.rb')
			break
		end
	end
end
puts map
# show all saves! Dir["./Save/*.save"].each {|save| puts "Load "+save }
