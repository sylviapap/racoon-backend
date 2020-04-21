Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users
      resources :user_events
      resources :map_events
      resources :comments

      post '/auth', to: 'auth#create'
      get '/current_user', to: 'auth#show'
      post '/profile', to: 'user#profile'
      
    end
  end
end
