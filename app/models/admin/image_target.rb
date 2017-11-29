class Admin::ImageTarget < ApplicationRecord
  has_many :images

  scope :r_year, ->(year) {where('target = ?',"r#{year}")}
  scope :g_year, ->(year) {where('target = ?',"g#{year}")}

  def self.recent_year(num)
    year = Date.today.months_ago(3).year
    targets = ['top_slide']
    0.upto(num) do |idx|
      targets[idx+1] = ["r#{year - idx}","g#{year - idx}"]
    end
    targets = targets.flatten
    str = ""
    targets.each do |target|
      unless target == targets.last
        str = str + " target = '#{target}' OR"
      else
        str = str + " target = '#{target}' "
      end
    end
    where(str)
  end

  def target_str
    str = self.target
    if str == 'top_slide'
      'TOPページスライドショー'
    elsif /g[0-9]{4}/ =~ str
      "部員紹介Topページ（#{str[/[0-9]{4}/]}年度入学）"
    elsif /r[0-9]{4}/ =~ str
      "リザルトTopページ（#{str[/[0-9]{4}/]}年度分）"
    end
  end
end
