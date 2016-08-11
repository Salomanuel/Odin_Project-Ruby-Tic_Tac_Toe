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
		1.times do 										#diagonal1
			@p1 = 0
			@p2 = 0
			analyzer(board[0][0])
			analyzer(board[1][1])
			analyzer(board[2][2])
			win if @p1 >=3 or @p2 >=3
		end

		1.times do 										#diagonal2
			@p1 = 0
			@p2 = 0
			analyzer(board[0][2])
			analyzer(board[1][1])
			analyzer(board[2][0])
			win if @p1 >=3 or @p2 >=3
		end

		board.each_index do |x| 
			@p1 = 0
			@p2 = 0
			board[x].each_index do |y| 	#horizontal
				analyzer(board[x][y])
				win if @p1 >=3 or @p2 >=3
			end			
			@p1 = 0
			@p2 = 0
			board[x].each_index do |y| 	#vertical
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

module TictacInterface
	def welcome
		puts "Welcome to TicTac!"
		puts "here is the board:\n\n"
		initialize_board
		puts "\nlet's go\n\n"
	end

	def send_move
		puts "write the coordinates separated by a comma"
		choice = gets.chomp.split(",").collect{ |j| j.to_i }
 		self.move(choice[0],choice[1])
 	end


end

class Tictac
					#optimize score
					#optimize interface
					#implement tie
	include Board
	include Players
	include TictacScore
	include TictacInterface
	def initialize
		welcome
		@move_count = 0
		before_turn
	end

	def before_turn
		@move_count += 1
		puts "*" * 30
		puts "\tturn #{@move_count}"
		change_player
		send_move
	end

	def after_turn
		show_board
		score_check
		before_turn
	end

	def move(x,y)
		if @@board[x][y] == nil
			 @@board[x][y] = @@player ? true : false
		else
			puts "\nyou cannot do this move\n"
			send_move
		end
		after_turn		
	end
end


uno = Tictac.new
=begin
uno.move(0,0)		#diagonal score p2
uno.move(0,2)
uno.move(1,0)
uno.move(1,1)
uno.move(2,2)
uno.move(2,0)

		
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