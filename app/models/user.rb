class User < ActiveRecord::Base
  # Associations
  has_many :oauth_tokens
  has_many :summaries

  def fetch_data_for_dates(start_date, end_date)
    api = MovesApi.new(current_oauth_token)
    (start_date..end_date).each do |date|
      result = api.summary(date)

      summaries.create! do |summary|
        summary.date = date
        summary.bicycling_distance = result[:bicycling_distance].presence.try(:to_i) || 0
        summary.running_distance = result[:running_distance].presence.try(:to_i) || 0
        summary.walking_distance = result[:walking_distance].presence.try(:to_i) || 0
      end
    end
  end

  private

  def current_oauth_token
    oauth_tokens.order(:created_at).last
  end
end
