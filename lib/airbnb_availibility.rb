require 'date'
require 'net/http'
require 'net/https'
require 'json'

module AirbnbAvailibility
  def print_availibility_table
  end

  def availibility_table
    start_date = Date.today
    end_date = start_date + 7

    results = airbnb.search("Raleigh, NC", start_date, end_date)
    p results
  end

  private

  def airbnb
    @_airbnb ||= AirBnbClient.new
  end
end

class AirBnbClient
  HOST = "https://www.airbnb.com"
  SEARCH_ROOT = "/search/search_results"
  PORT = 443

  def initialize()
    uri = URI.parse HOST
    @https = Net::HTTP.new(uri, uri.port)
    @https.use_ssl = true
  end

  def search(location, start_date, end_date)
    dates = {}
    start_date.upto(end_date) do |date|
      dates[date] += host_ids_for_day(location, date)
      dates[date].uniq!
    end
  end

  def host_ids_for_day(location, date)
    uri = URI.parse(HOST + SEARCH_ROOT)
    params = {
      location: location,
      checkin: format_date(date),
      checkout: format_date(date+1)
    }

    json = JSON.parse Net::HTTP.get(uri)

    logging_info = json["logging_info"]
    availibility_list = json["pricing"]

    availibility_list.collect do |listing|
      listing["hosting_id"] if listing["available"]
    end.compact
  end

  private

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end
end
