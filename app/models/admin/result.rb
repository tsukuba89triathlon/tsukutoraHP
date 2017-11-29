class Admin::Result < ApplicationRecord
  belongs_to :division
  belongs_to :member
  belongs_to :game

  scope :year, ->(year) { where("date < ? AND date >= ?",Date.new(year+1,4,2),Date.new(year,4,2)) }
  scope :index, -> {includes(:division, :game, :member).order(date: :desc, state: :asc, total_rank: :asc)}

  validates :game_id, :division_id, :state, :member_id, presence: true
  validate :time_present?

  def result_check
    if self.total_check
      self.total_rank = nil
      self.total_time = nil
    end
    if self.s_check
      self.s_rank = nil
      self.s_time = nil
    end
    if self.b_check
      self.b_rank = nil
      self.b_time = nil
    end
    if self.split_check
      self.split = nil
      self.split_rank = nil
    end
    if self.r_check
      self.r_rank = nil
      self.r_time = nil
    end
    self.save
  end

  private
  def time_present?
    case self.state
    when 0
      unless s_time && s_rank && b_time && b_rank && split && split_rank && r_time && r_rank && total_time && total_rank
        errors[:base] << '全てのリザルトを登録してください。'
      end
    end
  end
end
