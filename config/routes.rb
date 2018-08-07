Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'application#home'

  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  get ':id/delete'=> 'events#destroy'


  resources :users
  resources :events
  resources :rsvps, only: [:new, :destroy]
end
