require 'open-uri'
require 'nokogiri'
require 'date'

module FXRates
  class ExchangeRate

    attr_accessor :currencies, :dates

    def initialize
      fetch_data("data.xml") if !File.exist?('data.xml') || !file_today?("data.xml")
      @data_file = Nokogiri::XML File.open("data.xml")

      @dates = @data_file.xpath("//xmlns:Cube").map { |m| m.attribute("time")}.compact.map {|m| m.inner_text} if @data_file.xpath("//Cube") 
      @currencies = @data_file.xpath("//*[@time = '#{@dates.max}']").children.map {|m| m.attribute("currency").inner_text} if @data_file.xpath("//*[@time = '#{dates.max}']") 
    end  



  	def at(date, from_currency, to_currency)
        if @data_file.xpath("//*[@time = '#{date}']") 
           to_rate = @data_file.xpath("//*[@time = '#{date}']").at_css("[@currency = '#{to_currency}']").attribute("rate").inner_text
           from_rate = @data_file.xpath("//*[@time = '#{date}']").at_css("[@currency = '#{from_currency}']").attribute("rate").inner_text

           to_rate.to_f / from_rate.to_f
        end
  	end
    

    def fetch_data(file_name)
         remote_data = open("http://www.ecb.europa.eu/stats/eurofxref/eurofxref-hist-90d.xml").read
         File.open(file_name, 'w') { |file| file.write(remote_data) }
    end  



    def file_today?(file_name)
         File.ctime(file_name).strftime("%Y-%m-%d") == Date.today.strftime("%Y-%m-%d")
    end  
  	

  end	
end
