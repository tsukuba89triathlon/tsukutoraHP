class Admin::Image < ApplicationRecord
  belongs_to :image_target
  scope :public_images, -> { where.not(image_target_id: nil) }
end
