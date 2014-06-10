class Activity < ActiveRecord::Base
  # Validations
  validates :date, presence: true
  validates :distance, presence: true
  validates :kind, presence: true
  validates :moves_identifier, presence: true
  validates :user, presence: true
end
