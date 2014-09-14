array = %w[nil nil2 nil3]
 
loop do
  input = gets.chomp
 
  if input =~ /\A\d+\z/
    slot = input.to_i
 
    if item = array[slot]
      puts "array[#{slot}] is #{item}"
	  break
    else
      puts "No item in #{slot}"
    end
 
    
  else
    puts "Invalid input #{input}"
  end
end