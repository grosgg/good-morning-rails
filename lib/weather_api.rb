require 'httparty'
require 'json'

module WeatherApi
  def WeatherApi.conditions(key, country, town)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/conditions/q/#{country}/#{town}.json")
    response = JSON.parse(response.body)
    response["current_observation"]
  end

  def WeatherApi.astronomy(key, country, town)
    response = HTTParty.get("http://api.wunderground.com/api/#{key}/astronomy/q/#{country}/#{town}.json")
    response = JSON.parse(response.body)
    response["moon_phase"]
  end
end
