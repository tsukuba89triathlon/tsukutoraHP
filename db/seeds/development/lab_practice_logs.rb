0.upto(100) do |idx|
  swim = rand(0..4) + rand(0..9)/10
  bike = rand(0..100) + rand(0..9)/10
  run = rand(0..15) + rand(0..9)/10
  Lab::PracticeLog.create(
    member_id: Member.find(idx % 4 + 1).id,
    date: Date.today - idx.div(3).day,
    swim: swim,
    bike: bike,
    run: run,
    remark: "",
    conversion_distance: swim * 2 + bike * 0.4 + run
  )
end
