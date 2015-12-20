module FXRates  

  class ExchangeRate < XMLData
    attr_accessor :currencies, :dates

    def initialize
        super
    end  

    def at(date, from_currency, to_currency)
        rate(date, to_currency).to_f / rate(date, from_currency).to_f 
    end
  end

end  