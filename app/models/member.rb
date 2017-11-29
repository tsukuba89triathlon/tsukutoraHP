class Member < ApplicationRecord
  has_secure_password

  scope :active, -> { where(status: 1).order(grade: :asc) }
  scope :grade, ->(grade) { where(grade: grade).order(grade: :asc).order(yomigana: :asc) }
  scope :obog, -> { where(status: 3).order(graduated_year: :desc) }

  has_many :results
  has_many :lab_practice_logs
  has_many :images

  def grade_str
    if self.grade < 10 then
      "#{self.grade}年"
    elsif self.grade < 20 then
      "修士#{self.grade-10}年"
    else
      "博士#{self.grade-20}年"
    end
  end

end
