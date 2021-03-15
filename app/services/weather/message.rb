class Weather::Message
  attr_reader :current_weather, :upcoming_weathers

  def initialize(current_weather, upcoming_weathers)
    @current_weather = current_weather
    @upcoming_weathers = upcoming_weathers
  end

  def formatted
    "#{current_weather_message} #{upcoming_weathers_message}"
  end

  private

  def current_weather_message
    "#{current_weather.dig(:main, :temp).to_i}ºC e "\
    "#{current_weather.dig(:weather)[0].dig(:description)} "\
    "em #{current_weather.dig(:name)} "\
    "em #{Time.now.strftime("%d/%m")}."
  end

  def upcoming_weathers_message
    "Média para os próximos dias:#{upcoming_days.delete_suffix(',')}."
  end

  def upcoming_days
    message = ''
    sum, count = 0, 1

    upcoming_weathers.dig(:list).each do |weather|
      sum += weather.dig(:main, :temp_max) + weather.dig(:main, :temp_min)
      if count % 8 == 0
        message += "#{average_temperature(sum)}"\
        "em #{weather.dig(:dt_txt).to_date.strftime("%d/%m")},"
        sum = 0
      end
      count += 1
    end
    message
  end

  def average_temperature(sum)
    " #{(sum / 16).to_i}ºC "
  end
end
