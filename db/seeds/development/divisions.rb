0.upto(8) do |idx|
  Division.create(
    game_id: Game.find(idx+1).id,
    div: "OP男子",
    distance: "",
    finisher: 152,
    team_rank: 3,
    num_of_team: 13
  )
end
Division.create(
  game_id: Game.find(10).id,
  div: "男子",
  distance: "short",
  finisher: 238,
  team_rank: 13,
  num_of_team: 19
)
Division.create(
  game_id: Game.find(10).id,
  div: "女子",
  distance: "short",
  finisher: 49,
  team_rank: 3,
  num_of_team: 6
)
Division.create(
  game_id: Game.find(11).id,
  div: "男子",
  distance: "short",
  finisher: 145,
  team_rank: 19,
  num_of_team: 19
)
Division.create(
  game_id: Game.find(11).id,
  div: "女子",
  distance: "short",
  finisher: 45,
  team_rank: 3,
  num_of_team: 3
)
