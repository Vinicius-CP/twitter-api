class Weather::GetWeek
  require 'open-uri'

  attr_reader :weather_params

  def initialize(weather_params)
    @weather_params = weather_params
  end

  def weather_info
    if valid_weather_params?
      week_weather_message
    else
      { error: 'Invalid parameters' }
    end
  end

  private

  def valid_weather_params?
    weather_params[:city].present? && 
      weather_params[:api_key].present?
  end

  def week_weather_message
    Weather::Message.new(current_weather, upcoming_weathers).formatted
  end

  def current_weather
    JSON.parse(open(weather_url('weather')).read, symbolize_names: true)
  end

  def upcoming_weathers
    JSON.parse(open(weather_url('forecast')).read, symbolize_names: true)
  end

  def weather_url(route)
    "https://api.openweathermap.org/data/2.5/#{route}"\
    "?q=#{weather_params[:city]}&appid="\
    "#{weather_params[:api_key]}&lang=pt_br&units=metric"
  end
end
