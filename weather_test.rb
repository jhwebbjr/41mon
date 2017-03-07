require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require "webmock/minitest"
require_relative "./httparty"
require "pry"

class WeatherExchangeTest < Minitest::Test
  def test_can_get_current_temp
    stub_request(:get, 'http://api.wunderground.com/api/07b67810d9df27fb/conditions/astronomy/forecast10day/alerts/q/60619.json')
    .to_return(body: File.read("./stubbed_requests/conditions_for_60619.json"), headers: { 'Content-Type' => "application/json" })

    exchange = WeatherExchange.new
    assert_equal "57.0 F (13.9 C)", exchange.conditions["current_observation"]["temperature_string"]
  end
focus
  def test_can_get_sunrise
    stub_request(:get, 'http://api.wunderground.com/api/07b67810d9df27fb/conditions/astronomy/forecast10day/alerts/q/60619.json')
    .to_return(body: File.read("./stubbed_requests/conditions_for_60619.json"), headers: { 'Content-Type' => "application/json" })

    exchange = WeatherExchange.new
    assert_equal "6", exchange.conditions["moon_phase"]["sunrise"]["hour"]
  end


end
