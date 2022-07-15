Rails.application.routes.draw do
  root to: 'weather_data#index'
  get '/weather_data' => 'weather_data#index'
end
