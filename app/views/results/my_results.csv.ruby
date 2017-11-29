require 'kconv'

def time_str(time)
  if time
    time.strftime('%H:%M:%S')
  end
end
game_type = ["#{t('activerecord.attributes.admin/game.triathlon')}",
  "#{t('activerecord.attributes.admin/game.duathlon')}",
  "#{t('activerecord.attributes.admin/game.3part-aquathlon')}",
  "#{t('activerecord.attributes.admin/game.2part-aquathlon')}"
]
col = ["日付","大会名","部門名","完走者数","総合順位","総合タイム"]
result_attr =[
  ["Swim Lap","Swim順位","Bike Lap","Bike順位","Split Time","Split順位","Run Lap","Run順位"],
  ["1st-Run Lap","1st-Run順位","Bike Lap","Bike順位","Split Time","Split順位","2nd-Run Lap","2nd-Run順位"],
  ["1st-Run Lap","1st-Run順位","Swim Lap","Swim順位","Split Time","Split順位","2nd-Run Lap","2nd-Run順位"],
  ["Swim Lap","Swim順位","Run Lap","Run順位"]
]
result = ''
cols = []
1.upto(4) do |idx|
  result << game_type[idx-1].to_s
  result << "\r"
  cols[idx-1] = col + result_attr[idx-1] + ["備考"]
  result << cols[idx-1].join(',')
  result << "\r"

  @results[idx].each do |r|
    result << "#{r.game.date},#{r.game.game},#{r.division.div},#{r.division.finisher},#{r.total_rank},#{time_str(r.total_time)},"
    result << "#{time_str(r.s_time)},#{r.s_rank},#{time_str(r.b_time)},#{r.b_rank},#{time_str(r.split)},#{r.split_rank},#{time_str(r.r_time)},#{r.r_rank}"
    result << "#{r.remarks}"
    result << "\r"
  end
end

result.kconv(Kconv::SJIS, Kconv::UTF8)
