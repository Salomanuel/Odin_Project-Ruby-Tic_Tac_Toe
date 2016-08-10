module Board
	def initialize
		board_creator
		show_board
		#@@board[2][2] = "O"	
	end
	
	def show_board
		@@board.each { |j| puts j.join(" ") }
	end

	private
	def board_creator
		@@board = [[" ","A","B","C"]]
		3.times do |j|
			row = [j+1]
			3.times { row << "." }
			@@board << row
		end
	end
end

class Tictac
	#implement players
	#implement score
	#implement interface
	include Board
	def initialize
		super
		@move_count = 0
	end

	def move(x,y)
		@move_count += 1
		top_row = ("A".."C").to_a
		puts "\nturn #{@move_count}"
		puts "your move is #{top_row[x-1]}:#{y}"
		if @@board[x][y] == "."
			@@board[x][y] = "O"
		else
			puts "\nyou cannot do this move\n\n"
		end
		show_board
	end

	def score
		puts @@board.join
	end
end

uno = Tictac.new
uno.move(2,2)
uno.move(2,2)