# プレイヤーの情報を保存するファイル
player_data_file = "player_data.txt"

# ゲームの説明
puts "数字当てゲームを始めます。1から100までの数字を当ててください。"
puts "終了するにはqを入力してください。"

# プレイヤー名を入力
print "プレイヤー名を入力してください: "
player_name = gets.chomp

# プレイヤーの入力とゲームの実行
loop do
  # 正解の数字をランダムに選ぶ
  correct_number = rand(1..100)
  attempts = 0

  puts "新しいゲームを始めます。"

  loop do
    print "数字を入力してください: "
    user_input = gets.chomp

    # 終了条件
    if user_input.downcase == 'q'
      puts "ゲームを終了します。正解は #{correct_number} でした。"
      File.open(player_data_file, "a") do |file|
        file.puts "#{player_name}: #{attempts + 1} ターン"
      end
      break
    end

    # 入力のバリデーション
    unless user_input.match?(/^\d+$/)
      puts "無効な入力です。1から100までの数字を入力してください。"
      next
    end

    # 入力を整数に変換
    guess = user_input.to_i
    attempts += 1

    # 結果の表示
    if guess == correct_number
      puts "正解です！#{attempts} ターンで当てました。おめでとうございます。"
      File.open(player_data_file, "a") do |file|
        file.puts "#{player_name}: #{attempts} ターン"
      end
      break
    elsif guess < correct_number
      puts "もっと大きな数です。"
    else
      puts "もっと小さな数です。"
    end
  end

  print "新しいゲームを始めますか？ (y/n): "
  play_again = gets.chomp.downcase
  break unless play_again == 'y'
end
