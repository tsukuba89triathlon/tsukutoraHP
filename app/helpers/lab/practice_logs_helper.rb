module Lab::PracticeLogsHelper
  def calender(date, logs=Lab::PracticeLog.none, option=1) # 指定した日付を含む月のカレンダーを表示 #日曜始まりなら0、月曜始まりは1
    calender = "<thead><tr><th><a href=#{member_lab_practice_logs_path}?date=#{date.last_month}>#{t('general.previous')}</a></th><th colspan='5'>#{date.strftime('%Y年%m月')}</th><th><a href=#{member_lab_practice_logs_path}?date=#{date.next_month}>#{t('general.next')}</a></th></tr>"

    if option == 1
      calender << "<tr><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th class='sat'>土</th><th class='sun'>日</th></tr></thead>"
    else
      calender << "<tr><th class='sun'>日</th><th>月</th><th>火</th><th>水</th><th>木</th><th>金</th><th class='sat'>土</th></tr></thead>"
    end

    calender << "<tbody>"
    calender << "<tr>"
    left = date.beginning_of_month.days_ago(option).wday
    right = 6 - date.end_of_month.days_ago(option).wday
    days = date.end_of_month.day

    left.times do #先月分の余白
      calender << "<td></td>"
    end
    days.times do |day_num|
      log = @logs.find_by(date: Date.new(date.year,date.month,day_num + 1))
      if (left + day_num + option + 1) % 7 == 0#土曜日
        calender << "<td class='sat'>"
      elsif (left + day_num + option + 1) % 7 == 1#日曜日
        calender << "<td class='sun'>"
      else #それ以外
        calender << "<td>"
      end
      if log
        if log.public == false
          calender << "<div class='date'>#{day_num + 1}</div><a class='log_link clearfix' href=#{lab_practice_log_path(log)}><div class='log'>S:#{log.swim == nil ? 0 : log.swim}<br>B:#{log.bike == nil ? 0 : log.bike}<br>R:#{log.run == nil ? 0 : log.run}</div><div class='details'>(詳細)</div></a></td>"
        else
          calender << "<div class='date'>#{day_num + 1}</div><div class'log_link'><div class='log'>S:#{log.swim == nil ? 0 : log.swim}<br>B:#{log.bike == nil ? 0 : log.bike}<br>R:#{log.run == nil ? 0 : log.run}</div></div></td>"
        end
      else
        calender << "<div class='date'>#{day_num + 1}</div><div class='log'></div></td>"
      end

      if (left + day_num + 1) % 7 == 0
        calender << "</tr><tr>"
      end
    end

    right.times do # 来月分の余白
      calender << "<td></td>"
    end

    calender << "</tr>"
    calender << "</tbody>"
    return calender
  end
end
