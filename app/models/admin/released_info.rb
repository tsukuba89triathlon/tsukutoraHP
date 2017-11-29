class Admin::ReleasedInfo < ApplicationRecord
  validates :body, presence: true
  validate :date_vaild?

  private
  def date_vaild?
    dif = Date.today - date
    if dif.to_i < 0
      errors.add(:date, 'は未来を指定できません。')
    end
  end
end
