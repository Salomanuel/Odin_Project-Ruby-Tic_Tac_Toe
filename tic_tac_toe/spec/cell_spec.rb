require "spec_helper"

module TicTacToe
	describe Cell 	do
		#tests here
		context "#initialize" do
			it "is initializated with a value of '' by default" do
				cell = Cell.new
				expect(cell.value).to eq ''
			end
			it "can be initiated with a value of 'X'" 					do
				cell = Cell.new("X")
				expect(cell.value).to eq "X"
			end
				end		
	end
	describe Player do
		context "#initialize" do
			it "raises an exception when initialized with {}" do
				expect { Player.new({}) }.to raise_error
			end
			it "does not raise an error when initialized with a valid input hash" do
				input = { color: "X", name: "Someone" }
				expect { Player.new(input) }.to_not raise_error
			end
		end
		context "#color" 			do
			it "returns the color" do
				input = { color: "X", name: "Someone" }
				player = Player.new(input)
				expect(player.color).to eq "X"
			end
		end
		context "#name" 			do
			it "returns the player's name" do
				input = { color: "X", name: "Someone" }
				player = Player.new(input)
				expect(player.name).to eq "Someone"
			end
		end
	end
	describe Board 	do 					# => two skipped
		context "#initialize" do 	# => two skipped
			it "initializes the board with a grid" 						do
				expect { Board.new(grid: "grid") }.to_not raise_error
			end
			it "sets the grid with three rows by default" 		do
				skip
				board = Board.new
				expect(board.grid).to have(3).things
			end
			it "creates three things in each row by default" 	do
				skip
				board = Board.new
				board.grid.each { |row| expect(row).to have(3).things }
			end
		end
		context "#grid" 			do
			it "returns the grid" do
				board = Board.new(grid: "blah")
				expect(board.grid).to eq "blah"
			end		
		end		
		context "#get_cell" 	do
			it "returns the cell based on the (x, y) coordinate" do
				grid = [["", "", ""], ["","", "something"], ["","",""]]
				board = Board.new(grid: grid)
				expect(board.get_cell(2,1)).to eq "something"
			end
		end
		context "#set_cell"		do
			it "updates the value of the cell object at a (x, y) coordinate" do
				Cat = Struct.new(:value)
				grid = [[Cat.new("cool"), "", ""], ["", "", ""], ["", "", ""]]
				board = Board.new(grid: grid)
				board.set_cell(0, 0, "meow")
				expect(board.get_cell(0, 0).value).to eq "meow"
			end
		end

		TestCell = Struct.new(:value)
		let(:x_cell) { TestCell.new("X") }
		let(:y_cell) { TestCell.new("Y") }
		let(:empty)  { TestCell.new }


		context "#game_over"	do
			it "returns :winner if winner? is true" 										do
				board = Board.new
				board.stub(:winner?) { true }
				expect(board.game_over).to eq :winner
			end

			it "returns :draw if winner? is false and draw? is true" 	do
				board = Board.new
				board.stub(:winner?) 	{ false }
				board.stub(:draw?)	 	{ true  }
				expect(board.game_over).to eq :draw
			end

			it "returns false if winner? is false and draw? is false" do
				board = Board.new
				board.stub(:winner?)	{ false }
				board.stub(:draw?)		{ false }
				expect(board.game_over).to eq false
			end
#***
			it "returns :winner when row has objects with values that are all the same" do
				grid = [
					[x_cell, x_cell, x_cell],
					[y_cell, x_cell, y_cell],
					[y_cell, y_cell, empty ]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :winner when column has objects with values that are all the same" do
				grid = [
					[x_cell, x_cell, empty],
					[y_cell, x_cell, y_cell],
					[y_cell, x_cell, empty]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :winner when diagonal has objects with values that are all the same" do
				grid = [
					[x_cell, empty, 	empty],
					[y_cell, x_cell, 	y_cell],
					[y_cell, x_cell, 	x_cell]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :winner
			end

			it "returns :draw when all spaces on the board are taken" do
				grid = [
					[x_cell, y_cell, x_cell],
					[y_cell, x_cell, y_cell],
					[y_cell, x_cell, y_cell]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq :draw
			end

			it "returns false when there is no winner or draw" do
				grid = [
					[x_cell, empty, empty],
					[y_cell, empty, empty],
					[y_cell, empty, empty]
				]
				board = Board.new(grid: grid)
				expect(board.game_over).to eq false
			end
		end
	end
end