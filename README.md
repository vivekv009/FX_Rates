# FXRates

Simple Currency Converter based on ECB data

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'FX_Rates'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install FX_Rates

## Usage

Create an instance of ExchangeRate class by (Make sure you have network connection for latest rates):
rates = FXRates::ExchangeRate.new

## To view the list of currencies supported:
rates.currencies

##  To view the list of dates for which rates are available (upto 90 days from current date):
rates.dates

## To convert between two available currencies on a certain date:
rates.at(date, from_currency, to_currency)

## Contributing

1. Fork it ( https://github.com/[my-github-username]/FX_Rates/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
