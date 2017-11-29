class Admin::Member < ApplicationRecord
  has_secure_password
  validates :full_name, presence: true
  validates :yomigana, presence: true, format: { with: /\p{katakana}/, message: "はカタカナで入力してください。" }
  validates :user_name, presence: true, uniqueness: { allow_blank: true }

  scope :active, -> { where(status: 1).order(grade: :asc) }
  scope :grade, ->(grade) { where(grade: grade).order(grade: :asc).order(yomigana: :asc) }
  scope :obog, -> { where(status: 3).order(graduated_year: :desc) }
  scope :left, -> { where(status: 2).order(id: :desc) }
  scope :grad_year, ->(year) { where(graduated_year: year).order(yomigana: :asc) }

  has_many :results
  has_many :lab_practice_logs
  belongs_to :college

  def grade_str
    if self.grade < 10 then
      "#{self.grade}年"
    elsif self.grade < 20 then
      "修士#{self.grade-10}年"
    else
      "博士#{self.grade-20}年"
    end
  end

  def status_str
    case self.status
    when 1
      'active'
    when 2
      'left'
    when 3
      'obog'
    end
  end
end
