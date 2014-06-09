require 'moves'
require 'date'

module MovesApi
  def initialize(access_token)
    @access_token = access_token
  end

  def do_things
    current_date = Date.new(2014,5,1)
    end_date = Date.today

    data = {}

    while (current_date < end_date)
      current_date_string = current_date_string.to_s
      end_date_string = end_date.to_s

      begin
        raw_data = moves.daily_summary(current_date)
      rescue RestClient::BadRequest
        # This happens if there is no data on that day
        raw_data = []
      end

      raw_data.each do |entry|
        date = entry['date']

        entry['summary'].each do |summary_item|
          activity = summary_item['activity']
          data[date] ||= {}
          data[date][activity] = summary_item['distance']
        end
      end

      current_date = current_date + 1
    #        if raw_data != []
    #          require 'pry'; binding.pry
    #        end
    end
  end
end
