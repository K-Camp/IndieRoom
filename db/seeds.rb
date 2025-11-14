# --- Users ---
user1 = User.find_or_create_by!(email: "yamada@example.com") do |u|
  u.password = "password"
  u.user_name = "山田太郎"
  u.introduction = "ゲームが大好きなプレイヤーです！"
  u.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user1_image.png"), filename:"sample-user1.png")
end

user2 = User.find_or_create_by!(email: "satou@example.com") do |u|
  u.password = "password"
  u.user_name = "佐藤花子"
  u.introduction = "アクションゲーム一筋です！"
  u.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user2_image.png"), filename:"sample-user2.png")
end

user2 = User.find_or_create_by!(email: "suzuki@example.com") do |u|
  u.password = "password"
  u.user_name = "鈴木一郎"
  u.introduction = "RPGが得意です"
  u.profile_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/user3_image.png"), filename:"sample-user3.png")
end

# --- Genres ---
genre_action = Genre.find_or_create_by!(genre_name: "アクション")
genre_rpg = Genre.find_or_create_by!(genre_name: "RPG")
genre_shooter = Genre.find_or_create_by!(genre_name: "シューティング")

# --- Games ---
game1 = Game.find_or_create_by!(game_name: "クロノブレイカーズ") do |g|
  g.genre_id = genre_rpg.id
  g.synopsis = "時を操る冒険者たちの壮大な物語が展開するRPG。"
  g.release_date = "2024-03-10"
  g.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/rpg.png"), filename:"sample-rpg.png")
end

game2 = Game.find_or_create_by!(game_name: "スターフォージ・ゼロ") do |g|
  g.genre_id = genre_shooter.id
  g.synopsis = "近未来の宇宙を舞台にした爽快なSFシューティングゲーム。"
  g.release_date = "2023-11-25"
  g.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/shooting.png"), filename:"sample-shooting.png")
end

game3 = Game.find_or_create_by!(game_name: "レイジオブキングス") do |g|
  g.genre_id = genre_action.id
  g.synopsis = "復讐を誓う忍者が圧政を敷く帝国と戦うアクションゲーム。"
  g.release_date = "2022-07-18"
  g.game_image = ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/action.png"), filename:"sample-action.png")
end

# --- Posts（レビュー） ---
Post.find_or_create_by!(user_id: user1.id, game_id: game1.id) do |p|
  p.score = 5
  p.post_title = "神ゲー確定！"
  p.content = "ストーリーと世界観が圧倒的に良い。戦闘も爽快でおすすめ。"
end

Post.find_or_create_by!(user_id: user1.id, game_id: game2.id) do |p|
  p.score = 4
  p.post_title = "グラフィック最高"
  p.content = "宇宙ステージの臨場感がすごい。難易度はやや高め。"
end

Post.find_or_create_by!(user_id: user2.id, game_id: game3.id) do |p|
  p.score = 3
  p.post_title = "普通に楽しめる"
  p.content = "アクションは良いけどボリュームが少し物足りなかった。"
end

puts "Seed data created successfully!"
