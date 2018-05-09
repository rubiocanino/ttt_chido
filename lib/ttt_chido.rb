require "ttt_chido/version"
require 'game'
require "colorize"

module TttChido
  class TicTacToe
    def initialize;end
    
    public def start
      @salir = true;
      @player = 1
        while @salir do
          system('clear')
            puts '========================= M E N U ================================='
            print '                   Press enter to start '
            gets.chomp
            system('clear')
            start  = Board.new(@player)
            @player = start.getLastPlayer
            case @player
            when 1
              @player+=1
            when 2
              @player-=1
            end
            puts ""
            print "Press enter to continue: "
            gets.chomp
            system('clear')
            puts 'Want to play again? true/false'
            answer = gets.chomp
             @salir = false if answer == 'false'
             system('clear')
        end
        puts "~~~~~~~~~~~~~~~~ Thanks for playing ~~~~~~~~~~~~~~~~~"
        puts "~~~~~~~~~~~~~ Gem created by rubiocanino ~~~~~~~~~~~~~"
        puts ""
    end
  end
end
