newArray = Array.[] 

newArray.push 'nil'  
newArray.push 'nil2'  
newArray.push 'nil3'

while true  
    load = gets.to_i

    unless newArray[Integer(load)]
        puts 'That pieace of the Array is loaded' 
        break
    end  
end