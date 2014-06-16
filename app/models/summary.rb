class Summary < ActiveRecord::Base
  # Associations
  belongs_to :user

  # Validations
  validates :bicycling_distance, presence: true
  validates :date, presence: true
  validates_uniqueness_of :date, scope: :user_id
  validates :running_distance, presence: true
  validates :user, presence: true
  validates :walking_distance, presence: true

  # Scopes
  scope :between_dates,
    lambda { |start_date, end_date| where('date BETWEEN ? AND ?', start_date, end_date) }

  def bicycling_miles
    # Convert meters to miles
    bicycling_distance * 0.000621371
  end

  def points
    (bicycling_miles * 10) +
      (walking_miles * 30) +
      (running_miles * 100)
  end

  def running_miles
    running_distance * 0.000621371
  end

  def walking_miles
    walking_distance * 0.000621371
  end
end
