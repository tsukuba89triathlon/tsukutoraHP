class Game < ApplicationRecord
  has_many :divisions
  has_many :results
  has_one :topic

  scope :year, ->(year) {where('date < ? AND date >= ?',Date.new(year + 1,4,2),Date.new(year,4,2)).order(date: :asc)}

  def game_anchor_str
    case self.game_anchor
    when 1
      'spring'
    when 2
      'kankare'
    when 3
      'inkare'
    when 4
      'sprint'
    when 5
      'duathlon'
    else
      ''
    end
  end
end
