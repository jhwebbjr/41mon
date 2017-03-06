require "minitest/autorun"
require "minitest/pride"
require "minitest/focus"
require "webmock/minitest"
require_relative "./httparty"

class WeatherExchangeTest < Minitest::Test
  def test_can_get_most_recent_weather
    stub_request(:get, 'http://api.wunderground.com/api/07b67810d9df27fb/conditions/q/60619.json')
    .to_return(body: File.read("./stubbed_requests/get_questions.json"), headers: { 'Content-Type' => "application/json" })
  end
end
