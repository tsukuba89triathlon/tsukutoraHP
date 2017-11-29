require 'kconv'

logs = ''

logs << "日付,Swim,Bike,Run,換算走行距離,メモ\r"

@logs.each do |log|
  logs << "#{log.date},#{log.swim.to_f},#{log.bike.to_f},#{log.run.to_f},#{log.conversion_distance.round(3)},#{log.remark}\r"
end

logs.kconv(Kconv::SJIS, Kconv::UTF8)
