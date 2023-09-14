# じゃんけんの手を定義
hands = ["グー", "チョキ", "パー"]

# プレイヤーの入力とゲームの実行
results_file = "janken_results.txt"

loop do
  # プレイヤーに手を選ばせる
  puts "じゃんけんを始めます。"
  puts "0: グー, 1: チョキ, 2: パー, q: 終了"
  print "手を選んでください: "
  player_choice = gets.chomp.downcase
  
  # 終了条件
  if player_choice == 'q'
    puts "ゲームを終了します。"
    break
  end
  
  # 入力のバリデーション
  unless player_choice.match?(/^\d$/) && (0..2).cover?(player_choice.to_i)
    puts "無効な入力です。0から2までの数字を選んでください。"
    next
  end
  
  # コンピュータの手をランダムに選ぶ
  computer_choice = rand(3)
  
  puts "プレイヤー: #{hands[player_choice.to_i]}"
  puts "コンピュータ: #{hands[computer_choice]}"
  
  # 勝敗を判定
  result = (player_choice.to_i - computer_choice) % 3
  result_message = ""
  
  if result == 0
    result_message = "引き分けです。"
  elsif result == 1
    result_message = "プレイヤーの勝ちです！"
  else
    result_message = "コンピュータの勝ちです。"
  end
  
  # 結果をファイルに保存
  File.open(results_file, "a") do |file|
    file.puts "プレイヤー: #{hands[player_choice.to_i]}, コンピュータ: #{hands[computer_choice]}, 結果: #{result_message}"
  end
  
  puts result_message
end
