#!/usr/bin/env ruby
# encoding: utf-8

# <bitbar.title>Crypto Portfolio Ticker</bitbar.title>
# <bitbar.version>v1.0</bitbar.version>
# <bitbar.author>Owen Craston</bitbar.author>
# <bitbar.author.github>owencraston</bitbar.author.github>
# <bitbar.desc>A ticker of your current portfolio value.</bitbar.desc>
# <bitbar.dependencies>ruby</bitbar.dependencies>

require 'open-uri'
require 'json'

portfolio = {
    'ETH' => 18.75,
    'ZRX' => 10.986.57375,
    'XLM' => 16.714.989605,
    'BTC' => 0.59526,
    'KNC' => 1.056.00,
    'NEO' => 23,
    'XMR' => 1,    
}.freeze

# Edit the coins and number of coins you have of each:


DEFAULT_PERIOD = '24h'

URL = 'https://api.coinmarketcap.com/v1/ticker/'

