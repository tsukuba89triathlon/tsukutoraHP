class Lab::PracticeLog < ApplicationRecord
  belongs_to :member

  scope :monthly_sum, -> (today){ where('date < ? AND date >= ?',today.beginning_of_month >> 1,today.beginning_of_month).
    select('member_id, SUM(swim) AS swim_sum, SUM(bike) AS bike_sum, SUM(run) AS run_sum, SUM(conversion_distance) AS conv_dist').
    group(:member_id).order('conv_dist DESC').includes(:member)
  }
  scope :annual_sum, -> (today){
    where('date < ? AND date >= ?',today.months_since(9).beginning_of_year >> 3,today.months_ago(3).beginning_of_year >> 3).
    select('member_id, SUM(swim) AS swim_sum, SUM(bike) AS bike_sum, SUM(run) AS run_sum, SUM(conversion_distance) AS conv_dist').
    group(:member_id).order('conv_dist DESC').includes(:member)
  }
  def previous(user_id)
    if self.member_id == user_id
      Lab::PracticeLog.where("member_id = ? AND date > ?",member_id,date).order(date: :asc).first
    else
      Lab::PracticeLog.where("public != ? AND member_id = ? AND date > ?",true,member_id,date).order(date: :asc).first
    end
  end

  def next(user_id)
    if self.member_id == user_id
      Lab::PracticeLog.where("member_id = ? AND date < ?",member_id,date).order(date: :desc).first
    else
      Lab::PracticeLog.where("public != ? AND member_id = ? AND date < ?",true,member_id,date).order(date: :desc).first
    end
  end

  validate :uniqueness
  validates :swim, :bike, :run, numericality: {greater_than_or_equal_to: 0}

  private
  def uniqueness
    unless Lab::PracticeLog.where('member_id = ? AND date = ? AND id != ? ',member_id,date,id).empty?
      errors.add(:date, "が重複しています。編集するようにしてください。")
    end
  end
end
