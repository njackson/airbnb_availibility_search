# AirbnbAvailibility

## Installation

Add this line to your application's Gemfile:

    gem 'airbnb_availibility_search', git: 'https://github.com/njackson/airbnb_availibility_search.git'

And then execute:

    $ bundle

## Usage

    >> require './lib/airbnb_availibility'
    => true
    >> AirbnbAvailibility.print_week_availibility_table("Raleigh, NC", Date.today)
    +---------+------------+------------+------------+------------+------------+------------+------------+------------+
    |         | 2014-01-09 | 2014-01-10 | 2014-01-11 | 2014-01-12 | 2014-01-13 | 2014-01-14 | 2014-01-15 | 2014-01-16 |
    +---------+------------+------------+------------+------------+------------+------------+------------+------------+
    | 1213126 |            |            |            |            |            |            |            |            |
    | 554069  |            |            |            |            |            |            |            |            |
    | 687864  |            |            |            |            |            |            |            |            |
    | 1360844 |            |            |            |            |            |            |            |            |
    | 1857266 |            |            |            |            |            |            |            |            |
    | 1489621 |            |            |            | X          | X          | X          | X          | X          |
    | 1755592 |            |            |            |            |            |            |            |            |
    | 435816  |            |            |            | X          | X          | X          | X          | X          |
    | 1703460 |            |            |            |            |            |            |            |            |
    | 934506  |            |            |            |            |            |            |            |            |
    | 1419653 |            |            |            |            |            |            |            |            |
    | 443465  |            |            |            |            |            |            |            |            |
    | 1037031 |            |            |            |            |            |            |            |            |
    | 626035  |            |            |            |            |            |            |            |            |
    | 998969  |            |            |            |            |            |            |            |            |
    | 699534  |            |            |            |            |            |            |            |            |
    | 694093  |            |            |            |            |            |            |            |            |
    | 805154  |            |            |            |            |            |            |            |            |
    | 187114  | X          | X          | X          |            |            |            |            |            |
    | 1354466 | X          | X          | X          |            |            |            |            |            |
    +---------+------------+------------+------------+------------+------------+------------+------------+------------+
    => nil

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
