# プレイヤーランキングを表示する
def display_ranking(file_name)
  puts "プレイヤーランキング:"
  ranking = {}

  File.open(file_name, "r") do |file|
    file.each_line do |line|
      player, turns = line.split(": ")
      ranking[player] = turns.to_i
    end
  end

  sorted_ranking = ranking.sort_by { |_player, turns| turns }

  sorted_ranking.each_with_index do |(player, turns), index|
    puts "#{index + 1}. #{player}: #{turns} ターン"
  end
end

# プレイヤーランキングを表示
player_data_file = "player_data.txt"
display_ranking(player_data_file)
