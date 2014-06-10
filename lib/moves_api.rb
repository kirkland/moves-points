require 'date'

class MovesApi
  def initialize(access_token)
    @client = Moves::Client.new(access_token)
  end

  def summary(date)
    begin
      raw_data = @client.daily_summary(date.to_s).first['summary']
    rescue RestClient::BadRequest
      # This happens if there is no data on that day
      raw_data = []
    end

    Hash.new.tap do |rv|
      raw_data.each do |datum|
        if datum['activity'] == 'walking'
          rv[:walking] = datum['distance']
        elsif datum['activity'] == 'cycling'
          rv[:bicycling] = datum['distance']
        elsif datum['activity'] == 'running' # Guess the name
          rv[:running] = datum['distance']
        end
      end
    end
  end
end
