class Result < ApplicationRecord
  belongs_to :division
  belongs_to :member
  belongs_to :game

  scope :year, ->(year) { where("date < ? AND date >= ?",Date.new(year+1,4,2),Date.new(year,4,2)).order(date: :desc) }

end
