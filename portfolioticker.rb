#!/usr/bin/ruby
# encoding: utf-8
# <bitbar.title>Crypto Portfolio Ticker</bitbar.title>
# <bitbar.version>v1.9</bitbar.version>
# <bitbar.author>Owen Craston</bitbar.author>
# <bitbar.author.github>owencraston</bitbar.author.github>
# <bitbar.desc>A ticker of your current portfolio value.</bitbar.desc>
# <bitbar.dependencies>ruby</bitbar.dependencies>

require 'open-uri'
require 'json'

class Portfolio
    # Edit the coins and number of coins you have of each:
    PORTFOLIO = {
        'ETH' => 18.75,
        'ZRX' => 10986.57375,
        'XLM' => 16714.989605,
        'BTC' => 0.59526,
        'KNC' => 1056,
        'NEO' => 23,
        'XMR' => 1,    
    }.freeze

    CURRENCY = 'USD'

    DEFAULT_PERIOD = '24h'

    def getCoinPrice(coin)
		    data = open("https://min-api.cryptocompare.com/data/price?fsym=#{coin}&tsyms=#{CURRENCY}").read
			coinPrice = JSON.parse(data)			
			coinPrice.values.first.to_f
    end

    def getPortfolioValue()
        coinValues = PORTFOLIO.map{ |coin, amount| getCoinPrice(coin)*amount }
        coinValues.inject(0, :+).round(3)
    end
end

# Create portfolio instance
portfolio = Portfolio.new
portfolioValue = portfolio.getPortfolioValue

# Begin output for bitbar

# create output variable
output = "#{portfolioValue}\n"
# print the output
puts output

