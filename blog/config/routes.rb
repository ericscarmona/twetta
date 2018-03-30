Rails.application.routes.draw do
  
  post '/search' => 'profile#search'
  
  get 'profile/index'

  get 'home/index'

  root 'home#index'

  get '/profile/:handle' => 'profile#index'
    
end
