require 'httparty'
require 'pry'

class WeatherExchange
  def questions
    HTTParty.get('http://api.wunderground.com/api/07b67810d9df27fb/forecast/geolookup/conditions/q/CA/60619.json')
  end
end
