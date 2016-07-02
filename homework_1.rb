
def calculator (f_num,s_num,option)
	case option
		when 'A' then return f_num + s_num
		when 'B' then return f_num * s_num
		when 'C' then return f_num - s_num
		#when 'D' 
		#	if s_num == 0
		#		return "check your second number!"
		#	else
		#return f_num / s_num						
	end
end


puts "Welecome to ruby Calculator !"

puts "Please enter the first number:"
num1 = gets.chomp.to_f

puts "Please enter the second number:"
num2 = gets.chomp.to_f

puts "A) + B) - C) * D) /"
op = gets.chomp.to_s

puts "Your answer is :"
result = calculator(num1,num2,op)
puts "#{result}"
