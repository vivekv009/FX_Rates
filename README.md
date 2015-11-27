# FXRates

Simple Currency Converter based on ECB data

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'FX_Rates'
```

And then execute:
```ruby
    $ bundle
```   

Or install it yourself as:
```ruby
    $ gem install FX_Rates
```

## Usage

Create an instance of ExchangeRate class (Make sure you have network connection for latest rates) by:
```ruby
    $ require 'FX_Rates'
    $ rates = FXRates::ExchangeRate.new
```    

To view the list of currencies supported:
```ruby
    $ rates.currencies
```    

To view the list of dates for which rates are available (upto 90 days from current date):
```ruby
    $ rates.dates
```    

To convert between two available currencies on a specific date:
```ruby
    $ rates.at(date, from_currency, to_currency)
```    

## Contributing

1. Fork it ( https://github.com/[my-github-username]/FX_Rates/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
