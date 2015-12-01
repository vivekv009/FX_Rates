require 'open-uri'
require 'nokogiri'
require 'date'

module FXRates
  class ExchangeRate

    attr_accessor :currencies, :dates

    def initialize
      fetch_data("data.xml") 
      @data_file = Nokogiri::XML File.open("data.xml")

      @dates = list_of_dates
      @currencies = list_of_currencies
    end  

    def at(date, from_currency, to_currency)
        get_rate_from_xml(date, to_currency).to_f / get_rate_from_xml(date, from_currency).to_f if @dates.include?(date)
    end




    private

    def get_rate_from_xml(date, currency)
       @data_file.xpath("//*[@time = '#{date}']").at_css("[@currency = '#{currency}']").attribute("rate").inner_text
    end 

    def list_of_dates   
       @data_file.xpath("//xmlns:Cube").map { |m| m.attribute("time")}.compact.map {|m| m.inner_text} if @data_file.xpath("//Cube")
    end  

    def list_of_currencies   
       @data_file.xpath("//*[@time = '#{@dates.max}']").children.map {|m| m.attribute("currency").inner_text} if @data_file.xpath("//*[@time = '#{@dates.max}']") 
    end 

    def fetch_data(file_name)
        begin
         remote_data = open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml").read
        rescue OpenURI::HTTPError => e
          puts "Error #{e}"
        end 

        File.open(file_name, 'w') { |file| file.write(remote_data) } if e.nil?
    end  


  end	
end
