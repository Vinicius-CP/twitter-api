class Twitter::PostWeather
  require 'twitter'

  attr_reader :message

  def initialize(message)
    @message = message
  end

  def tweet
    client.update(message)
  end

  private

  def client
    Twitter::REST::Client.new do |config|
      config.consumer_key        = Rails.application.credentials.dig(:twitter, :api_key)
      config.consumer_secret     = Rails.application.credentials.dig(:twitter, :api_secret)
      config.access_token        = Rails.application.credentials.dig(:twitter, :access_token)
      config.access_token_secret = Rails.application.credentials.dig(:twitter, :access_token_secret)
    end
  end
end
