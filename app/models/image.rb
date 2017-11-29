class Image < ApplicationRecord
  belongs_to :member
  scope :member_images, ->(member_id) {where(member_id: member_id)}

  validates :order, presence: true, uniqueness: true
end
