class User < ActiveRecord::Base
  # Associations
  has_many :oauth_tokens
  has_many :summaries

  def fetch_data_for_dates(start_date, end_date)
    api = MovesApi.new(current_access_token)
    (start_date..end_date).each do |date|
      result = api.summary(date)

      summary = summaries.where(date: date).first_or_create

      summary.bicycling_distance = result[:bicycling].presence.try(:to_i) || 0
      summary.running_distance = result[:running].presence.try(:to_i) || 0
      summary.walking_distance = result[:walking].presence.try(:to_i) || 0

      summary.save!
    end
  end

  def points_by_week
    return [] if summaries.blank?

    report = []
    date = first_sunday
    found_earliest_data = false

    while ( date < Date.today )
      report_item = { week_starting_on: date }

      week_summaries = summaries.between_dates(date, date + 6.days)
      points = week_summaries.sum(&:points)

      if !found_earliest_data && points > 0
        found_earliest_data = true
      end

      if found_earliest_data
        report_item[:points] = points
        report << report_item
      end

      date += 1.week
    end

    report
  end

  def total_points
    summaries.sum &:points
  end

  def update_data(oldest_date = nil)
    if oldest_date
      date = oldest_date
    elsif summaries.blank?
      date = Date.today - 1.month
    else
      date = summaries.order(:date).first.date
    end

    while (date <= Date.today )
      unless summaries.where(date: date).exists?
        puts "Fetching data for #{date}"
        fetch_data_for_dates date, date
      end

      date += 1.day
    end
  end

  private

  def first_sunday
    date = summaries.order('date ASC').first.date
    if date.sunday?
      date
    else
      while ( !date.sunday? )
        date -= 1.day
      end
      date
    end
  end

  def current_access_token
    oauth_tokens.order(:created_at).last.try :access_token
  end
end
