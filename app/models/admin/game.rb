class Admin::Game < ApplicationRecord
  has_many :divisions, dependent: :destroy
  has_many :results
  has_one :topic

  validates :game, :date, :game_type, presence: true

  def attribute_names
    case self.game_type
    when 1 # triathlon
      attribute_names = ['総合','Swim','Bike','Split','Run']
    when 2
      attribute_names = ['総合','1stRun','Bike','Split','2ndRun']
    when 3
      attribute_names = ['総合','1stRun','Swim','Split','2ndRun']
    when 4
      attribute_names = ['総合','Swim','Run']
    end
    return attribute_names
  end
end
