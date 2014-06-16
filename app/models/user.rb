class User < ActiveRecord::Base
  # Associations
  has_many :oauth_tokens
  has_many :summaries

  def fetch_data_for_dates(start_date, end_date)
    api = MovesApi.new(current_access_token)
    (start_date..end_date).each do |date|
      result = api.summary(date)

      summaries.create! do |summary|
        summary.date = date
        summary.bicycling_distance = result[:bicycling].presence.try(:to_i) || 0
        summary.running_distance = result[:running].presence.try(:to_i) || 0
        summary.walking_distance = result[:walking].presence.try(:to_i) || 0
      end
    end
  end

  def total_points
    summaries.sum &:points
  end

  private

  def current_access_token
    oauth_tokens.order(:created_at).last.try :access_token
  end
end
