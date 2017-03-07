require 'httparty'
require 'pry'

class WeatherExchange
  def conditions
    HTTParty.get('http://api.wunderground.com/api/07b67810d9df27fb/conditions/astronomy/forecast10day/alerts/q/60619.json')
  end
end
