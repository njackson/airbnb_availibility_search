require_relative './airbnb_client'
require 'date'
require 'text-table'

module AirbnbAvailibility
  extend self
  def print_week_availibility_table(city, date)

    table = Text::Table.new
    dates_host_ids = availibility(city, date.to_date + 30)

    host_ids = dates_host_ids.values.flatten.uniq
    dates = dates_host_ids.keys.sort

    table.head = [' ', *dates]

    host_ids.each do |host_id|
      row = [host_id]

      dates.each do |date|
        if dates_host_ids[date].include? host_id
          row << ' '
        else
          row << 'X'
        end
      end

      table.rows << row
    end

    puts table.to_s
  end

  def availibility(city, start_date)
    end_date = start_date + 7

    airbnb.search(city, start_date, end_date)
  end

  private

  def airbnb
    @_airbnb ||= AirBnbClient.new
  end
end

