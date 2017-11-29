class Admin::Division < ApplicationRecord
  belongs_to :game
  has_many :results

  validates :div, presence: true
  validates :distance, presence: true
  validates :finisher, :team_rank, numericality: { allow_blank: :true, greater_than_or_equal_to: 0 }
  validates :num_of_team, numericality: { allow_blank: :true, greater_than_or_equal_to: :team_rank, message: 'は団体順位以上の値にしてください。' }
end
