Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      get 'week_weather', to: 'twitter_weather#week_weather'
    end
  end
end
