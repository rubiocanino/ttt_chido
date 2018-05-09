require 'winner'
require "colorize"

class Board
  #To valid and set the size of the board n*n
  def initialize(player1Start)
    check = false
    while check == false do
      print  "Size of de board nxn: "
      size = gets.chomp.to_i
      if( size != nil and size >0)
        check = true
      else
        print 'Invalid number. '
        gets.chomp
        system('clear')
      end
    end
    controlFlow(size,player1Start)
  end

  #To have the flow of all the game and validations
  #To control the turn of the player
  #To display and call the methods that changes the board
  #To call the methods to check if a player won
  private def  controlFlow(size,player1Start)
    @@sizeBoard = size
    winner = Winner.new(@@sizeBoard)
    @player = player1Start
    board = cleanBoard()
    3.times {puts "\n"}

    loop do
      #To the turn of player X

      case @player
      when 1
        @player = 1
        displayBoard(board)
        move = playerTurn(board,"Player X : ")
        board = changeBoard(move,1,board)
        setLastPlayer(@player) if true ==  winner.countingSymbol(board,"X") or nil == winner.countingSymbol(board,"X")
        break if true ==  winner.countingSymbol(board,"X")
        break if nil == winner.countingSymbol(board,"X")
        @player = 2
      when 2
        #To the turn of player O
        @player = 2
        displayBoard(board)
        move =  playerTurn(board,"Player O :")
        board = changeBoard(move,2,board)
        system('clear')
        setLastPlayer(@player) if true ==  winner.countingSymbol(board,"O") or nil == winner.countingSymbol(board,"O")
        break if true ==  winner.countingSymbol(board,"O")
        break if nil == winner.countingSymbol(board,"X")
        @player = 1
      end
      3.times {puts "\n"}
    end
      displayBoard(board)
  end

  #To display in the console which player it's gonna play
  private def playerTurn(board,player)
    check = false
    while check == false do
      puts ""
      puts "..........................."
      print "\t"+player
      aux = gets.chomp
      aux = aux.to_i
      if( aux.is_a?(Integer) and aux > 0)
        check = true  if goodMovement(board,aux)
      end
      puts "\t\tInvalid position" if check == false
    end
    return aux
  end

  #To check if the movement of the player is valid
  private def goodMovement(board,move)
    move = move.to_s
    board.each do |block|
      if block.include?(move)
        return true
      end
    end
    return false
  end

  #To do the changes of the movement of the player
  private def changeBoard(move,player,board)
    move = move.to_s
    board.each_with_index do |block,index|
      if( block.include?(move) )
        case player
        when 1
          board[index] = block.gsub(/\t#{move}\t/,"\tX\t".colorize(:blue))
        when 2
          board[index] = block.gsub(/\t#{move}\t/,"\tO\t".colorize(:red))
        end
      end
    end
    return board
  end

  #To build a new Board
  private def cleanBoard()
    index = 1
    j=1
    board = []
    @@lineBoard = ""
    while j <= @@sizeBoard do
      i=1
      line = ""
      while i <= @@sizeBoard do
        if (i == @@sizeBoard)
          board << "\t#{index}\t"
          line+="________________"
        else
          board <<"\t#{index}\t|"
          line+="________________"
        end
        i+=1
        index+=1
      end
      @@lineBoard = line if @@lineBoard != line
      j+=1
    end
    return board
  end

  #To display the board any time
  private def displayBoard(board)
    index = 1
    board.each_with_index do |block,position|
      print block
      if index  == @@sizeBoard
        puts ""
        index = 0
        puts @@lineBoard if position < board.length-1
      end
      index+=1
    end
    return
  end

  private def setLastPlayer(player)
    @@lastWinner = player
  end

  public def getLastPlayer
    return @@lastWinner
  end
end
