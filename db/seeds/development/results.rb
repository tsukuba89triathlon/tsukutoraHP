0.upto(3) do |j|
  0.upto(8) do |idx|
    Result.create(
      date: Date.new(2017 - idx, 5, 21 - idx),
      game_id: Game.find(idx+1).id,
      division_id: Division.find(idx+1).id,
      total_rank: 52,
      state: 'finish',
      member_id: Member.find(j+1).id,
      total_time: [Time.parse("#{2017-idx}-5-#{21-idx} 02:10:49 +0900"),Time.local(2017-idx,5,21-idx,2,15,10)][j % 2],
      s_time: Time.local(2017-idx,5,21-idx,0,22,49),
      s_rank: 46,
      b_time: Time.local(2017,05,21,01,03,47),
      b_rank: 40,
      split: Time.local(1900,01,01,01,26,36),
      split_rank: 40,
      r_time: [Time.local(2017-idx,5,21-idx,0,44,13),Time.local(2017-idx,5,21-idx,0,44,44)][j % 2],
      r_rank: 87,
      remarks: nil
    )
  end
end
