# bitbar-crypto-portfolio-ticker

This is a simple plugin for BitBar that shows you the total value of your cryptocurrency portfolio and its daily change.
![Imgur](https://i.imgur.com/ZaeMGF4.jpg)

## Installation

1) You must have [BitBar](https://getbitbar.com/) installed
    - Download `BitBar`
    - Drag it to `Applications` folder
    - Create and Choose a plugin folder (this is where your scripts will live)
2) Download this repo of (either with `git clone` or by downloading the `zip`)
3) Drag or copy the `portfolioticker.rb` file to the BitBar plugins folder
4) Launch the BitBar application and the data should appear.

#### *Note*
- I like to `clone` the repo into its own folder within the BitBar plugin folder and then copy the `.rb` file outside this folder. This allows you to keep the plugin up to date simply by running `git pull` inside the local repository folder.
- The folder will look something like this:
![Imgur](https://i.imgur.com/izyoTYK.png)

## Customization

To get the correct data into this plugin you will need to perform a few simple changes.
1) Open the `portfolioticker.rb` in your favourite text editor
2) There is a hashmap of cryptocurrencies and a number that look something like this:
https://imgur.com/WJuCDbf
```
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
 ```
 3) Edit this list of cryptos to match your portfolio and their respective amounts.
 4) Save the changes and refresh BitBar. You can BitBar by clicking on the `plugin` => `Prefernces` => `Refresh All`.
 
 ## Troubleshooting
 
 ### `launch path not accessible`
 This is a common error to see in your menu bar. This error happens when the script doesn't have the correct permissions on your machine.
 - To fix this type `chmod +x ~/BitBar/portfolioticker.rb` in your terminal. Keep in mind you need to change the path of this command depending on where your BitBar plugins are actually located.
 - Refresh BitBar and you should be good to go!
