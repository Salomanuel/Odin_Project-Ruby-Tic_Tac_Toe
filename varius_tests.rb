=begin

easy_as_123 = ("a".."c").to_a
10.times do |j|
	if j >= easy_as_123.length
		puts "j is #{j}, letter is #{easy_as_123[j % easy_as_123.length]}"
	else 
		puts "j is #{j}, letter is #{easy_as_123[j]}"
	end
end

(?a..?c).cycle.take(10).each.with_index do |letter, j|
	puts "#{letter}"
end

0.upto(2) do |j|
	2.downto(0) { |k| puts "j is #{j} and k is #{k}"}
end


analyzer(board[0][2])
analyzer(board[1][1])
analyzer(board[2][0])

=end
arra = [0,1,2]
arra.each { |j| puts "#{arra[j]} and #{arra[-(j+1)]}"}


