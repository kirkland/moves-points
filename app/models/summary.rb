class Summary < ActiveRecord::Base
  # Validations
  validates :date, presence: true
  validates :distance, presence: true
  validates :kind, presence: true
  validates :user, presence: true
end
