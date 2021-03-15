class Api::V1::TwitterWeatherController < Api::V1::ApiController
  def week_weather
    message = Weather::GetWeek.new(weather_params).weather_info

    if error_message?(message)
      render json: { message: message }, status: 400
    else
      Twitter::PostWeather.new(message).tweet
      render json: { message: 'Tweet sended!' }, status: 200
    end
  end

  private

  def weather_params
    params.require(:twitter_weather)
  end

  def error_message?(message)
    message.class == Hash
  end
end
