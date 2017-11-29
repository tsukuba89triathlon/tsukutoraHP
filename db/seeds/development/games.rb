0.upto(8) do |idx|
  Game.create(
    game: "日本学生スプリングトライアスロン選手権渡良瀬大会",
    date: Date.new(2017 - idx, 5, 21 - idx),
    year: Date.new(2017 - idx).year,
    game_type: 1,
    game_anchor: 1
  )
end
Game.create(
 game: '関東学生トライアスロン選手権那須塩原大会',
 date: Date.new(2017,6,25),
 year: 2017,
 game_type: 1,
 game_anchor: 2
)
Game.create(
 game: '日本学生トライアスロン選手権観音寺大会',
 date: Date.new(2017,9,3),
 year: 2017,
 game_type: 1,
 game_anchor: 3
)
