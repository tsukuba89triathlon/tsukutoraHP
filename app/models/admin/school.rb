class Admin::School < ApplicationRecord
  has_many :colleges

  validates :school, presence: true
end
