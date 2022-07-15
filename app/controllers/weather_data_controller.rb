require "http"

class WeatherDataController < ApplicationController
  def index
    coords_response = HTTP.get("http://api.openweathermap.org/geo/1.0/direct?q=London&limit=5", :params => {:appid => "858d41878334caa3c520d2407203523d"})
    parsed = JSON.parse(coords_response.body)
    lon = parsed[0]["lon"]
    lat = parsed[0]["lat"]

    weather_response = HTTP.get("https://api.openweathermap.org/data/2.5/weather?", :params => {:appid => "858d41878334caa3c520d2407203523d", :lat => lat, :lon => lon})
    
    @weather = JSON.parse(weather_response.body)
  end
end
