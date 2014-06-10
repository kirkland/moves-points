class Summary < ActiveRecord::Base
  # Validations
  validates :bicycling_distance, presence: true
  validates :date, presence: true
  validates :running_distance, presence: true
  validates :user, presence: true
  validates :walking_distance, presence: true

  def points
    (bicycling_distance * 10) +
      (walking_distance * 30) +
      (running_distance * 100)
  end
end
