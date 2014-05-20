ELO_MAPPER = {}
begin
  # League.includes(:players).each do |league| 
  #   ELO_MAPPER[league.id] ||= {}
  #   #map all the players
  #   league.players.each do |player|
  #     ELO_MAPPER[league.id][player.id] ||= Elo::Player.new
  #   end

  #   #inject the games
  #   league.games.each do |game|
  #     home = ELO_MAPPER[league.id][game.home_player_id]
  #     away = ELO_MAPPER[league.id][game.away_player_id]
      
  #     if game.home_won? 
  #       home.wins_from(away)
  #     elsif game.away_won?
  #       home.loses_from(away)
  #     else #tie
  #       home.plays_draw(away)
  #     end
        
  #   end
  # end
rescue => e 
  ap "****** Can't load ELO MAPPER"
  ap e.message
  ap e.backtrace
end