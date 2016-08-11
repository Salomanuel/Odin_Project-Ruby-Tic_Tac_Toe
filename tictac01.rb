module Board
	def initialize_board
		board_creator
		show_board
	end
	
	def show_board
		@@board.each do |row| 
			row.each do |line| 
				case line
				when nil 		then print "."
				when true		then print "X"
				when false 	then print "O"
				end
			end
			puts
		end
	end

	private
	def board_creator
		@@board = []
		3.times do |j|								#3 rows
			row = []
			3.times { row << nil }			#3 columns
			@@board << row
		end
	end
	def board
		@@board
	end
end

module Players
	@@player ||= false
	def change_player
		case @@player
		when true 	then @@player = false
		when false 	then @@player = true
		end
		puts "it's #{@@player ? "player 1" : "player 2"}'s turn"
	end

	def player
		@@player
	end
end

module TictacScore
	def score_check
		

		board.each_index do |x| 
			@p1 = 0
			@p2 = 0
			board[x].each_index do |y| 
				analyzer(board[x][y])
				win if @p1 >=3 or @p2 >=3
			end			
			@p1 = 0
			@p2 = 0
			board[x].each_index do |y| 
				analyzer(board[y][x])
				win if @p1 >=3 or @p2 >=3
			end			
		end

		
	end

	def analyzer(cell)
		case cell
		when true 	then @p1 += 1
		when false	then @p2 += 1
		end
	end

	private
	def win
		puts "#{player ? "player 1" : "player 2"} won!"
		exit
	end
end

class Tictac
					#implement score
					#implement interface
	include Board
	include Players
	include TictacScore

	def initialize
		puts "here is the board:\n\n"
		initialize_board
		puts "\nlet's go\n\n"
		@move_count = 0
	end

	def move(x,y)
		@move_count += 1
		puts "*" * 30
		puts "\tturn #{@move_count}"
		change_player
		if @@board[x][y] == nil
			 @@board[x][y] = @@player ? true : false
		else
			puts "\nyou cannot do this move\n"
		end
		show_board
		score_check
	end
end


uno = Tictac.new
uno.move(0,0)		#diagonal score p2
uno.move(0,2)
uno.move(1,0)
uno.move(1,1)
uno.move(2,2)
uno.move(2,0)

=begin		
uno.move(0,1)		#vertical score p2
uno.move(0,0)
uno.move(1,1)
uno.move(1,0)
uno.move(2,2)
uno.move(2,0)

uno.move(0,0)		#horizontal score
uno.move(1,0)
uno.move(0,1)
uno.move(1,1)
uno.move(0,2)
uno.move(1,2)






#require 'minitest/autorun'
#require 'minitest/pride'
#class FirstTests < Minitest::Test end

=end