#!/usr/bin/ruby
# encoding: utf-8
# <bitbar.title>Crypto Portfolio Ticker</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Owen Craston</bitbar.author>
# <bitbar.author.github>owencraston</bitbar.author.github>
# <bitbar.desc>A ticker of your current portfolio value.</bitbar.desc>
# <bitbar.image>https://i.imgur.com/ZaeMGF4.jpg</bitbar.image>
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

    # 24 hours in seconds
    TWENTY_FOUR_HOURS = 86400

    def getCoinPrice(coin)
            data = open("https://min-api.cryptocompare.com/data/price?fsym=#{coin}&tsyms=#{CURRENCY}").read
            coinPrice = JSON.parse(data)		
			coinPrice.values.first.to_f
    end

    def getPrevDayCoinPrice(coin, timeStamp)
        data = open("https://min-api.cryptocompare.com/data/pricehistorical?fsym=#{coin}&tsyms=#{CURRENCY}&ts=#{timeStamp}").read
        coinPrice = JSON.parse(data)
        coinPrice.values.first.values.first.to_f
    end

    def getPortfolioValue()
        coinValues = PORTFOLIO.map{ |coin, amount| getCoinPrice(coin)*amount }
        coinValues.inject(0, :+).round(3)
    end

    def getPrevDay()
        timeStamp = (Time.now - TWENTY_FOUR_HOURS).to_i
    end

    def getPrevDayPortfolioValue()
        timeStamp = getPrevDay()
        coinValues = PORTFOLIO.map{ |coin, amount| getPrevDayCoinPrice(coin, timeStamp)*amount }
        coinValues.inject(0, :+).round(3)
    end

    def getPercentChange
        currentPortfolioValue = getPortfolioValue()
        prevdayPortfolioValue = getPrevDayPortfolioValue()
        amountChanged = currentPortfolioValue - prevdayPortfolioValue
        percentChange = ((amountChanged/prevdayPortfolioValue) * 100).round(3)
    end

    def createOutputString()
        currentPortfolioValue = getPortfolioValue()
        prevdayPortfolioValue = getPrevDayPortfolioValue()
        if currentPortfolioValue > prevdayPortfolioValue
            output = "🚀  #{getPortfolioValue()} +#{getPercentChange().abs}%"
        elsif currentPortfolioValue < prevdayPortfolioValue
            output = "⛷  #{getPortfolioValue()} -#{getPercentChange().abs}%"
        else 
            output = "#{getPortfolioValue()} #{getPercentChange().abs}%"
        end
    end
end

# Create portfolio instance
portfolio = Portfolio.new

# Begin output for bitbar
# create output variable
output = "#{portfolio.createOutputString()}\n"
# print the output
puts output

