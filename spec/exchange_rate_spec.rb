require "spec_helper"

module FXRates

	describe ExchangeRate do
		context "AUD to INR conversion" do

			let(:exchange_rate) { ExchangeRate.at("2015-04-02", "AUD", "INR") }

			it "returns a valid number" do
				expect(exchange_rate).to be > 0
			end
			
			it "returns a decimal number" do
				expect(exchange_rate.to_s).to be =~ /.(.*)/
			end	

		end	

		context "JPY to USD conversion" do

			let(:exchange_rate) { ExchangeRate.at("2015-04-07", "JPY", "USD") }

			it "returns a valid number" do
				expect(exchange_rate).to be > 0
			end
			
			it "returns a decimal number" do
				expect(exchange_rate.to_s).to be =~ /.(.*)/
			end	

		end


		context "To fetch currency list" do

			let(:currencies) { ExchangeRate.currency_list }

			it "returns an array of currencies" do
				expect(currencies).to be_a(Array)
			end

			it "returns an array with at least one element" do
				expect(currencies.size).to be > 0
			end

		end
	end
end	