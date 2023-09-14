# ファイルから結果を読み込んで勝敗をカウントする
def count_results(file_name)
  wins = 0
  losses = 0
  
  File.open(file_name, "r") do |file|
    file.each_line do |line|
      if line.include?("プレイヤーの勝ち")
        wins += 1
      elsif line.include?("コンピュータの勝ち")
        losses += 1
      end
    end
  end
  
  [wins, losses]
end

# じゃんけんゲームの結果ファイル
results_file = "janken_results.txt"

# 勝敗をカウント
wins, losses = count_results(results_file)

# カウント結果を表示
puts "じゃんけんゲームの結果:"
puts "勝利回数: #{wins} 回"
puts "敗北回数: #{losses} 回"
