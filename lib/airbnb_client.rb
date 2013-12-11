require 'net/http'
require 'net/https'
require 'json'

class AirBnbClient
  HOST = "https://www.airbnb.com"
  SEARCH_ROOT = "/search/search_results.json"
  PORT = 443

  def initialize()
    uri = URI.parse HOST
    @https = Net::HTTP.new(uri, uri.port)
    @https.use_ssl = true
  end

  def search(location, start_date, end_date)
    availibility = Hash.new([])
    start_date.upto(end_date) do |date|
      host_ids = host_ids_for_day(location, date)
      availibility[date] += host_ids
      availibility[date].uniq!
    end

    availibility
  end

  private

  def host_ids_for_day(location, date)
    uri = URI.parse(HOST + SEARCH_ROOT)
    params = {
      location: location,
      checkin: format_date(date),
      checkout: format_date(date+1)
    }

    uri.query = URI.encode_www_form params

    json = JSON.parse Net::HTTP.get(uri)

    pricings = get_in_json json, %w(logging_info pricing)

    pricings.collect do |pricing|
      pricing['hosting_id'] if pricing['available']
    end.compact
  end


  def get_in_json(json, keypath)
    current_node = json
    keypath.each do |key|
      if next_node = current_node[key]
        current_node = next_node
      else
        return nil
      end
    end
    current_node
  end

  def format_date(date)
    date.strftime("%m/%d/%Y")
  end
end
