require_relative 'player'
require_relative 'question'

class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1
  end

  def start_game
    until game_over?
      current_question = Question.new
      puts "----- NEW TURN -----"
      puts "#{@current_player.name}: #{current_question.generate_question}"
      print "> "
      player_answer = gets.chomp.to_i
      if current_question.correct_answer?(player_answer)
        puts "#{@current_player.name}: YES! You are correct."
      else
        puts "#{@current_player.name}: Seriously? No!"
        @current_player.lose_life
      end
      display_scores
      switch_turns
    end
    conclude_game
  end

  private

  def game_over?
    @player1.lives == 0 || @player2.lives == 0
  end

  def switch_turns
    @current_player = (@current_player == @player1) ? @player2 : @player1
  end

  def display_scores
    puts "P1: #{@player1.lives}/3 vs P2: #{@player2.lives}/3"
  end

  def conclude_game
    winner = @player1.lives > 0 ? @player1 : @player2
    puts "#{winner.name} wins with a score of #{winner.lives}/3"
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end
end
