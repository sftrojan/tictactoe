class Game
	def initialize
		@board = Board.new
		@playerx = Player.new("x")
		@playero = Player.new("o")
		@counter = 0
	end

	def sample_board
		puts 	" 0 | 1 | 2  "
		puts	"------------"
		puts	" 3 | 4 | 5  "
		puts	"------------"
		puts  " 6 | 7 | 8  "
  end 

	def board_graphic
		f = @board.gameboard
		puts 	" #{f[0]} | #{f[1]} | #{f[2]}  "
 	  puts	"------------"
	  puts	" #{f[3]} | #{f[4]} | #{f[5]}  "
	  puts	"------------"
		puts  " #{f[6]} | #{f[7]} | #{f[8]}  "
	end 
   
  def move(answer, turn)
  	@board.gameboard[answer] = turn
  end 

	def valid_move?(answer)
		(@board.gameboard[answer.to_i] == " ") && ("0".."8").include?(answer)
	end

	def win?
		f = @board.gameboard
		([f[0], f[1], f[2]].uniq.length == 1 && f[0] != " ") ||
		([f[3], f[4], f[5]].uniq.length == 1 && f[3] != " ") ||
		([f[6], f[7], f[8]].uniq.length == 1 && f[6] != " ") ||
		([f[0], f[3], f[6]].uniq.length == 1 && f[0] != " ") ||
		([f[1], f[4], f[7]].uniq.length == 1 && f[1] != " ") ||
		([f[2], f[5], f[8]].uniq.length == 1 && f[2] != " ") ||
		([f[0], f[4], f[8]].uniq.length == 1 && f[0] != " ") ||
		([f[2], f[4], f[6]].uniq.length == 1 && f[2] != " ") 
	end

	def cat_game?
     !(@board.gameboard.include?(" "))
	end 

  def game_loop
    sample_board
    loop do
    turn = @counter %2 == 0 ? "o" : "x"
    board_graphic
    loop do 
      puts "#{turn.upcase}, what is your next move?"
      answer = gets.chomp
      if valid_move?(answer)
        move(answer.to_i, turn)
        break
      else
        puts "This spot is already taken!"
      end
    end 

    if win?
      puts "#{turn.upcase} you won!!!!"
      exit
    elsif cat_game?
      puts "Nobody won! =(O_O)="
      exit
    end
    @counter += 1
  end
end 



  class Board
    attr_accessor :gameboard
    
    def initialize
  	 @gameboard = Array.new
  	 9.times { @gameboard << " " }
    end

  end 

  class Player
    def initialize(xoro)
  	 @xoro = xoro
    end 
  end 
end 