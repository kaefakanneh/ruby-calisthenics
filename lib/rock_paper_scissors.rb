class RockPaperScissors

  # Exceptions this class can raise:
  class NoSuchStrategyError < StandardError ; end

  def self.winner(player1, player2)
    raise RockPaperScissors::NoSuchStrategyError,"Strategy must be one of R,P,S" unless (player1[1] && player2[1]) =~ /[rps]/i

    if player1[1] == player2[1] 
      player1
    elsif player1[1] =~ /r/i && player2[1] =~ /s/i
      player1
    elsif player1[1] =~ /s/i && player2[1] =~ /p/i
      player1
    elsif player1[1] =~ /p/i && player2[1] =~ /r/i
      player1
    else
      player2
    end
  end

  def self.tournament_winner(tournament)
    top_bracket = tournament[0]
    bottom_bracket = tournament[1]

    while top_brack.size > 1
      draw_winner = []
      top_bracket.each do |draw|
        draw_winner[-1] = self.winner(draw[0], draw[1])
      end
      top_bracket = draw_winner
    end

    while bottom_bracket.size > 1
      draw_winner = []
      bottom_bracket.each do |draw|
        draw_winner[-1] = self.winner(draw[0], draw[1])
      end
      bottom_bracket = draw_winner
    end

    self.winner(top_bracket, bottom_bracket)
   end

end
