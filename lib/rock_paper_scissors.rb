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
   if tournament[0][1] =~ /[prs]/i
      winner(tournament[0],tournament[1])
    else
        top_draw = tournament[0]
        bottom_draw = tournament[1]
        
            
        while !top_draw[0][1].is_a? String
          win_draw1 = Array.new
          win_draw2 = Array.new
           
          top_draw.each { |player|  win_draw1 <<  winner(player[0], player[1]) }
          bottom_draw.each{ |player| win_draw2 << winner(player[0], player[1])}
          
          top_draw = win_draw1         
          bottom_draw = win_draw2 
        end 
                
       winner(winner(top_draw[0],top_draw[1]) ,  winner(bottom_draw[0],bottom_draw[1]))       
       
    end
  end

end
