class Admin::College < ApplicationRecord
  belongs_to :school
  has_many :members

  validates :college, :abbreviation, presence: true
end
