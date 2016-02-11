require 'rubygems'
require 'yahoo-finance'

class RbobMarket
  def initialize
    @month = Time.now.strftime('%b').to_sym
    @year = Time.now.strftime('%y')
    @code1 = 'RB'
    @code2 = '.NYM'
    @months = {
      Jan: 'F',
      Feb: 'G',
      Mar: 'H',
      Apr: 'J',
      May: 'K',
      Jun: 'M',
      Jul: 'N',
      Aug: 'Q',
      Sep: 'U',
      Oct: 'V',
      Nov: 'X',
      Dec: 'Z'
    }
  end

  def next_month
    next_month = @months[@month].next
    yahoo_client = YahooFinance::Client.new
    @year = @month == :Dec ? Time.now.strftime('%y').to_i + 1 : @year
    data = yahoo_client.quotes([(@code1 + next_month + @year.to_s + @code2).to_s])
    values = { last_trade_price: data[0].last_trade_price.to_s, change: data[0].change.to_s, previous_close: data[0].previous_close.to_s, last_trade_date: data[0].last_trade_date.to_s }
    values
  end

  def future(month, year)
    year = year.#TODO - Split year
    yahoo_client = YahooFinance::Client.new
    data = yahoo_client.quotes(["#{@code1 + @months[month.to_sym] + @year.to_s + @code2} "])
    values = { last_trade_price: data[0].last_trade_price.to_s, change: data[0].change.to_s, previous_close: data[0].previous_close.to_s, last_trade_date: data[0].last_trade_date.to_s }
    values
  end
end

puts 'Hello Welcome to Gasoline Market Tracker'

puts 'Please the following options'
puts "Type 'A' for Next month's market OR Type 'B' for inputing specific month"
option = gets.chomp.capitalize

if option == 'A'
  rbob = RbobMarket.new
  puts rbob.next_month
elsif option == 'B'
  rbob = RbobMarket.new
  puts 'Please input the month in 3 alphabet'
  month = gets.chomp.capitalize
  puts rbob.future(month)
else
  puts 'Oops something went wrong'
end
