require "colorize"

class Winner
  #To assign the size of the board
  def initialize(size)
    @@sizeBoard = size
  end

  #To control and check the ways to win the game
  public def countingSymbol(board,symbol)
    return nil if  checkTie(board)
    return true if checkHorizontal(board,symbol)
    return true if checkVertical(board,symbol)
    return true if checkDiagonal(board,symbol)
    return false
  end

  #To check the Horizonal ways to win the game
  private def checkHorizontal(board,symbol)
    playerWon = false
    index = 0
    findSymbolArray = []
    board.each do |block|
      findSymbolArray << block.include?(symbol)
      break if playerWon
      if findSymbolArray.length == @@sizeBoard
        playerWon = true if findSymbolArray.all? {|findValue| findValue == true}
        index = 0
        findSymbolArray = []
      end
      index+=1
    end
    congratulationPlayer(board,symbol) if playerWon
    return playerWon
  end

  #To check the Vertical ways to win the game
  private def checkVertical(board,symbol)
    playerWon = false
    findSymbolArray = []
    board.each_with_index do |block,index|
      jump = index
      count = 1
      if block.include?(symbol)
          loop do
            findSymbolArray << board[jump].include?(symbol) if count <= @@sizeBoard and jump < board.length
            if count == @@sizeBoard
              playerWon = findSymbolArray.all? {|findValue| findValue == true}
              break
            end
            count+=1
            jump+=@@sizeBoard
            break if jump >= board.length
          end
          findSymbolArray = []
          break if playerWon
      end
    end
    congratulationPlayer(board,symbol) if playerWon
    return playerWon
  end

  #To check the Diagonal way to win the game
  private def checkDiagonal(board,symbol)
    playerWon = false
    findSymbolArray = []
    board.each_with_index do |block,index|
      jump = index
      count = 1
      if block.include?(symbol)
          loop do
            findSymbolArray << board[jump].include?(symbol) if count <= @@sizeBoard and jump < board.length
            if count == @@sizeBoard
              playerWon = findSymbolArray.all? {|findValue| findValue == true}
              break
            end
            count+=1
            jump+=(@@sizeBoard+1)
            break if jump >= board.length
          end
          findSymbolArray = []
          break if playerWon
      end
    end
    unless playerWon
      playerWon =  diagonalInversa(board,symbol)
    end
    congratulationPlayer(board,symbol) if playerWon
    return playerWon
  end

  #To check the other Diagonal way to win the game
  private def diagonalInversa(board,symbol)
    playerWon = false
    findSymbolArray = []
    jump = @@sizeBoard-1
    count = 1
    loop do
      findSymbolArray << board[jump].include?(symbol) if count <= @@sizeBoard
      if count == @@sizeBoard
        playerWon = findSymbolArray.all? {|findValue| findValue == true}
        break
      end
      count+=1
      jump+=(@@sizeBoard-1)
      break if playerWon
      break if jump >= board.length
    end
    return playerWon
  end

  #To check if the game ends because the players tie
  private def checkTie(board)
    countSymbol = []
    board.each do |block|
      countSymbol << true if block.include?('X') || block.include?('O')
    end
    congratulationTie if countSymbol.length == (@@sizeBoard*@@sizeBoard)
    return countSymbol.length == (@@sizeBoard*@@sizeBoard)
  end

  #To send a message to the player who won
  private def congratulationPlayer(board,symbol)
    system('clear')
   3.times{
    puts "======================================================================"
    puts "               W I N N E R   P L A Y E R '#{symbol}'".colorize(:green)
    puts "======================================================================"
    puts "              C O N G R A T U L A T I O N S"
    puts "======================================================================"
    puts
    }
  end

  private def congratulationTie
    system('clear')
   3.times{
    puts "======================================================================"
    puts "                          T  I   E ".colorize(:red)
    puts "======================================================================"
    puts "              C O N G R A T U L A T I O N S"
    puts "======================================================================"
    puts
    }
  end
end
